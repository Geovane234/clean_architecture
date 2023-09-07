# clean_architecture

A new Flutter project.

## Getting Started
Project Description
Data
The data layer is the outermost layer of the application and is responsible for communicating with the server-side or a local database and data management logic. It also contains repository implementations.

a. Data Source
Describes the process of acquiring and updating the data. Consist of remote and local Data Sources. Remote Data Source will perform HTTP requests on the API. At the same time, local Data sources will cache or persist data.

b. Repository
The bridge between the Data layer and the Domain layer. Actual implementations of the repositories in the Domain layer. Repositories are responsible for coordinating data from the different Data Sources.

Domain
The domain layer is responsible for all the business logic. It is written purely in Dart without flutter elements because the domain should only be concerned with the business logic of the application, not with the implementation details.

a. Providers
Describes the logic processing required for the application. Communicates directly with the repositories.

b. Repositories
Abstract classes that define the expected functionality of outer layers.

Presentation
The presentation layer is the most framework-dependent layer. It is responsible for all the UI and handling the events in the UI. It does not contain any business logic.

a. Widget (Screens/Views)
Widgets notify the events and listen to the states emitted from the StateNotifierProvider.

b. Providers
Describes the logic processing required for the presentation. Communicates directly with the Providers from the domain layer.

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
