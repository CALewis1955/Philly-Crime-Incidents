from google.cloud import bigquery

# Initialize a BigQuery client
client = bigquery.Client()

# Define your GCS bucket and file name for the Parquet file
bucket_name = 'philly-crime-incidents-terraform-bucket'
dataset_id = 'philly-crime-incidents'
table_id = 'philly_crime_data'


for year in range(2006, 2023):

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
