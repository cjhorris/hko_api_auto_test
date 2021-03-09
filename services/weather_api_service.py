import logging
from datetime import datetime
import pytz

from controller.weather_api_controller import WeatherApiController

LOGGER = logging.getLogger(__name__)


class WeatherApiService:
    @staticmethod
    def get_current_weather_report(params):
        LOGGER.info(f"Sending GET request for current weather report with params: {params}")
        response = WeatherApiController().get_current_weather_report(params)
        return response

    @staticmethod
    def verify_time_within_one_hour(record_time):
        hk_tz = pytz.timezone('Hongkong')
        time_format = "%Y-%m-%dT%H:%M:%S+08:00"
        now = datetime.now(tz=hk_tz).strftime(time_format)
        response_time = record_time
        time_diff = datetime.strptime(now, time_format) - datetime.strptime(response_time, time_format)

        # the update time might be evey hour in min 5
        assert time_diff.seconds <= 3900, \
            LOGGER.error(f"record time is not updated in 1 hour, time difference: {time_diff}")

    @staticmethod
    def verify_error_message(actual_error_message, expected_error_message):
        assert expected_error_message in actual_error_message, \
            LOGGER.error(f"Error message verification error, expected: {expected_error_message}, "
                         f"actual: {actual_error_message}")
