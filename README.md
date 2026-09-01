# My Notes

A simple notes app built with Flutter. Create, edit and delete notes — everything is saved locally,

**Live URL:** https://pravindeodhe.github.io/Note/

# Setup

i). Clone the repo

   git clone https://github.com/pravindeodhe/Note.git
   cd Note


ii) For Install dependencies - flutter pub get


iii) For Run the app - flutter run


To run in the browser: `flutter run -d chrome`

# Approach

i) Built with Flutter so the same code runs on Android, iOS and Web.
ii)  Notes are stored locally using `shared_preferences`

# Project structure

```
lib
i) main.dart - app entry and theme
ii) models/note.dart - Note data class with JSON support
iii) screens
 a) note_screen.dart - notes list, load/save logic
 b) add_note_screen.dart - add / edit note form
iv) widgets
 a) note_card.dart - single note tile
 b) empty_notes.dart - empty state view
```

## How it works

1. Tap the **+** button at the bottom right — the New Note screen opens.
2. Enter a title (required) and description (optional), then tap **Save note**.
3. The note appears at the top of the notes list.
4. Tap any note to edit it. Tap the delete icon to remove it, with an undo option.
