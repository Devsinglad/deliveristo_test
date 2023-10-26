# **Dog Image Viewer App**

The Dog Image Viewer App is a Flutter application designed to showcase images of dogs, categorized by different breeds and sub-breeds. Users can explore a variety of adorable dog images, and the app also provides a mechanism to search for specific breeds and sub-breeds. This README provides an overview of the app, its code architecture, and the implemented widget tests.

## Features

1. View random dog images by breed.
2. Browse a list of dog breeds and sub-breeds.
3. Search for images by breed and sub-breed.
4. Clean and intuitive user interface.


## Code Architecture

The Dog Image Viewer App follows a clean and modular code architecture to ensure maintainability and scalability. Here's a brief overview of the code structure:

## Project Structure

lib: Contains the main source code for the app.
components: Reusable UI components.
models: Data models for dog breeds and images.
pages: Individual pages of the app.
providers: Data providers using the Provider package for state management.
services: Networking and data fetching services.
tests: Widget tests for UI components and features.
service: Utility functions and helper classes.
main.dart: Entry point of the app.

## State Management

The app uses the Provider package for state management. Different providers handle data related to dog breeds, images, and search functionality.

## Widget Tests

The app includes a comprehensive set of widget tests to ensure that the UI components and features are working as expected. These tests can be found in the "tests" directory.
Widget Tests
Widget tests are implemented to verify the functionality of various UI components and features within the app. These tests are designed to simulate user interactions and ensure the app behaves correctly. Some of the key widget tests include:
Test for navigating from the home page to the "RandomBreedPage."
Test for searching for dog images based on user input.
Test for tapping on suggestions to trigger image loading.
Widget tests are an essential part of the development process as they help maintain the quality and reliability of the app's UI.

 ## Getting Started
To run the Dog Image Viewer App on your local machine, follow these steps:

Ensure you have Flutter and Dart installed.

**Clone the project repository**:


git clone https://github.com/Devsinglad/deliveristo_test.git
Navigate to the project directory:

flutter pub get
Run the app on your preferred device (emulator or physical device):


flutter run

## Contributions
Contributions to the Dog Image Viewer App are welcome! Feel free to submit issues, feature requests, or pull requests.



This README file provides an overview of the Dog Image Viewer App, its code architecture, and the implemented widget tests. Users and contributors can refer to this document for information on how to get started with the app and understand its structure.