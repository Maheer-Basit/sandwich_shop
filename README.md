# 🥪 Sandwich Shop - Flutter App

A feature-rich Flutter application for ordering customized sandwiches. This interactive app allows users to build their perfect sandwich by selecting size, bread type, quantity, and adding special notes for their order.

---

## 📋 Table of Contents

- [Features](#features)
- [Project Structure](#project-structure)
- [Installation & Setup](#installation--setup)
- [Usage Instructions](#usage-instructions)
- [Running Tests](#running-tests)
- [Configuration](#configuration)
- [Architecture](#architecture)
- [Technologies Used](#technologies-used)

---

## ✨ Features

### Core Functionality
- **Sandwich Size Selection**: Choose between "Footlong" and "Six-inch" sandwiches via toggle switch
- **Bread Type Selection**: Select from three bread options using a dropdown menu:
  - White
  - Wheat
  - Wholemeal
- **Quantity Management**: Add or remove sandwiches with smart increment/decrement controls
  - Maximum quantity limit (configurable, default: 5)
  - Prevents negative quantities
  - Buttons disable at limits
- **Custom Order Notes**: Add special requests (e.g., "no onions", "extra pickles", "no mayo")
- **Real-time Display**: Visual feedback with emoji representation of sandwich count (🥪)
- **Styled UI Components**: Custom button styling with icons and colors

### Technical Features
- State management using `StatefulWidget`
- Repository pattern for business logic (`OrderRepository`)
- Comprehensive unit and widget testing
- Responsive Material Design UI
- Clean code architecture with separated concerns

---

## 📁 Project Structure

```
sandwich_shop/
├── lib/
│   ├── main.dart                          # App entry point, UI widgets
│   ├── repositories/
│   │   └── order_repository.dart          # Business logic for order state
│   └── views/
│       └── app_styles.dart                # Shared text styles
├── test/
│   ├── repositories/
│   │   └── order_repository_test.dart     # Unit tests for OrderRepository
│   └── views/
│       └── widget_test.dart               # Widget tests for UI components
├── pubspec.yaml                           # Flutter dependencies
├── analysis_options.yaml                  # Lint rules
└── README.md                              # This file
```

### Key Files Explained

| File | Purpose |
|------|---------|
| `main.dart` | Contains all UI components: `App`, `OrderScreen`, `StyledButton`, `OrderItemDisplay` |
| `order_repository.dart` | Manages sandwich quantity state with increment/decrement logic |
| `app_styles.dart` | Defines reusable `TextStyle` constants (`normalText`, `heading1`) |
| `widget_test.dart` | 70+ test cases covering all UI interactions and state changes |
| `order_repository_test.dart` | Unit tests for order business logic |

---

## 🚀 Installation & Setup

### Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** (version 3.7.2 or higher)
  - Download from [flutter.dev](https://flutter.dev/docs/get-started/install)
- **Dart SDK** (included with Flutter)
- **Git** for version control
- **IDE** (VS Code, Android Studio, or IntelliJ IDEA)
- **Android Emulator** or **iOS Simulator** (or physical device)

### Step 1: Clone the Repository

```bash
git clone https://github.com/Maheer-Basit/sandwich_shop.git
cd sandwich_shop
```

### Step 2: Install Dependencies

```bash
flutter pub get
```

This downloads all required packages specified in `pubspec.yaml`:
- `flutter`: Core Flutter framework
- `cupertino_icons`: iOS-style icons
- `flutter_lints`: Code quality analyzer
- `flutter_test`: Testing framework

### Step 3: Verify Setup

```bash
flutter doctor
```

This checks your Flutter environment. You should see:
- ✓ Flutter SDK
- ✓ Android toolchain / Xcode (for your target platform)
- ✓ VS Code / Android Studio

### Step 4: Run the App

#### On an Android Emulator:
```bash
# Start emulator from Android Studio, then:
flutter run
```

#### On an iOS Simulator:
```bash
flutter run -d <simulator_name>
```

#### On a Physical Device:
```bash
flutter run
```

The app will compile and launch. You should see the Sandwich Counter screen.

---

## 📱 Usage Instructions

### Main Screen Overview

The app opens with the **Sandwich Counter** screen featuring:

1. **Order Display Panel**
   - Shows selected bread type, sandwich size, and quantity with emoji
   - Displays any special notes you've added
   - Example: "2 wheat six-inch sandwich(es): 🥪🥪"

2. **Size Selector (Switch)**
   - Toggle between "six-inch" and "footlong"
   - Changes sandwich type in the display instantly

3. **Bread Type Selector (Dropdown)**
   - Choose: White, Wheat, or Wholemeal
   - Updates display immediately

4. **Notes TextField**
   - Enter special requests or dietary requirements
   - Text updates the display in real-time
   - Example inputs: "no onions", "extra pickles", "light mayo"

5. **Quantity Controls (Buttons)**
   - **Add Button** (Green with + icon): Increases quantity
     - Disabled when reaching max quantity (5 by default)
   - **Remove Button** (Red with - icon): Decreases quantity
     - Disabled at zero quantity

### Typical User Flow

```
1. App loads → Shows "0 white footlong sandwich(es)"
2. User selects bread type (e.g., "wheat") → Display updates
3. User toggles size (e.g., to "six-inch") → Display updates
4. User types special note (e.g., "extra mayo") → Display updates
5. User taps "Add" button → Quantity increases, emoji count grows
6. User can tap "Add" again (max 5 times with default settings)
7. User taps "Remove" to decrease quantity
8. Order summary shown with all selections and notes
```

### Configuration Options

#### Changing Maximum Quantity

In `main.dart`, find the `App` class and modify:

```dart
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sandwich Shop App',
      home: OrderScreen(maxQuantity: 5),  // ← Change this number
    );
  }
}
```

#### Customizing Colors

In `main.dart`, find the `StyledButton` calls and adjust colors:

```dart
StyledButton(
  onPressed: _getIncreaseCallback(),
  icon: Icons.add,
  label: 'Add',
  backgroundColor: Colors.green,  // ← Modify this
),
```

#### Adding More Bread Types

In `main.dart`, update the `BreadType` enum:

```dart
enum BreadType { white, wheat, wholemeal, rye, sourdough }  // ← Add new types
```

---

## 🧪 Running Tests

### Run All Tests

```bash
flutter test
```

Output shows all passing/failing tests with execution time.

### Run Specific Test File

```bash
# Unit tests for OrderRepository
flutter test test/repositories/order_repository_test.dart

# Widget tests for UI
flutter test test/views/widget_test.dart
```

### Run Tests with Coverage

```bash
flutter test --coverage
```

### Test Coverage Details

#### Unit Tests (`order_repository_test.dart`) - 5 tests
- ✓ Initial quantity is 0
- ✓ Increment increases quantity by 1
- ✓ Decrement decreases quantity by 1
- ✓ Quantity respects max limit
- ✓ Quantity doesn't go below 0

#### Widget Tests (`widget_test.dart`) - 15+ tests

**App Tests:**
- Renders `OrderScreen` as home

**Quantity Behavior:**
- Shows initial quantity and app title
- Increments when Add is tapped
- Decrements when Remove is tapped
- Doesn't decrement below zero
- Doesn't increment above maxQuantity (5)

**Control Interactions:**
- Bread type dropdown changes display correctly
- TextField updates order notes in real-time

**Component Tests:**
- `StyledButton` renders with icon and label
- `OrderItemDisplay` shows correct text for various quantities
- Correct bread type and sandwich size combinations

---

## 🏗️ Architecture

### Design Patterns Used

#### 1. **Repository Pattern** (`OrderRepository`)
Encapsulates business logic for quantity management:

```dart
class OrderRepository {
  int _quantity = 0;
  final int maxQuantity;
  
  // Getters for read-only access
  int get quantity => _quantity;
  bool get canIncrement => _quantity < maxQuantity;
  bool get canDecrement => _quantity > 0;
  
  // Methods with boundary checks
  void increment() { ... }
  void decrement() { ... }
}
```

#### 2. **StatefulWidget Pattern**
`OrderScreen` manages mutable state:
- `_orderRepository`: Quantity management
- `_notesController`: Text input for special notes
- `_isFootlong`: Size toggle state
- `_selectedBreadType`: Bread type selection

#### 3. **Separation of Concerns**
- **UI Logic**: `main.dart` (widgets)
- **Business Logic**: `repositories/order_repository.dart`
- **Styling**: `views/app_styles.dart`
- **Testing**: `test/` directory

### Data Flow

```
User Interaction (Button Tap)
         ↓
_OrderScreenState callback (_getIncreaseCallback)
         ↓
setState() → OrderRepository.increment()
         ↓
Widget rebuilds with new _orderRepository.quantity
         ↓
OrderItemDisplay shows updated count
```

---

## 💻 Technologies Used

| Technology | Purpose | Version |
|-----------|---------|---------|
| **Flutter** | UI framework | 3.7.2+ |
| **Dart** | Programming language | 3.7.2+ |
| **Material Design** | UI design system | Flutter built-in |
| **flutter_test** | Testing framework | SDK included |
| **Cupertino Icons** | iOS-style icons | 1.0.8 |

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
```

---



## 🐛 Troubleshooting

### App won't run
```bash
flutter clean
flutter pub get
flutter run
```

### Tests fail
```bash
flutter pub get
flutter test
```

### Build issues on Android
```bash
cd android
./gradlew clean
cd ..
flutter run
```



---

## 📄 License

This project is part of a Flutter learning worksheet and is open for educational use.

---

## 👤 Author

**Maheer Basit**  
Flutter Developer

---

## 📧 Support

For issues or questions, please refer to the test files to understand expected behavior or contact the repository owner.

---

**Happy Sandwich Building! 🥪**
