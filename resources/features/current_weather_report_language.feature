@current_weather_report_language @language
Feature: Current Weather Report check response in different language
  Request different lang parameters and check the response as shown as expected

  Scenario Outline: Check if default language is en with request without lang
    Given WeatherAPI get request
      | dataType |
      | rhrread  |
    When WeatherAPI check status code "200"
    Then WeatherAPI check response data "<response_property>"
      | place         |
      | <check_value> |
    Examples:
      | response_property | check_value                    |
      | temperature       | King's Park                    |
      | rainfall          | Central &amp; Western District |
      | humidity          | Hong Kong Observatory          |

  Scenario: check temperature english responses
    Given WeatherAPI get request
      | dataType | lang |
      | rhrread  | en   |
    When WeatherAPI check status code "200"
    Then WeatherAPI check response data "temperature"
      | unit | place                 |
      | C    | King's Park           |
      | C    | Hong Kong Observatory |

  Scenario: check temperature traditional chinese responses
    Given WeatherAPI get request
      | dataType | lang |
      | rhrread  | tc   |
    When WeatherAPI check status code "200"
    Then WeatherAPI check response data "temperature"
      | unit | place |
      | C    | 京士柏   |
      | C    | 香港天文台 |

  Scenario: check temperature simplified chinese responses
    Given WeatherAPI get request
      | dataType | lang |
      | rhrread  | sc   |
    When WeatherAPI check status code "200"
    Then WeatherAPI check response data "temperature"
      | unit | place |
      | C    | 京士柏   |
      | C    | 香港天文台 |

  Scenario: check rainfall english responses
    Given WeatherAPI get request
      | dataType | lang |
      | rhrread  | en   |
    When WeatherAPI check status code "200"
    Then WeatherAPI check response data "rainfall"
      | unit | place                          |
      | mm   | Central &amp; Western District |
      | mm   | Eastern District               |

  Scenario: check rainfall english responses
    Given WeatherAPI get request
      | dataType | lang |
      | rhrread  | en   |
    When WeatherAPI check status code "200"
    Then WeatherAPI check response data "rainfall"
      | unit | place                          |
      | mm   | Central &amp; Western District |
      | mm   | Eastern District               |

  Scenario: check rainfall traditional chinese responses
    Given WeatherAPI get request
      | dataType | lang |
      | rhrread  | tc   |
    When WeatherAPI check status code "200"
    Then WeatherAPI check response data "rainfall"
      | unit | place |
      | mm   | 中西區   |
      | mm   | 東區    |

  Scenario: check rainfall simplified chinese responses
    Given WeatherAPI get request
      | dataType | lang |
      | rhrread  | sc   |
    When WeatherAPI check status code "200"
    Then WeatherAPI check response data "rainfall"
      | unit | place |
      | mm   | 中西区   |
      | mm   | 东区    |

  Scenario Outline: check humidity language responses
    Given WeatherAPI get request
      | dataType | lang       |
      | rhrread  | <language> |
    When WeatherAPI check status code "200"
    Then WeatherAPI check response data "humidity"
      | unit    | place            |
      | percent | <expected_place> |
    Examples:
      | language | expected_place        |
      | en       | Hong Kong Observatory |
      | tc       | 香港天文台                 |
      | sc       | 香港天文台                 |

#only run at day time
#  Scenario Outline: check uvindex language responses
#    Given WeatherAPI get request
#      | dataType | lang       |
#      | rhrread  | <language> |
#    When WeatherAPI check status code "200"
#    Then WeatherAPI check response data "uvindex"
#      | place            |
#      | <expected_place> |
#    Examples:
#      | language | expected_place |
#      | en       | King's Park    |
#      | tc       | 京士柏            |
#      | sc       | 京士柏            |