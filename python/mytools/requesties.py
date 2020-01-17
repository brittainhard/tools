import requests

class Responsy(requests.models.Response):
    
    @property
    def potato(self):
        return 1
