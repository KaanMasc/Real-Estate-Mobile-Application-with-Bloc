Real Estate App
This project is a real estate application where users can browse and publish listings for sale or rent. It utilizes the MVVM (Model-View-ViewModel) architectural pattern and emphasizes object-oriented design principles.

Features
Authentication: Users can log in or sign up using their email address via Firebase Authentication.

Onboarding: If the user is not logged in, they are directed to the splash view page, which redirects them to either the login page or the homepage.

Listing Creation: Users can create listings for sale or rent. The creation process is divided into multiple steps, with different form pages displayed based on the type of listing selected in the first step. State management for the listing creation process is handled using the BLoC (Business Logic Component) pattern.

Data Management: Firebase Firestore is used as the backend service for storing listing data. User information is stored in Firestore as well.

Profile Management: Logged-in users can view their profile information on the profile page. They can also edit their information, which is updated in the backend upon submission.


Technologies Used
Flutter: The mobile application framework used for building the app.
Firebase: Backend services are provided by Firebase, including Firebase Authentication and Firestore.
Provider & Cubit: State management is handled using Provider for general state management and Cubit for managing authentication state.
BLoC Pattern: Used for state management in the listing creation process.
Mixin: Mixins are utilized throughout the project to reduce code complexity and improve maintainability.
