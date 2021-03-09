@current_weather_report @time_validation
Feature: Current Weather Report Time validation

  Scenario: Check temperature recordTime is within one hour
    Given WeatherAPI get request
      | dataType | lang |
      | rhrread  | en   |
    When WeatherAPI check status code "200"
    Then WeatherAPI verify "temperature" recordTime

  Scenario: Check humidity recordTime is within one hour
    Given WeatherAPI get request
      | dataType | lang |
      | rhrread  | en   |
    When WeatherAPI check status code "200"
    Then WeatherAPI verify "humidity" recordTime
