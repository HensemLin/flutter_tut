# Flutter Firebase Notes App Tutorial

This Flutter project serves as a tutorial for building a mobile app that enables users to perform CRUD (Create, Read, Update, Delete) operations on notes. The app utilizes Firebase for both authentication and database functionalities.

## Overview

The purpose of this tutorial is to guide developers through the process of creating a Flutter app with the following features:

- User authentication using Firebase Authentication.
- CRUD operations on notes, stored in the Firebase Firestore database.

## Project Structure

The Flutter app is structured with the following key components:

- **lib/:** Contains the Dart source code for the Flutter app.
  - **screens/:** Screens for various app views (e.g., home, note details).
  - **services/:** Firebase-related services (authentication, Firestore database).
  - **models/:** Data models used in the app.
  - **widgets/:** Reusable widgets.
  - **main.dart:** The entry point of the app.

## Features

1. **User Authentication:**
   - Firebase Authentication is used for user sign-up and login.

2. **Note Operations:**
   - Create a new note.
   - View a list of all notes.
   - View details of a specific note.
   - Update an existing note.
   - Delete a note.

## Firebase Setup

1. **Authentication:**
   - Set up Firebase Authentication and configure it in the `FirebaseAuthService` class.

2. **Firestore Database:**
   - Set up Firebase Firestore and configure it in the `FirestoreService` class.

## Dependencies

Ensure that the following dependencies are added to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^latest_version
  firebase_auth: ^latest_version
  cloud_firestore: ^latest_version
```

## Getting Started

Follow these steps to run the app locally

1. Clon ethe repository
   ```bash
   git clone https://github.com/yourusername/flutter-firebase-notes-tutorial.git
   ```
3. Navigate to the project directory
   ```bash
   cd flutter-firebase-notes-tutorial
   ```
5. Install dependencies
   ```bash
   flutter pub get
   ```
7. Run the app
   ```bash
   flutter run
   ```
