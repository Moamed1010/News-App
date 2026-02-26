📰 News App — Production-Level Flutter Application

Flutter                           Dart                            Architecture                    State Management                License
https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter&logoColor=white https://img.shields.io/badge/Dart-3.x-blue?logo=dart&logoColor=white https://img.shields.io/badge/Architecture-Clean%20Architecture-green https://img.shields.io/badge/State-Bloc%20%2F%20Cubit-purple https://img.shields.io/badge/License-MIT-lightgrey

A scalable production-ready News Application built with Flutter using Clean Architecture. Multi-language support (Arabic/English), responsive UI, and modern state management.

🚀 Features
✅ Top Headlines from global sources (BBC, CNN, Reuters)
🔍 Dynamic Search by keywords/topics  
🌐 Multi-language (Arabic/English + RTL/LTR)
📱 Responsive UI (flutter_screenutil)
🧭 Clean Navigation (go_router)
🏗️ Clean Architecture (Domain/Data/Presentation layers)

📸 Screenshots
Home                              Search                           Details                         Localization
screenshots/home.png              screenshots/search.png           screenshots/details.png          screenshots/localization.png

🏗️ Clean Architecture
lib/
├── core/                 # Utils, DI, Network, Constants
├── features/
│   ├── home/            # Feature: Domain + Data + Presentation
│   └── search/          # Feature: Domain + Data + Presentation
└── main.dart

🛠 Tech Stack
Category                        Technology
Framework                       Flutter 3.x, Dart
Architecture                    Clean Architecture
State                           Bloc/Cubit
Network                         Dio/HTTP + NewsAPI
Navigation                      GoRouter
Responsive                      flutter_screenutil
Localization                    Easy Localization

🚀 Quick Setup
1. Clone
git clone https://github.com/Moamed1010/News-App.git
cd News-App

2. Dependencies
flutter pub get

3. API Key (Free @ newsapi.org)
// lib/core/constants/constants.dart
static const String apiKey = 'YOUR_API_KEY_HERE';

4. Run
flutter run

🤝 Contributing
1. Fork the repo
2. Create feature branch (git checkout -b feature/amazing-feature)
3. Commit changes (git commit -m 'Add amazing feature')
4. Push (git push origin feature/amazing-feature)
5. Open Pull Request

📄 License
MIT License - see LICENSE

👨‍💻 Built by Mohamed Nady (https://github.com/Moamed1010)
Production-ready Flutter apps with Clean Architecture ⭐ Star if useful!