# E-Commerce App

This is a comprehensive e-commerce application built with Flutter. It provides a complete shopping experience, from browsing products to a secure checkout process. The app is designed with a clean, feature-first architecture, utilizing BLoC for state management and supporting both light and dark themes, as well as English and Arabic languages.

## Features

- **User Authentication**: Secure sign-up, sign-in, and password reset functionality.
- **Product Discovery**: Browse products through categories, sub-categories, and a dedicated "Latest Products" section.
- **Product Details**: View detailed information about each product, including images, description, price, and reviews.
- **Shopping Cart**: Add, remove, and manage items in the shopping cart.
- **Wishlist**: Save favorite products to a personal wishlist.
- **Profile Management**: Manage user information, shipping addresses, view order history, and toggle between light/dark themes.
- **Localization**: Full support for English and Arabic languages.
- **Theming**: Seamless switching between light and dark modes.
- **Payment Integration**: Supports checkout via the Paymob payment gateway.
- **Onboarding**: A user-friendly introduction to the app's features for new users.

## Tech Stack & Architecture

This project is built using a feature-first, clean architecture approach to ensure scalability and maintainability.

- **Architecture**: Clean Architecture (Data, Domain, Presentation layers) separated by feature.
- **State Management**: BLoC (Business Logic Component) for predictable and scalable state management.
- **Dependency Injection**: `get_it` and `injectable` for managing dependencies.
- **Routing**: `go_router` for a declarative, URL-based navigation system.
- **Networking**: `dio` for handling HTTP requests, with `pretty_dio_logger` for debugging.
- **UI & Theming**: `flutter_screenutil` for responsive UI, `google_fonts` for typography, `cached_network_image` for efficient image loading, `carousel_slider` for image carousels, and `skeletonizer` for loading states.
- **Localization**: `easy_localization` for multi-language support.
- **Code Generation**: `build_runner`, `flutter_gen_runner`, and `injectable_generator` to reduce boilerplate code.

## Project Structure

The project follows a well-organized, feature-driven structure:

```
lib
├── config/             # App-wide configurations (routing, themes)
├── core/               # Core utilities (API manager, components, helpers)
├── features/           # Main feature modules
│   ├── auth/           # Authentication feature
│   ├── mainScreen/     # Main screen with tabs (Home, Cart, Profile, etc.)
│   ├── onboarding/     # Onboarding flow
│   ├── product/        # Product details and listing
│   └── ...
├── di.dart             # Dependency injection setup
└── main.dart           # Main application entry point
```

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

- Flutter SDK installed on your machine.
- An IDE like VS Code or Android Studio.

### Installation

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/yousseftaher65/E-Commerce-App.git
    ```
2.  **Navigate to the project directory:**
    ```sh
    cd E-Commerce-App
    ```
3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```
4.  **Run the build runner to generate necessary files:**
    ```sh
    flutter pub run build_runner build --delete-conflicting-outputs
    ```
5.  **Run the app:**
    ```sh
    flutter run
