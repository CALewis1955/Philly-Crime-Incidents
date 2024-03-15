
@data_exporter
def export_data(data):

    from google.cloud import bigquery

    # Initialize a BigQuery client
    client = bigquery.Client()

    # Define your GCS bucket and file name for the Parquet file
    bucket_name = 'philly-crime-incidents-terraform-bucket'
    file_name = f'crine_data_2008.parquet'


    # Construct the fully qualified table ID
    dataset_id = 'philly_crime_data'
    table_id = f'crime_data_2008_replacement'
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

    return  