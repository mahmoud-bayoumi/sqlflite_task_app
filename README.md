# sqlflite_task_app

A small Flutter To‑Do example that uses SQLite (via a simple DB helper) to persist tasks.

This repository contains a minimal Flutter app demonstrating how to use SQLite for storing
to-do items. It's designed as a learning project or starter template for simple persistent
Flutter apps.

## Highlights

- Simple UI in `lib/main.dart` (main app and `TodoPage`).
- Database helper in `lib/db_helper.dart` with methods to insert, fetch and delete to-dos.
- Basic widget test in `test/widget_test.dart`.

## Requirements

- Flutter SDK (stable channel) — see https://flutter.dev/docs/get-started/install
- Platform-specific tooling (Android SDK, Xcode for iOS, Visual Studio for Windows desktop, etc.) when building for those platforms.

## Quick start

1. Install dependencies:

```powershell
flutter pub get
```

2. Run on an attached device or emulator:

```powershell
flutter run
```

3. Build release APK for Android:

```powershell
flutter build apk --release
```

Other build targets use `flutter build <platform>` (e.g. `ios`, `macos`, `windows`, `linux`, `web`).

## Project layout

- `lib/main.dart` — App entry point and UI. Contains `MyApp` and `TodoPage` (CRUD UI).
- `lib/db_helper.dart` — SQLite helper (open DB, create table, insert/get/delete helpers).
- `test/widget_test.dart` — Example widget test created by Flutter.
- `pubspec.yaml` — Flutter package configuration.

## How it works (brief)

The UI displays a list of tasks obtained from the local SQLite database. Adding a task
shows a dialog that inserts a new row into the DB. Deleting a task removes the row and
refreshes the list. The DB helper exposes `insertTodo`, `getTodos`, and `deleteTodo`.

## Testing

Run tests with:

```powershell
flutter test
```

## Contributing

Contributions are welcome. Open issues for bugs or feature requests and submit pull requests
for fixes. Keep changes small and include tests where applicable.

## License

This repository does not include a license file. Add a `LICENSE` file or update this section
to indicate the project's license.

