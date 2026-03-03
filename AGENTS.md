# AGENTS.md - BeadsMarket

---

## Project Overview

Flutter mobile app (Android/iOS/Web) - beads marketplace application.

**Location**: `beads_market/`
**Flutter**: 3.41.3 (Dart 3.11.1)

---

## Running the App

**IMPORTANT: ALWAYS run the app yourself (AI agent) after making code changes. Do not ask the user to run it.**

Default (mobile device):
```bash
cd beads_market
./scripts/run_flutter_mobile.sh
```

For Chrome instead:
```bash
cd beads_market
./scripts/run_flutter_chrome.sh
```

Check logs with: `tail -f beads_market/flutter_run.log`

---

## Build Commands

### Development

```bash
cd beads_market

# Run on connected device/emulator
flutter run

# Run on specific device
flutter run -d chrome        # Chrome web
flutter run -d <device-id>   # Specific device

# Run tests with hot restart
flutter test --watch
```

### Build

```bash
# Debug APK (Android)
flutter build apk --debug

# Release APK
flutter build apk --release

# iOS (requires macOS)
flutter build ios --release

# Web
flutter build web --release
```

### Lint & Analysis

```bash
# Run static analysis
flutter analyze

# Fix automatically fixable issues
flutter analyze --fix
```

### Testing

```bash
# Run all tests
flutter test

# Run a single test file
flutter test test/widget_test.dart

# Run a specific test by name
flutter test --name "Counter increments"

# Run tests with coverage
flutter test --coverage

# Run tests in parallel
flutter test --concurrency=4
```

---

## Code Style

### General Rules

- **No comments** unless explicitly required
- Use **const** constructors wherever possible
- Prefer **final** over var for immutable variables
- Keep functions short (under 30 lines)

### Naming Conventions

| Element | Convention | Example |
|---------|------------|---------|
| Classes | PascalCase | `MyApp` |
| Enums | PascalCase | `OrderStatus` |
| Functions | camelCase | `fetchData()` |
| Variables | camelCase | `userName` |
| Private | _camelCase | `_counter` |
| Constants | kCamelCase | `kMaxItems` |
| Files | snake_case | `user_service.dart` |

### Imports

```dart
// Order: dart: → package: → relative
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/user.dart';
import '../../utils/helpers.dart';
```

### Formatting

- **2 spaces** for indentation
- Max line length: **80 characters** (soft 100)
- Trailing commas for multi-line collections
- Use `=>` for single-expression functions

```dart
// Good
final items = [
  'one',
  'two',
];

String get greeting => 'Hello, $name';
```

### Types

- Use **type inference** (`var`, `final`) when obvious
- Explicit types for: public API, parameters, return types
- Avoid `dynamic`

```dart
// Good
final name = 'John';
Future<User> fetchUser(int id);
```

### Widgets

- Use **stateless widgets** when possible
- Prefer `const` constructors
- Extract reusable widgets

```dart
class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) =>
    CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
}
```

### Error Handling

- Use **try-catch** for async operations
- Handle specific exceptions first

```dart
try {
  final result = await api.fetchData();
} on NetworkException catch (e) {
  log.e('Network error: ${e.message}');
} catch (e) {
  log.e('Unexpected: $e');
}
```

---

## Project Structure

```
beads_market/
├── lib/
│   └── main.dart
├── scripts/
│   ├── run_flutter_chrome.sh
│   └── run_flutter_mobile.sh
├── test/
│   └── widget_test.dart
├── pubspec.yaml
└── analysis_options.yaml
```

---

## CI/Lint Checklist

Before submitting:
- [ ] `flutter analyze` passes
- [ ] `flutter test` passes
- [ ] `flutter build apk --debug` succeeds
