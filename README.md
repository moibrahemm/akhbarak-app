# 📰 Akhbarak App

![Flutter](https://img.shields.io/badge/Flutter-Framework-blue)
![Platform](https://img.shields.io/badge/Platform-Android|iOS-green)

Akhbarak is a simple and responsive Arabic news application built using **Flutter**. The app fetches news articles from various categories using the [GNews API](https://gnews.io/), and presents them in a clean, user-friendly interface.

---

## 📱 Screenshots

| Home Screen | Category View | WebView 1 | WebView 2 |
|-------------|---------------|-----------|-----------|
| ![Home](assets/screenshots/home_screen.png) | ![Category](assets/screenshots/category_view.png) | ![WebView1](assets/screenshots/webview1.png) | ![WebView2](assets/screenshots/webview2.png) |

---

## ✨ Features

- ✅ **Arabic News Support**
- ✅ **GNews API Integration**
- ✅ **Multiple Categories:** Sports, Business, Technology, Health, Entertainment, Science, etc.
- ✅ **Clean UI & UX**
- ✅ **Responsive Design** using custom `size_extension` for adaptive sizing
- ✅ **Loading indicators** during article loading
- ✅ **Error handling:** empty state if no articles found or network fails
- ✅ **WebView Integration:** Read full articles inside the app
- ✅ **Navigation between home, category, and article view**

---

## 📦 Packages Used

- [`dio`](https://pub.dev/packages/dio) – for HTTP requests  
- [`webview_flutter`](https://pub.dev/packages/webview_flutter) – for displaying articles  

---

## 🧠 Project Structure

```
lib/
├── models/
│   ├── article_model.dart
│   └── category_model.dart
├── services/
│   └── news_service.dart
├── widgets/
│   ├── category_card.dart
│   ├── categories_list.dart
│   ├── news_tile.dart
│   ├── news_list.dart
│   ├── news_list_builder.dart
│   ├── news_appbar.dart
│   └── news_web_view.dart
├── screens/
│   ├── home_screen.dart
│   └── category_view.dart
├── extensions/
│   └── size_extension.dart
└── main.dart
```

---

## 🚀 Getting Started

1. Clone the repo:
   ```bash
   git clone https://github.com/moibrahemm/akhbarak-app.git
   cd akhbarak-app
   ```

2. Get packages:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

> 💡 **Note:** Make sure to replace the API key in `news_service.dart` with your own from [https://gnews.io](https://gnews.io)

---

## 📧 Contact

Made with ❤️ by [Muhammed Ibrahem](https://github.com/moibrahemm)

---