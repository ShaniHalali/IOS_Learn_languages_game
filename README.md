# 🎯 Words Play – iOS App

**Words Play** is an interactive iOS language learning game designed to improve vocabulary skills in a fun and engaging way.  
Players can challenge themselves by translating words across different difficulty levels and languages, track their progress, and compete for the highest score.

---


https://github.com/user-attachments/assets/94a203cc-a26d-407e-9a89-36df781d150e


---
## 📱 Features

- **Multiple Languages:** Play in English or Spanish - translations are provided in Hebrew.
- **Difficulty Levels:** Easy, Medium, and Pro - choose the challenge that suits you.
- **Randomized Questions:** Dynamic word and translation combinations for each round.
- **User Profiles:** Sign up or log in to save progress and personalize gameplay.
- **Score Tracking:** Total scores are stored in Firebase and displayed in a leaderboard.
-  **Leaderboard TableView:** Displays users’ scores in a ranked list with custom cells.
- **Full Orientation Support:** All screens are supported in both portrait and landscape mode.
- **Dark Mode Support:** UI fully adapts to system dark mode settings.
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
<img width="2556" height="1179" alt="Simulator Screen Shot - iPhone 14 Pro - 2025-08-09 at 20 35 08" src="" />

---
## Vertically – dark Mode
<img width="25%" height="20%" alt="image" src="https://github.com/user-attachments/assets/1bfcecba-eed4-4c8f-bb10-211e247f4586" />
<img width="25%" height="20%" alt="image" src="https://github.com/user-attachments/assets/21a78854-06fa-40c3-a6cf-6ab1ee8cc7ac" />
<img width="25%" height="20%" alt="image" src="https://github.com/user-attachments/assets/1f4a10a1-432d-4e38-b1c1-5fbde2421855" />
<img width="25%" height="20%" alt="image" src="https://github.com/user-attachments/assets/09b94071-59c3-430e-aa8a-b3d4c6cf326e" />
<img width="25%" height="20%" alt="image" src="https://github.com/user-attachments/assets/db82d623-a828-42da-aea1-0d355b35198a" />
<img width="25%" height="20%" alt="image" src="https://github.com/user-attachments/assets/94f4d30b-587c-431a-b4d6-34051ac9532f" />


## Horizontally – Light Mode
<img width="35%" height="30%" alt="image" src="https://github.com/user-attachments/assets/5cc4e169-2d39-4894-99ec-3490450a9c4b" />
<img width="35%" height="30%" alt="image" src="https://github.com/user-attachments/assets/fe42720d-d1d2-4f15-95bf-ebd2da656b46" />
<img width="35%" height="30%" alt="image" src="https://github.com/user-attachments/assets/08f660a9-f52c-4a26-bdf2-ca04b59819e7" />
<img width="35%" height="30%" alt="image" src="https://github.com/user-attachments/assets/added70a-f717-40e9-969d-defc043b5252" />
<img width="35%" height="30%" alt="image" src="https://github.com/user-attachments/assets/007ffcfd-a44f-4ca6-88e3-b912e0bd6e9e" />

## From User Settings to Gameplay – Firebase Realtime in Action with Live Score Updates and Auto UI Refresh


https://github.com/user-attachments/assets/579cc127-dc65-4d13-bc03-11f35a6e9b87




---
## 📄 License
This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).

## 👩‍💻 Developed By
**Shani Halali** - junior iOS Developer · Passionate about clean code, cinematic design, and building amazing user experiences


