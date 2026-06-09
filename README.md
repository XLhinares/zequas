# zequas

A procedurally-generated flashcard app to practice basic maths.

## Description

I was a teacher for a while and figured that some kids could use a more gamified way of practicing basic maths on their phone.
I wanted to make a flashcard style app, but I dislike that it's often very easy to find answers by process of elimination (for instance, on duolingo when you're looking for a verb but half the answers are nouns). So I figured I'd procedurally generate questions instead.
Additionally the questions are implemented in a plugin way, in order to be able to extend the app without touching the logic.

## Gameplay

- Pick a game mode (the type of questions you want to practice)
- Tap on the answer as fast as possible.
- At the end of the game, you get a score based on your answers and speed.

## Features

- Procedurally generated questions
- Plugin system to easily add more question types
- Translations in French and English
- App theme and background can be customized

## Code

The app is coded with Flutter because I like the language and it is very easy to export to different platforms (especially if it is aimed at kids using both iphone and android).

The code structure is as follow in the `lib/` folder:

- `app/`: The core logic of the app and game
- `classes/`: All the dataclasses
- `tabs/`: The different pages of the app.
- `widgets/`: All the non-top level widgets.
- `utils/`: Other code (global variables and functions, translations, basic type extensions)

### Question generators

A question generator is a game mode.
The game modes are located in `lib/classes/solvables/<category>/<mode>.dart`.
Related game modes can be grouped within categories, using the structure:

- `lib/classes/solvables/<category>/`:
  - `category.dart`: `GameCategory` instance containing the category metadata and translations.
  - `<mode1>.dart`: Question generator for the mode #1.
  - `<mode2>.dart`: Question generator for the mode #2.
  - ...

Finally, the `GameCategory` instance needs to the added to `app.game` for the game to use it.
