# task_manager_provider

# Flutter Users CRUD App

A Flutter application that performs **Create, Read, Update, and Delete (CRUD)**
operations using the JSONPlaceholder API.

## ✨ Features

- Create a new user
- View all users
- Update existing users
- Delete users
- Provider state management
- HTTP package for API requests
- Loading indicators
- Error handling
- Clean project structure

## 🛠 Technologies Used

- Flutter
- Provider
- HTTP
- JSONPlaceholder API

## 📁 Project Structure

```text
lib/
├── core/
│   └── api/
│       └── api_service.dart
├── features/
│   └── users/
│       ├── model/
│       │   └── user_model.dart
│       ├── provider/
│       │   └── user_provider.dart
│       └── screens/
│           ├── user_list_screen.dart
│           ├── add_user_screen.dart
│           └── edit_user_screen.dart
└── main.dart



## 📸 Screenshots

### Home Screen
![Home Screen](screenshots/home.png)

### Add User Screen
![Add User Screen](screenshots/add_user1.png)

### Add User Screen (Filled)
![Add User Filled](screenshots/add_user2.png)

### Edit User Screen
![Edit User Screen](screenshots/edit_user1.png)

### Edit User Screen (Updated)
![Edit Updated](screenshots/edit_user2.png)

### Delete User
![Delete User](screenshots/delete_user1.png)

### Delete Result
![Delete Result](screenshots/delete_user2.png)