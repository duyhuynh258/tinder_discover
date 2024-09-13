# Tinder Discover

This project is a Flutter application that mimics Tinder's swipe card functionality. It is designed to demonstrate Flutter's gesture detection, animations, and state management.

https://github.com/user-attachments/assets/c83a36af-ae82-4537-980f-a61c8b4fa1e7

## Architecture

The project follows a simple yet effective architecture to keep the codebase clean and maintainable. The main components are:

- **Presentation**: 
  - Contains all the widgets and UI-related code.
  - **State Management**: ChangeNotifier - Flutter's built-in state management.
  - **Widgets**: Contains all the widgets used in the application.
  - **Dependency Injection**: Contains the dependency injection code.

- **Domain**: 
  - Contains all the business logic and domain-specific code.
  - **Entities**: Contains all the models and entities used in the application.
  - **Repositories**: Contains the abstract classes for the repositories.
  - **Failures**: Contains all the possible failures that can occur in the application.
  - **Result**: Contains the result class that is used to return the result of an operation.

- **Data**: 
  - Contains all the data-related code.
  - **Data Sources**: Contains the data sources used to fetch data from the network or local storage.
  - **Repositories**: Contains the implementation of the repositories.


### Directory Structure
```
lib
├── data
│   ├── profile_data_source.dart
│   ├── profile_dto.dart
│   └── profile_repository_impl.dart
├── domain
│   ├── failure.dart
│   ├── profile.dart
│   ├── profile_failure.dart
│   ├── profile_repository.dart
│   └── result.dart
├── main.dart
├── presentation
│   ├── discover_notifier.dart
│   ├── discover_screen.dart
│   └── widgets
└── shared
    └── di.dart
```


## Flutter version
- Flutter 3.22.3 • channel stable
