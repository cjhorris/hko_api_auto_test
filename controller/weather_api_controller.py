import logging

import requests

LOGGER = logging.getLogger(__name__)


class WeatherApiController:
    def __init__(self):
        self.host = 'https://data.weather.gov.hk'

    def get_current_weather_report(self, request_params):
        path = '/weatherAPI/opendata/weather.php'
        response = requests.get(url=self.host + path, params=request_params)
        LOGGER.info(f"GET request current weather report response:{response.text}")
        return response
