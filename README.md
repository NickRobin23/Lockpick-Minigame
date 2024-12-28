# Lockpicking Minigame for FiveM

Welcome to the **Lockpicking Minigame** resource for FiveM! Inspired by ProdigyRP!, this engaging minigame challenges players to quickly click circles that appear on the right side of the screen. It’s perfect for adding an interactive and skill-based mechanic to your server.

---

## 🚀 Features
- **Dynamic Gameplay:** Circles appear on the right side of the screen in random positions, making each game unique.
- **Customizable Settings:** Configure the number of circles and the speed of the game.
- **Challenging Design:** Circles are spaced closely together for an added level of difficulty.
- **Fully Integrated UI:** Includes a responsive HTML/CSS/JavaScript interface.

---

## 📂 File Structure
```
lockpicking-minigame/
├── client/
│   └── client.lua         # Client-side logic
├── server/
│   └── server.lua         # Server-side logic
├── html/
│   ├── index.html         # Main game interface
│   ├── script.js          # Frontend logic
│   └── style.css          # Styling for the UI
├── fxmanifest.lua          # FiveM resource manifest
└── LICENSE                # MIT License
```

---

## ⚙️ Installation
1. Clone this repository to your FiveM resources folder:
   ```bash
   git clone https://github.com/NickRobin23/lockpicking-minigame.git
   ```
2. Add the resource to your `server.cfg`:
   ```bash
   ensure lockpicking-minigame
   ```
3. Restart your server, and you’re good to go!

---

## 🕹️ How to Use
### Trigger the Minigame
Use the following client-side event to start the minigame:
```lua
TriggerEvent('startLockpickingMinigame', 5, 7)
```
- **5**: Number of circles (e.g., `5` circles).
- **7**: Speed (1–10 scale, with `10` being the fastest).

### Completing the Minigame
- Successfully click all the circles to complete the challenge.
- Server receives an event for success or failure to implement rewards or penalties:
  ```lua
  RegisterServerEvent('lockpicking:complete')
  AddEventHandler('lockpicking:complete', function(success)
      if success then
          print("Player succeeded!")
      else
          print("Player failed!")
      end
  end)
  ```

---

## ✨ Contribution
Contributions are welcome! If you find a bug or have a feature request, please create an issue or submit a pull request.

---

## 📝 License
This project is licensed under the [MIT License](LICENSE). Please make sure to include proper attribution when sharing or modifying this resource.

---

## 📧 Contact
If you have any questions or need support, feel free to reach out:
- GitHub: [NickRobin23](https://github.com/NickRobin23)
- Discord: nickrobin


[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) 
[![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)](https://shields.io)
[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](https://shields.io)
[![Contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/your-repo/issues)
