# Quick Mart
This is a comprehensive e-commerce application built with Flutter. It provides a complete shopping experience, from browsing products to a secure checkout process. The app is designed with a clean, feature-first architecture, utilizing BLoC for state management and supporting both light and dark themes, as well as English and Arabic languages.

## Screenshots
<table>
  <tr>
    <td><img width="400" height="812" alt="Screenshot_1774278861" src="https://github.com/user-attachments/assets/38613052-36ff-4e27-bd99-351066700626" /></td>
    <td><img width="400" height="812" alt="Screenshot_1774278542" src="https://github.com/user-attachments/assets/8d442add-c257-4732-98cd-4fbb11d14443" /></td>
    <td><img width="400" height="812" alt="Screenshot_1774278549" src="https://github.com/user-attachments/assets/9ff36ac7-c731-4d34-9293-3c8fa6f6f91e" /></td>
    <td><img width="400" height="812" alt="Screenshot_1774278554" src="https://github.com/user-attachments/assets/78dc37bc-738f-4bd5-812b-67779910c8bf" /></td>

  </tr>
  <tr>
    <td><img width="400" height="812" alt="Screenshot_1774278558" src="https://github.com/user-attachments/assets/9eb8bf0e-b92f-4354-bed2-4f2f26404aff" /></td>
    <td><img width="400" height="812" alt="Screenshot_1774278715" src="https://github.com/user-attachments/assets/5c87579a-e349-4e53-9f92-2903a18307a4" /></td>
    <td><img width="400" height="812" alt="Screenshot_1774278725" src="https://github.com/user-attachments/assets/0ef193e5-863b-41d4-805a-b9419912913a" /></td>
    <td><img width="400" height="812" alt="Screenshot_1774278740" src="https://github.com/user-attachments/assets/347c256c-bc20-4516-8238-4cefc8d75c92" /></td>

  </tr>
  <tr>
    <td><img width="400" height="812" alt="Screenshot_1774278749" src="https://github.com/user-attachments/assets/3cf45b84-ce0a-4d41-bb63-f367bee4af8f" /></td>
    <td><img width="400" height="812" alt="Screenshot_1774278760" src="https://github.com/user-attachments/assets/863afedf-e431-4b9b-91aa-a1f3a6c6019a" /></td>
    <td><img width="400" height="812" alt="Screenshot_1774278779" src="https://github.com/user-attachments/assets/8c7f4baa-a1ba-4e37-b4f7-0c276c134964" /></td>
    <td><img width="400" height="812" alt="Screenshot_1774278784" src="https://github.com/user-attachments/assets/11493cf6-2f59-4dfd-8c45-e4b956141ef7" /></td>

  </tr>
  <tr>
    <td><img width="400" height="812" alt="Screenshot_1774278855" src="https://github.com/user-attachments/assets/537bc8d0-fb2d-4551-bc14-34cd487048fe" /></td>
    <td><img width="400" height="812" alt="Screenshot_1774279288" src="https://github.com/user-attachments/assets/e64a74f1-873e-49a7-8d39-7bdbaab59015" /></td>
    <td><img width="400" height="812" alt="Screenshot_1774279298" src="https://github.com/user-attachments/assets/b72d2033-6773-4466-8007-569e3e4ef8d9" /></td>
    <td><img width="400" height="812" alt="Screenshot_1774279304" src="https://github.com/user-attachments/assets/a9137522-76dd-4e03-9ab8-88758a320231" /></td>

  </tr>
  <tr>
    <td><img width="400" height="812" alt="Screenshot_1774279321" src="https://github.com/user-attachments/assets/b84d1a8b-a6d8-48af-88f7-842d7963a4a5" /></td>
    <td><img width="400" height="812" alt="Screenshot_1774279363" src="https://github.com/user-attachments/assets/784eb130-7cc9-4368-bb98-821e692790e7" /></td>
    <td><img width="400" height="812" alt="Screenshot_1774279371" src="https://github.com/user-attachments/assets/c11ef48a-71be-4e08-a1df-3ad6f706a2e1" /></td>
    <td><img width="400" height="812" alt="Screenshot_1774279383 - Copy" src="https://github.com/user-attachments/assets/70dbcfd1-26a6-4d9f-bf40-2a307bf1edaf" /></td>

  </tr>
</table>

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
