import datetime
import logging
import os
import trino

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from example.example_db_model import ExampleDBModel, create_batch

example_logger = logging.getLogger('example')
example_logger.setLevel(logging.INFO)


class Example:
    def __new__(cls, *args, **kwargs):
        return super().__new__(cls)

    def __init__(self):
        """
        Initializing new object.
        """

        # database connection for data
        db_user = os.getenv("DB_USER")
        db_pass = os.getenv("DB_PASSWORD")
        db_host = os.getenv("DB_HOSTNAME")
        db_port = os.getenv("DB_PORT")
        db_name = os.getenv("DB_NAME")
        if db_user is not None and db_pass is not None and db_host is not None and db_port is not None and \
                db_name is not None:
            conn = trino.dbapi.connect(
                host=db_host,
                port=db_port,
                user=db_user,
                catalog=db_name,
            )
            self.trino_connection = conn
        else:
            self.trino_connection = None
            example_logger.warning("trino DB is not set -> continue without it")

        # database connection for storing studies
        studies_db_user = os.getenv("STUDIES_DB_USER")
        studies_db_pass = os.getenv("STUDIES_DB_PASSWORD")
        studies_db_host = os.getenv("STUDIES_DB_HOSTNAME")
        studies_db_port = os.getenv("STUDIES_DB_PORT")
        studies_db_name = os.getenv("STUDIES_DB_NAME")
        if studies_db_user is not None and studies_db_pass is not None and studies_db_host is not None and \
                studies_db_port is not None and studies_db_name is not None:
            studies_db_string = "postgresql+psycopg2://{user}:{password}@{hostname}:{port}/{db}".format(
                user=studies_db_user,
                password=studies_db_pass,
                hostname=studies_db_host,
                port=studies_db_port,
                db=studies_db_name)
            self.studies_db_engine = create_engine(studies_db_string, pool_size=10, max_overflow=0, pool_recycle=1800)
        else:
            self.studies_db_engine = None
            example_logger.warning("studies DB is not set -> continue without it")

    def get_data(self) -> list[dict]:
        """
        Request data from Trino DB.
        :return: list[dict]: array of dictionary with data (from DB or sample data)
        """
        if self.trino_connection is None:
            # some example data
            ex_data = []
            for i in range(5):
                ex_data.append(
                    {"index": i, "price": 25 + i}
                )
            return ex_data
        else:
            example_query = 'SELECT * from chain_bsc.price_ticks_hourly where token_id = 23 order by bucket desc limit 5'
            cur = self.trino_connection.cursor()
            cur.execute(example_query)
            columns = cur.description
            result = []
            for row in cur:
                row_dict = {}
                for i, col in enumerate(columns):
                    row_dict[col[0]] = row[i]
                result.append(row_dict)

            cur.close()
            return result

    def compute_study(self, data: list[dict]):
        """
        Do some sick computation of your study
        :param data: raw data to be processed.
        :return: processed data
        """
        # do some heavy computation here
        timestamp = datetime.datetime.utcnow()
        res = []
        for d in data:
            ex = ExampleDBModel(timestamp=timestamp, data=d)
            res.append(ex)
        return res

    def save_data(self, data):
        """
        Save computed data to the database for study.

        :param data: any computed study data.
        :return:
        """
        if self.studies_db_engine is None:
            print(data)
            return

        session_maker = sessionmaker(bind=self.studies_db_engine)
        db_session = session_maker()
        create_batch(data, db_session)
        db_session.close()
