# 📰 News App — Production-Level Flutter Application

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-blue?logo=dart)
![Architecture](https://img.shields.io/badge/Architecture-Clean%20Architecture-green)
![State Management](https://img.shields.io/badge/State-Bloc%20%2F%20Cubit-purple)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

A scalable and production-oriented News Application built using **Flutter**. This project demonstrates the implementation of **Clean Architecture** principles, separating the codebase into Domain, Data, and Presentation layers to ensure maintainability, testability, and scalability.

---

## 🚀 Project Overview

News App is a cross-platform mobile application that simulates a real-world production environment. It allows users to:

- **Browse Top Headlines:** Real-time news fetching from global sources.
- **Dynamic Search:** Search for articles by keywords or specific topics.
- **Multi-language Support:** Fully localized in **Arabic** and **English** (RTL/LTR support).
- **Responsive UI:** Adaptive design that looks great on all screen sizes using `flutter_screenutil`.
- **Clean Navigation:** Declarative routing using `go_router`.

---

## 📸 Application Preview
<p align="center">
  <img src="https://drive.google.com/uc?export=view&id=1s3H4pB-KwlmTpDB4pdKW18d72OdcF8kA" height="400" alt="Home Screen"/>
  <img src="https://drive.google.com/uc?export=view&id=1BSQ0gjm2tqdC5r3jZ3-Sgr1CWJUAZdti" height="400" alt="Search Screen"/>
  <img src="https://drive.google.com/uc?export=view&id=1DsAGYqvkcs_a-Q5HqmtqSoVtdFN7w-be" height="400" alt="Details Screen"/>
  <img src="https://drive.google.com/uc?export=view&id=10XyilIDJ_3NVLg5U3x8KFTb3IliZVRNx" height="400" alt="Localization"/>
</p>

<p align="center">
  <b>Clean UI • Responsive Layout • RTL Support</b>
</p>
---

## 🏗️ Architecture & Design

The project strictly follows **Clean Architecture** divided into three independent layers:

1.  **Domain Layer:** The inner core containing Entities, Use Cases, and Repository Interfaces. It has **zero dependencies** on other layers.
2.  **Data Layer:** Handles data retrieval. It contains Models, Data Sources (Remote/Local), and Repository Implementations.
3.  **Presentation Layer:** The UI layer containing Screens, Widgets, and State Management (Cubits).

### Folder Structure
```text
lib/
├── core/                # Shared utilities, constants, networking, and DI setup
├── features/
│   ├── home_screen/     # Home Feature (Data, Domain, Presentation)
│   └── search_result/   # Search Feature (Data, Domain, Presentation)
├── main.dart            # Entry point
└── ...
## 🛠 Tech Stack

| Technology | Role |
|------------|------|
| Flutter | UI Framework |
| Dart | Programming Language |
| REST API | News Data Source |
| GoRouter | Navigation Management |
| Easy Localization | Multi-language Support |
| flutter_screenutil | Responsive Scaling |
| HTTP / Dio | Network Requests |

⚙️ Installation & Setup
Follow these steps to run the project locally:

1️⃣ Clone Repository

Bash
git clone [https://github.com/Moamed1010/News-App.git](https://github.com/Moamed1010/News-App.git)
2️⃣Navigate to Project Directory:

Bash
cd News-App
3️⃣Install Dependencies:

Bash
flutter pub get
Configure API Key:

4️⃣Sign up at NewsAPI.org to get your free API Key.

Open lib/core/constants/constants.dart.

Replace the placeholder with your key:

Dart
static const String apiKey = "YOUR_API_KEY_HERE";
Run the Application:

Bash
flutter run


🤝 Contributing
Contributions are welcome! If you have any suggestions or improvements:

1-Fork the repository.

2-Create a new branch (git checkout -b feature-branch).

3-Commit your changes.

4-Push to the branch.

5-Open a Pull Request.

👨‍💻 Developer
Mohamed Nady Mahmoud Abdel Halim

Flutter Developer

Passionate about building scalable, maintainable, and production-ready mobile applications.

<p align="left">
<a href="https://www.google.com/search?q=https://github.com/Moamed1010" target="_blank">
<img src="https://www.google.com/search?q=https://img.shields.io/badge/GitHub-100000%3Fstyle%3Dfor-the-badge%26logo%3Dgithub%26logoColor%3Dwhite" alt="GitHub"/>
</a>
</p>

⭐ If you found this project useful, please consider giving it a star!
