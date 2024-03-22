from google.cloud import bigquery
if 'data_exporter' not in globals():
    from mage_ai.data_preparation.decorators import data_exporter


@data_exporter
def export_data_to_google_cloud_storage(data, **kwargs) -> None:
    
    # Initialize a BigQuery client
    client = bigquery.Client()

    # Define your GCS bucket and file name for the Parquet file
    bucket_name = 'philly-crime-incidents-terraform-bucket'
    dataset_id = 'final_project_dataset'


    for year in range(2006, 2024):

        table_id = f'crime_data_{year}'

        file_name = f'crime_data_{year}.parquet'

        # Construct the fully qualified table ID
        table_ref = client.dataset(dataset_id).table(table_id)

        # Set up the job configuration to load data from a Parquet file
        job_config = bigquery.LoadJobConfig()
        job_config.source_format = bigquery.SourceFormat.PARQUET

        # Construct the URI for your Google Cloud Storage file
        uri = f'gs://{bucket_name}/{file_name}'

        # Start the load job
        load_job = client.load_table_from_uri(
            uri,
            table_ref,
            job_config=job_config
        )

        # Wait for the job to complete
        load_job.result()

        print(f'Table {table_id} in dataset {dataset_id} loaded successfully.')
