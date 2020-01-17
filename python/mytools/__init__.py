import requests
from .requesties import Responsy

requests.models.Response = Responsy
