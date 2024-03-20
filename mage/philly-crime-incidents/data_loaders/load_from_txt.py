import io
import pandas as pd
import os
from os.path import join

if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@data_loader
def load_data_from_api(*args, **kwargs):
    """
    Template for loading data from API
    """
    path_to_data = 'data/csv'

    txt_file = '2008_crime_incidents.txt'
    df = pd.read_csv(join(path_to_data, txt_file))
            
    return df

        
@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output is not None, 'The output is undefined'
