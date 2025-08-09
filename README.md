# 🎯 Words Play – iOS App

**Words Play** is an interactive iOS language learning game designed to improve vocabulary skills in a fun and engaging way.  
Players can challenge themselves by translating words across different difficulty levels and languages, track their progress, and compete for the highest score.

---

## 📱 Features

- **Multiple Languages:** Play in English or Spanish - translations are provided in Hebrew.
- **Difficulty Levels:** Easy, Medium, and Pro - choose the challenge that suits you.
- **Randomized Questions:** Dynamic word and translation combinations for each round.
- **User Profiles:** Sign up or log in to save progress and personalize gameplay.
- **Score Tracking:** Total scores are stored in Firebase and displayed in a leaderboard.
-  **Leaderboard TableView:** Displays users’ scores in a ranked list with custom cells.
- **Responsive UI:** Clean and intuitive design for a smooth user experience.

---

## 🧱 Architecture & Technology

The app follows the **MVC (Model-View-Controller)** architecture and uses:

- **Swift** with UIKit for UI and game logic.
- **Reusable Managers** for Firebase queries and updates.
- **Firebase Realtime Database** for storing:
  - User accounts (email, username, password, score and difficulty).
  - Word lists categorized by language and difficultys.
- **UserDefaults** for local session storage.
 - **UITableView & Custom Cells:** Used for displaying dynamic lists such as the leaderboard and review screens, with reusable cell designs for consistent UI.


---

## 🚀 Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/YourUsername/words-play-ios.git
   cd words-play-ios
``
### Install dependencies:
- Open the `.xcodeproj` or `.xcworkspace` file in **Xcode**.
- Make sure you have CocoaPods installed (if used).
- Run the project on the simulator or a physical device.

### Firebase Setup:
- Create a Firebase project.
- Add your iOS app in the Firebase console.
- Download the `GoogleService-Info.plist` file and add it to your Xcode project.
- Enable **Firebase Realtime Database** and configure rules.

---

## 🎮 How to Play

1. Choose your **language** and **difficulty level**.
2. For each round, you start with **3 lives**.
3. For each question:
   - A foreign word and its Hebrew translation will appear.
   - Decide if the translation is correct or incorrect.
4. Lose a life for each incorrect answer.
5. Earn 10 points for correct answers.
6. The round ends when all lives are lost.
7. Compete for the top spot on the **leaderboard**.


---

