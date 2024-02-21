# Weather App Documentation

## Introduction
This document serves as the documentation for the weather application developed as part of the assignment for the `rannlab_assignment` project. The purpose of this application is to provide users with real-time weather information for a given location. It fetches data from the WeatherBit API and presents it in a user-friendly interface.

## Features
- **User Interface (UI)**:
  - Text field to input the location or pincode.
  - Section to display current weather conditions including temperature, humidity, and description.
  - Section for error messages or notifications.
- **Weather Data Fetching**:
  - Utilizes the WeatherBit API to fetch real-time weather data based on user-entered location.
- **Data Parsing**:
  - Extracts temperature, humidity, and weather description from the received weather data.
- **Error Handling**:
  - Handles errors during API calls or data parsing and displays appropriate error messages.
- **Input Validation**:
  - Implements basic input validation to ensure the user enters a valid location.
- **Additional Features**:
  - Follows the MVC (Model-View-Controller) architecture.
  - Utilizes the feature-first approach for development.
  - Utilizes Provider for State Management throughout the appliaction.

## Usage
Upon launching the application, users are presented with a simple interface where they can input a location or pincode of the location. After entering a valid location and tapping the search button, the application fetches real-time weather data from the WeatherBit API. The retrieved data is then parsed and displayed on the UI, showing the current temperature, humidity, and weather description. In case of any errors during the process, appropriate error messages are displayed to the user.

## Folder Structure
I utilized a custom template (which I created) for the folder structure, designed to seamlessly integrate APIs and handle errors effectively. This template is available on my GitHub profile for reference.
Template repo link - https://github.com/sauravbauddh/flutter-mvvm-template 


