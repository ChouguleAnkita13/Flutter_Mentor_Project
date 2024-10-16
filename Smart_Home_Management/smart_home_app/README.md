# Smart Home Management App
## Overview
 The Smart Home Management App is a beautifully designed mobile application built using Flutter and powered by Provider for state management. The app offers a clean, intuitive interface, allowing users to manage and control smart home devices effortlessly. It features a fully responsive layout, providing a seamless experience across multiple devices.

## Screenshots

## Key Features
 #### Clean and Modern UI: 
    The app boasts a sleek and intuitive user interface that enhances the overall user experience. The design is visually appealing, making smart home management more enjoyable and user-friendly.

 #### Provider State Management: 
    The app uses the Provider package for efficient state management, ensuring smooth performance, scalable architecture, and easy-to-maintain code. It handles state transitions effectively, providing fast and responsive interactions.

 #### Responsive Design: 
    The app is fully responsive, meaning it adapts to different screen sizes, ensuring a consistent and optimized experience whether on a smartphone, tablet, or other devices.

 #### Device Control: 
    Users can interact with and control a variety of smart home devices through intuitive control screens. They can easily switch between devices and manage their functionalities via a smooth and clean interface.

## Project Structure
 The project follows the MVC (Model-View-Controller) architecture for better organization, scalability, and maintainability. The structure separates the application's logic, data, and presentation layers.
```bash

  lib/
├── controller/
│   ├── device_operator.dart          # Manages operations related to smart devices
│   └── room_controller.dart           # Handles logic for room management
├── model/
│   ├── device_model.dart              # Defines the data model for smart devices
│   └── room_model.dart                # Defines the data model for rooms
├── view/
│   ├── DeviceDetailsScreen/
│   │   ├── Widgets/                   # Custom widgets for the device details screen
│   │   └── device_details_screen.dart  # UI for displaying individual device details
│   ├── HomeScreen/
│   │   ├── Widgets/                   # Custom widgets for the home screen
│   │   └── home_screen.dart            # UI for the main home screen
│   ├── RoomDetailsScreen/
│   │   ├── Widgets/                   # Custom widgets for the room details screen
│   │   └── room_details_screen.dart    # UI for displaying room details
└── main.dart                           # Main entry point of the application
```
## Flutter Version
```bash
flutter --version
  Flutter 3.22.3
  Dart 3.4.4
```

## Dependencies
```bash
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^6.2.1
  provider: ^6.1.2
  blur: ^4.0.0
```
## License
This project is licensed under the MIT License. See the [LICENSE](https://choosealicense.com/licenses/mit/) file for more details.

