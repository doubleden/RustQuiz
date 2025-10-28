# Rust Quiz

A SwiftUI-based iOS application designed to help developers learn and reinforce their knowledge of the Rust programming language through interactive quizzes.

## Features

- 📚 **Interactive Quizzes** - Test your Rust knowledge with carefully curated quiz questions
- 🌍 **Localization** - Full support for English and Russian languages
- 💾 **Persistent Storage** - Progress tracking using SQLite database
- 🏗️ **Modern Architecture** - Built with The Composable Architecture (TCA) for predictable state management
- 🎨 **Native UI** - Smooth and responsive interface built with SwiftUI

## Technologies

- **SwiftUI** - Modern declarative UI framework
- **The Composable Architecture (TCA)** - State management and app architecture
- **SQLiteData** - Database persistence layer (from Point-Free)
- **JSON** - Quiz data storage format

## Requirements

- iOS 17.0+
- Xcode 14.0+
- Swift 5.7+

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/rust-quiz.git
```

2. Open the project in Xcode:
```bash
cd rust-quiz
open RustQuiz.xcodeproj
```

3. Build and run the project on your simulator or device

## Architecture

This app follows The Composable Architecture (TCA) pattern, which provides:

- **Composable** - Break complex features into smaller, reusable components
- **Testable** - Business logic is isolated and easy to test
- **Ergonomic** - Simple and pleasant API for building features

### Key Components

- **State** - Represents the current state of the application
- **Action** - Events that can occur in the application
- **Reducer** - Pure functions that evolve state based on actions
- **Store** - Powers the feature by processing actions

## Data Storage

Quiz questions are stored in JSON format and loaded at runtime. User progress and statistics are persisted using SQLiteData, ensuring data is preserved between app sessions.

## Localization

The app supports two languages:
- 🇬🇧 English
- 🇷🇺 Russian

Language selection follows the system settings automatically.

---

⭐️ If you find this project helpful, please consider giving it a star!
