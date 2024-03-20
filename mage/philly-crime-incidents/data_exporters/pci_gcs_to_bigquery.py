from mage_ai.settings.repo import get_repo_path
from mage_ai.io.bigquery import BigQuery
from mage_ai.io.config import ConfigFileLoader
from pandas import DataFrame
from os import path

if 'data_exporter' not in globals():
    from mage_ai.data_preparation.decorators import data_exporter


@data_exporter
def export_data_to_big_query(data, **kwargs) -> None:
    """
    Template for exporting data to a BigQuery warehouse.
    Specify your configuration settings in 'io_config.yaml'.

    Docs: https://docs.mage.ai/design/data-loading#bigquery
    """

    gcs_file_path = 'gs://philly-crime-incidents-terraform-bucket/philly-crime-incidents'
    table_id = 'philly-crime-incidents.philly-crime-incidents-terraform-bucket.crime_data_2006.parquet'
    #'your-project.your_dataset.your_table_name'
    config_path = path.join(get_repo_path(), 'io_config.yaml')
    config_profile = 'default'

 # Load data from GCS and upload to BigQuery
    loader = BigQuery.with_config(ConfigFileLoader(config_path, config_profile))
    df = loader.load(gcs_file_path) # Assuming CSV format for simplicity
    loader.export(df, table_id, if_exists='replace')

   