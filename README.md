## Star Wars Wiki - Star Wars Planet Finder App (iOS)

This application can be able to view all Star wars planet details.

## Demo of App
![Demo App](/demo/demo.gif)

## Architecture and libraries
The Project follows the **MVVM** architectural pattern and uses the **swiftUI** to build up the UI.

__The general explanation of the MVVM pattern are the following:__

- The ViewModel is responsible for managing the data and state of the view. It gets data from the model, transforms it into a format that the view can understand, and exposes it to the view through bindings.
- The View is responsible for displaying the data and state provided by the ViewModel. It does not interact with the model directly.
- The bindings are the links between the ViewModel and the View. They allow the ViewModel to update the view whenever the data or state changes, and they allow the view to update the ViewModel whenever the user interacts with it.
- In here, the ViewModel is implemented as a struct that conforms to the ObservableObject protocol. This protocol allows the ViewModel to publish changes to its properties, which are then automatically reflected in the views that are bound to them.
- The View is implemented as a struct or a class that uses bindings to connect to the ViewModel. The bindings are created using the @Binding property wrapper.

__The main rules proposed by the MVVM pattern are:__
- **Data binding**: The View should not directly access the Model. Instead, it should use data binding to get data from the ViewModel. This ensures that the View is always up-to-date with the latest data from the Model.
- **Single responsibility principle**: Each component should have a single responsibility. The Model should be responsible for storing and managing data, the ViewModel should be responsible for handling the UI logic, and the View should be responsible for displaying the data.
- **Loose coupling**: The components should be loosely coupled, meaning that they should not depend on each other too much. This makes the code more flexible and easier to maintain.
- **Encapsulation**: The components should be encapsulated, meaning that their internal details should be hidden from other components. This makes the code more secure and easier to understand

__The key benefits of the pattern are:__
- Provides a good encapsulation of the business logic and the model's data-transformation.
- It helps to separate the UI code from the business logic code. This makes the code easier to read, write, and maintain.
- It makes it easier to update the UI without affecting the business logic code.
- It can help to improve the performance of the app.

## List of Classes group by responsibilities:

__View__
- PlanetsListView : Shows the list of the Star wars planets.
- DetailPlanetView : Shows the detail of a Planet.

__View Models__
- PlanetsViewModel : Business logics of Planets View functionality.

__Model__
- Planets : contains a model which serve as DTOs (data transfer objects) to get all planets API data.




