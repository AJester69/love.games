Regrettably, due to personal challenges, I am unable to finish the game as originally intended. I decided to submit my work before the deadline, even though it lacks the additional features I had planned.
My game is a variation of Asteroids with unfinished rogue-like elements. It's relatively straightforward: you can move your ship forward and turn using the W, A, D keys or the arrow keys, and shoot lasers with the Spacebar or Mouse1. When an asteroid is hit, it breaks apart three times before disappearing and being replaced with new ones. Currently, the game features endless levels.
I was unable to make the settings menu function despite numerous attempts, and I deeply regret this limitation. Nevertheless, the main menu and game over screens are operational, as well as the scoreboard and counters.
Gems drop from the asteroids, which players can collect. Although I haven't implemented the shop menu yet, the plan was for players to use the collected gems to purchase upgrades and better ships. Additionally, I had initially intended to introduce boss-like enemies every 5-10 rounds, but this proved to be more challenging than anticipated and was ultimately abandoned.
The sound effects in the game were selected by my friends who playtested it. I apologize if they are too loud and recommend adjusting the sound in the mixer.
Here's an overview of the project structure:
Components Folder: Contains the unfinished Bar.lua file, Button.lua for menu buttons, SFX.lua for sound effects, and Text.lua for handling fonts, colors, and text display.
Objects Folder: Holds Asteroids.lua, Gems.lua, Lasers.lua, and Player.lua, each responsible for various in-game elements.
src.lua Folder: Contains the DATA folder for carrying high scores to the next level and the sound folder with MP3/OGG sound effects.
States Folder: Includes Game.lua for managing the game state, Menu.lua for interacting with buttons and text for the main menu, and an unfinished Settings.lua.
Not in a folder, there are:
conf.lua: Specifies game settings such as screen size and the game's name.
global.lua: Contains miscellaneous code and tidies things up.
json.lua: Helps the game read and store data.
main.lua: The core file that integrates all components, handles user input, and updates the game as you play.
I'm submitting this incomplete version due to personal circumstances. I plan to return to the project in a few months, resolve these issues, and hopefully release a complete and polished game to the public. Thank you for your understanding, and I hope you have a great day. I truly enjoyed working on this project.