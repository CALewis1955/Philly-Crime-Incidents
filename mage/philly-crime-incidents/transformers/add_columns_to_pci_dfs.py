if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test

import pandas as pd
from datetime import datetime


@transformer
def transform(df, *args, **kwargs):
    """
    Template code for a transformer block.

    Add more parameters to this function if this block has multiple parent blocks.
    There should be one parameter for each output variable from each parent block.

    Args:
        data: The output from the upstream parent block
        args: The output from any additional upstream blocks (if applicable)

    Returns:
        Anything (e.g. data frame, dictionary, array, int, str, etc.)
    """
    # Specify your transformation logic here
    
       # convert all datatypes
    df = df.convert_dtypes()

    # convert dates/times to datetime format
    df['dispatch_date_time'] = pd.to_datetime(df['dispatch_date_time'])
    df['dispatch_date'] = pd.to_datetime(df['dispatch_date'])
    df['dispatch_time'] = pd.to_datetime(df['dispatch_time'])
    
    # add column for day of week
    #df['day_of_week'] = df['dispatch_date'].dt.day_name.as_type('|S')
    df['day'] = df['dispatch_date'].dt.day_name()
    df['month'] = df['dispatch_date'].dt.month
    df['quarter'] = df['dispatch_date'].dt.quarter

    return df


@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output is not None, 'The output is undefined'
