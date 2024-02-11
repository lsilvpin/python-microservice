import os
from dotenv import load_dotenv

def load_environment(env):
    """
    Load environment variables from a .env file.
    
    :param env: The environment to load. Should be one of 'dev', 'hml', 'prd'.
    """
    # Define the .env file to load based on the environment
    env_file = f'.env.{env}.env'
    
    # Check if the .env file exists
    if not os.path.exists(env_file):
        raise Exception(f'Environment file {env_file} does not exist.')
    
    # Load the .env file
    load_dotenv(dotenv_path=env_file)

def get(key: str):
    """
    Get the value of an environment variable.
    
    :param key: The name of the environment variable to get.
    :return: The value of the environment variable.
    """
    return os.getenv(key)