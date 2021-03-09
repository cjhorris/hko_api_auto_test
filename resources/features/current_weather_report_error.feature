@current_weather_report_error @error_scenarios
Feature: Current Weather Report Error Test Cases

  Scenario Outline: Current Weather Report wrong lang
    When WeatherAPI get request
      | dataType | lang         |
      | rhrread  | <lang_value> |
    Then WeatherAPI check error message "Please include valid parameters in API request."
    Examples:
      | lang_value          |
      | eng                 |
      | cnn                 |
      | Traditional Chinese |
      | Simplified Chinese  |
      | ""                  |

  Scenario Outline: Current Weather Report wrong data type
    When WeatherAPI get request
      | dataType          | lang |
      | <data_type_value> | en   |
    Then WeatherAPI check error message "Please include valid parameters in API request."
    Examples:
      | data_type_value        |
      | rhrreadd               |
      | Current Weather Report |
      | dataType               |
      | ""                     |


