# Studies Example

This package serves as a template (or primitive example) of creating custom study (metrics) to be tracked on the chain
data. So you can create your own metric based on the provided data through database and then cache (save) these
metrics to your own schema in the database.

## Usage

Main application can be started with `main.py`, where is an example how to start service which periodically runs
scheduled jobs that can be some data obtaining -> calculating metrics -> saving to the database.

Needed configurations like Database credentials are provided through `.env` file.

Example of `.env` file:

```dotenv
DB_USER=<data_db_user>
DB_PASSWORD=<your_password>
DB_NAME=<catalog_name>
DB_HOSTNAME=<hostname>
DB_PORT=<port>

STUDIES_DB_USER=<studies_db_user>
STUDIES_DB_PASSWORD=<your_pass>
STUDIES_DB_NAME=<db_name>
STUDIES_DB_HOSTNAME=<hostname>
STUDIES_DB_PORT=<port>
```
where: 
* `DB` credentials are used for Database to obtain data from, so there are **read-only rights**. 
* `STUDIES_DB` credentials are used for saving/reading your own studies to the specific DB for you.

In the *[example](/example)* directory are two files with example classes:

* `example_class.py` contains `Example` class that holds example methods of:
    * obtaining raw data from the database
    * computing custom metrics
    * saving computed example metrics to the database (with use of example database model)
* `example_db_model.py` contains `ExampleDBModel` class that represents example database model for custom study with
  columns definition with its required settings. It also contains method for initialization database table based on the
  model and method for saving records to the database.

-------------------------------------------

[![](https://img.shields.io/badge/get%20back-%E2%86%A9-blue)](../.)