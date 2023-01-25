import datetime
import logging
import os

from sqlalchemy import create_engine

from sqlalchemy import (
    Column,
    Integer,
    DateTime,
    JSON,
)
from sqlalchemy.orm import declarative_base
from sqlalchemy.orm import session
import json

example_logger = logging.getLogger('example')
example_logger.setLevel(logging.INFO)

Base = declarative_base()


class ExampleDBModel(Base):
    """
    Example model to hold your study data. It also serves as database model.
    """
    __tablename__ = 'example_data'
    id = Column(Integer, primary_key=True, autoincrement=True)
    timestamp = Column(DateTime(timezone=True), index=True)
    data = Column(JSON, nullable=True)
    __table_args__ = ({"schema": "client_1"})

    def __init__(self, timestamp: datetime, data):
        self.timestamp = timestamp
        self.data = data

    def __iter__(self):
        """
        Iterator for object.
        """
        yield from {
            "id": self.id,
            "timestamp": self.timestamp,
            "data": self.data,
        }.items()

    def __str__(self):
        """
        String representation of the object.
        """
        return json.dumps(self.to_json(), default=str)

    def __repr__(self):
        """
        Default representation of the object.
        """
        return self.__str__()

    def to_json(self):
        """
        Parse object to the JSON type dictionary.
        """
        to_return = {"timestamp": self.timestamp, "data": self.data}
        if self.id != 0:
            to_return["id"] = self.id

        return to_return


def create_batch(objs: list[ExampleDBModel], db_session: session):
    """
    Create ExampleDBModel records to the given database.
    """
    if len(objs) == 0:
        return
    for obj in objs:
        db_session.add(obj)

    db_session.commit()


def create_table():
    """
    Creates studies table based on the study model.
    """
    studies_db_user = os.getenv("STUDIES_DB_USER")
    studies_db_pass = os.getenv("STUDIES_DB_PASSWORD")
    studies_db_host = os.getenv("STUDIES_DB_HOSTNAME")
    studies_db_port = os.getenv("STUDIES_DB_PORT")
    studies_db_name = os.getenv("STUDIES_DB_NAME")
    db_string = "postgresql+psycopg2://{user}:{password}@{hostname}:{port}/{db}".format(
        user=studies_db_user,
        password=studies_db_pass,
        hostname=studies_db_host,
        port=studies_db_port,
        db=studies_db_name)
    engine = create_engine(db_string)
    ExampleDBModel.metadata.create_all(engine)
