import schedule
import time
import dotenv

from example.example_class import Example
from example.example_db_model import create_table

# load .env file with given DB parameters
dotenv.load_dotenv('.env')
example_study = Example()


def job():
    """
    Example primitive job that can be called periodically with 'schedule' scheduler
    """
    print("I'm working...")
    data = example_study.get_data()
    study = example_study.compute_study(data)
    example_study.save_data(study)


def job_with_argument(name):
    """
    Example job with parameter that can be called periodically with 'schedule' scheduler
    :param name: some custom parameter
    """
    print(f"Called job with parameter: {name}")


if __name__ == '__main__':
    # if table DB should be created, use example method for creating it
    create_table()

    # call primitive job at start and then schedule primitive job and job with parameter
    job()
    schedule.every().minute.at(":17").do(job)
    schedule.every(10).seconds.do(job_with_argument, name="Peter")

    # blocking loop which checks and run pending jobs every second
    while True:
        schedule.run_pending()
        time.sleep(1)
