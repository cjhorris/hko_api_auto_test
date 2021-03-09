from behave import step

from services.weather_api_service import WeatherApiService
from utils.step_utils import StepsUtils


@step("WeatherAPI get request")
def get_current_weather_report(context):
    params = StepsUtils().convert_table_to_dict(context)
    context.response = WeatherApiService().get_current_weather_report(params)


@step('WeatherAPI check status code "{status_code}"')
def check_status_code(context, status_code):
    assert context.response.status_code == int(status_code), \
        f"api request status code verify fail. Expected: {status_code}, Actual: {context.response.status_code}"


@step('WeatherAPI check response data "{response_property}"')
def check_response_data(context, response_property):
    actual_result = context.response.json()[response_property]['data']
    expected_result = StepsUtils().convert_table_to_array(context)
    StepsUtils().compare_dict_in_array(actual=actual_result, expected=expected_result)


@step('WeatherAPI verify "{response_property}" recordTime')
def verify_record_time(context, response_property):
    record_time = context.response.json()[response_property]['recordTime']
    WeatherApiService().verify_time_within_one_hour(record_time)


@step('WeatherAPI check error message "{error_message}"')
def verify_error_message(context, error_message):
    actual_error_message = context.response.text
    WeatherApiService().verify_error_message(actual_error_message=actual_error_message,
                                             expected_error_message=error_message)
