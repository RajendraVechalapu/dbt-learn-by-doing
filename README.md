python -m venv venv
.\venv\Scripts\activate
python.exe -m pip install --upgrade pip

/*
Uninstall dbt Cloud CLI (if you don’t need it):
    pip uninstall dbt-cloud-cli

Install dbt Core with the adapter for your database (e.g., Postgres, Snowflake, BigQuery):
    pip install dbt-core dbt-postgres  # Change 'dbt-postgres' based on your database

Verify Installation:
dbt --version

Now, run init:
    dbt init dbtdemo1

*/

--dbt connection profile
C:\Users\rajen\.dbt\profile.yml

pip freeze > requirements.txt
#ensure remove install from requirements.txt after freeze command


$env:DATABASE_URL = "postgresql://rajpostgressql_user:QfEIQR6tHAfUWFSwIIUxhmlAd4ozL0lZ@dpg-cma94evqd2ns73bd3bmg-a.oregon-postgres.render.com/rajpostgressql"
$env:FLASK_APP = "myapp"
flask run --reload

pip install -r requirements.txt
pip install --default-timeout=100 -r requirements.txt


Delete the existing virtual environment (if applicable):
    Remove-Item -Recurse -Force venv

--Uninstalls
pip list
pip freeze > unins ; pip uninstall -y -r unins ; del unins
