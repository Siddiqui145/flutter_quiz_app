# **Flutter Quiz App**

## **Overview**
The Flutter Quiz App is a gamified quiz application developed using the Flutter framework. It dynamically fetches quiz data from a RESTful API, presenting questions with multiple-choice answers. The app incorporates state management using Riverpod and includes features such as scoring, question navigation, and result summarization. It is designed to provide a seamless and user-friendly experience with responsive design and polished UI.

---

## **Features**
- Fetches quiz data from an API.
- Displays a quiz with multiple-choice questions.
- Tracks and displays user progress, including scores.
- Gamification elements such as correct/incorrect feedback.
- Handles both small and large screen sizes with responsive design.
- Error handling for network issues and API failures.
- State management implemented using Riverpod.
- Polished UI with animations and consistent design elements.

---

## **Demo**

https://github.com/user-attachments/assets/803d5486-17ca-4a83-8d52-1aa3f749902b

---

## **Getting Started**

### **1. Prerequisites**
Before running this app, ensure you have:
- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed.
- A code editor like [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio).
- A device emulator or a physical device for testing.

### **2. Installation**

1. Clone this repository:
   ```bash
   git clone https://github.com/Siddiqui145/flutter_quiz_app.git
   cd flutter_quiz_app
   ```

2. Fetch project dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   - On an emulator:
     ```bash
     flutter emulators --launch emulator_id
     flutter run
     ```
   - On a physical device:
     Connect your device via USB and enable USB Debugging, then:
     ```bash
     flutter run
     ```

---

## **Folder Structure**
```plaintext
lib/
  ├── models/
  │   ├── quiz.dart          # Contains the Quiz model
  │   ├── question.dart      # Contains the Question model
  │   ├── option.dart        # Contains the Option model
  ├── providers/
  │   └── quiz_provider.dart # Riverpod providers for state management
  ├── services/
  │   └── quiz_service.dart  # Service to fetch data from the API
  ├── screens/
  │   ├── home_screen.dart   # Home screen with a Start Quiz button
  │   ├── quiz_screen.dart   # Main quiz screen displaying questions
  │   ├── result_screen.dart # Result summary after completing the quiz
  ├── widgets/
  │   ├── question_card.dart # Widget to display a question
  │   ├── option_button.dart # Widget for each option button
  ├── main.dart              # App entry point with ProviderScope
```

---

## **How it Works**

### **Data Flow**
1. **API Integration**:
   - The app fetches data from the [Quiz API](https://api.jsonserve.com/Uw5CrX) using the `QuizService`.
   - Data is parsed into models: `Quiz`, `Question`, and `Option`.

2. **State Management**:
   - Riverpod providers manage app state, including:
     - Fetching and storing quiz data.
     - Tracking current question index.
     - Scoring user answers.

3. **UI**:
   - The `HomeScreen` navigates to the `QuizScreen`.
   - Questions are displayed with dynamically generated `OptionButton` widgets.
   - After the quiz ends, the `ResultScreen` shows the user's score.

---

## **Key Files**

### 1. **`quiz_provider.dart`**
Manages app state using Riverpod:
- `quizProvider`: Fetches the quiz data asynchronously.
- `currentQuestionIndexProvider`: Tracks the current question index.
- `userScoreProvider`: Tracks the user's score.
- `isQuizCompletedProvider`: Indicates whether the quiz is complete.

### 2. **`quiz_service.dart`**
Handles API communication to fetch quiz data:
- Fetches and parses JSON into models (`Quiz`, `Question`, `Option`).
- Provides detailed exception handling for network or parsing errors.

### 3. **UI Components**
- `QuestionCard`: Displays the question text.
- `OptionButton`: Styled button for each answer option.

---

## **API Data Format**
**Endpoint**: [Quiz API](https://api.jsonserve.com/Uw5CrX)

---

## **Technologies Used**
- Flutter: Framework for building UI.
- Dart: Programming language for Flutter.
- Riverpod: State management library.
- HTTP: For REST API integration.

---

## **Customization**
### To use your own API:
1. Update the `apiUrl` in `quiz_service.dart`:
   ```dart
   final String apiUrl = 'https://your-api-endpoint.com';
   ```
2. Ensure your API follows a similar JSON format or update the models accordingly.

---

## **Known Issues**
- Ensure the API is reachable; otherwise, the app displays an error message.
- Currently, no support for skipping unanswered questions (can be added easily).

---

## **Future Enhancements**
- Add support for timed quizzes with countdown timers.
- Display per-question feedback (correct/incorrect) in real-time.
- Add user authentication for tracking individual progress.
- Support for multi-language questions and answers.

---

## **License**
This project is licensed under the MIT License. You are free to modify and distribute this project as per the terms of the license.

---

If you encounter any issues, feel free to raise an issue in the repository or contact the maintainer at [tahassiddiquii@gmail.com].
