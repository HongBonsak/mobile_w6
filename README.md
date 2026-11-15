# Week 6 Flutter Practice

This project practices **StatelessWidget** in Flutter.

A stateless widget displays information. It does not change while the app is
running. Each exercise has its own `main.dart` file.

## 1. Prepare the project

Open a terminal in this folder:

```text
A:\CADT YEAR3\TERM1\mobile\w6\week6_solution\week6_solution
```

Check that Flutter is installed:

```bash
flutter doctor
```

If the project does not have platform folders, run this once:

```bash
flutter create .
```

Get the project packages:

```bash
flutter pub get
```

## 2. Run an exercise

Run one exercise at a time:

```bash
flutter run -t lib/ex1/main.dart
flutter run -t lib/ex2/main.dart
flutter run -t lib/ex3/main.dart
flutter run -t lib/ex4/main.dart
```

The `-t` option means **target**. It tells Flutter which `main.dart` file to
start.

You can also open a file in VS Code and press **Run** or **F5**. To stop the
app, press `q` in the terminal or stop the debugger.

## 3. Basic Flutter structure

Most exercises follow this structure:

```dart
// Gives us Flutter Material widgets such as Scaffold, Text, and Icon.
import 'package:flutter/material.dart';

// The app starts here.
void main() => runApp(const MyApp());

// StatelessWidget is used because this screen does not change by itself.
class MyApp extends StatelessWidget {
  // const helps Flutter build this widget efficiently.
  const MyApp({super.key});

  // build describes what the user sees on the screen.
  @override
  Widget build(BuildContext context) {
    // MaterialApp gives the app basic Material Design behavior.
    return MaterialApp(
      // Scaffold gives us a basic screen structure.
      home: Scaffold(
        // body is the main content of the screen.
        body: Text('Hello'),
      ),
    );
  }
}
```

Explanation:

- `import` loads Flutter's Material Design widgets.
- `main()` is the first function that runs.
- `runApp()` displays the app.
- `StatelessWidget` is a widget with no changing state.
- `build()` describes what appears on the screen.
- `MaterialApp` provides the basic app configuration.
- `Scaffold` provides common screen parts such as an app bar and body.
- `const` means the widget does not need to be recreated.

### Why do we use these widgets?

The comments below use `//`. They are notes for people reading the code.
Flutter ignores comments, so comments do not change the app.

```dart
// Column puts widgets from top to bottom.
Column(
  children: [
    // Padding adds empty space around another widget.
    Padding(
      padding: const EdgeInsets.all(10),
      child: Text('Hello'),
    ),
  ],
)
```

Common widgets:

- `MaterialApp`: starts a Material Design app.
- `Scaffold`: creates the main page structure.
- `AppBar`: creates the bar at the top of the page.
- `Text`: shows words on the screen.
- `Icon`: shows a built-in Flutter icon.
- `Image.asset`: shows an image stored in the project.
- `Container`: makes a box that can have color, size, and decoration.
- `Card`: makes a simple card with a shadow.
- `Padding`: adds space around a widget.
- `SizedBox`: adds empty space or gives a widget a size.
- `Row`: puts widgets from left to right.
- `Column`: puts widgets from top to bottom.
- `Expanded`: uses the remaining available space.
- `ListView`: makes a list that can scroll.
- `Stack`: puts widgets on top of each other.
- `Positioned`: places a widget at a specific position inside a `Stack`.

Why do we use helper functions?

```dart
// This function creates one product card.
// We can call it many times with different information.
Widget productCard(String title, String description, String image) {
  return Card(
    child: Text(title),
  );
}
```

Using a function is useful because we do not need to copy the same layout
many times. We only change the values, such as the title, description, or
image path.

Why do we use parameters?

```dart
// title, icon, and color are values sent into the function.
Widget hobbyBox(String title, IconData icon, Color color) {
  return Container(
    color: color,
    child: Row(
      children: [
        Icon(icon),
        Text(title),
      ],
    ),
  );
}
```

Parameters make one function flexible. The same function can create a green
Travelling box or a blue Skating box.

Why do we use `const`?

```dart
// This widget never changes, so const is safe to use.
const SizedBox(height: 10);
```

`const` tells Flutter that a value is fixed. It can improve performance and
also removes the editor warning that says a constant constructor should use
`const`.

Why do we use `Colors.purple` instead of a color number?

```dart
// The name is easier for a beginner to read.
colors: [Colors.purple, Colors.deepPurple],
```

Named colors are easier to understand than hexadecimal values such as
`Color(0xFFC77DF3)`. Use a hexadecimal color only when you need one exact
custom color.

## 4. How to write an exercise from the beginning

Use this order every time:

1. Open the exercise file, for example `lib/ex1/main.dart`.
2. Delete the old code if you want to practise from an empty file.
3. Write the import first.
4. Write `main()`. This is the starting point of the app.
5. Create one class that extends `StatelessWidget`.
6. Add the `build()` method.
7. Return `MaterialApp`, then `Scaffold`.
8. Build the screen from the outside to the inside:
   `Scaffold` -> `Padding` -> `Column` or `ListView` -> cards or boxes.
9. Move repeated layouts into a function such as `productCard()`.
10. Save the file and run the matching command.

Do not try to write the whole screen at once. After each step, save the file
and check the warning underline. Parentheses `()`, curly braces `{}`, square
brackets `[]`, and commas must match.

For example, build the screen in small pieces:

```dart
return MaterialApp(
  home: Scaffold(
    appBar: AppBar(title: const Text('My App')),
    body: const Text('First test'),
  ),
);
```

When this runs, replace `Text('First test')` with `Padding`, then add a
`Column`, and finally add the real widgets. This makes errors easier to find.

## Exercise 1: Hobby boxes

File: `lib/ex1/main.dart`

### Goal

Create two colored boxes for Travelling and Skating. Each box has an icon and
a name.

### Write it step by step

1. Import Flutter:

   ```dart
   import 'package:flutter/material.dart';
   ```

2. Start the app:

   ```dart
   void main() => runApp(const HobbiesApp());
   ```

3. Create `HobbiesApp extends StatelessWidget`.
4. Inside `build()`, return `MaterialApp`.
5. Add a `Scaffold` with an app bar and a grey background.
6. Put `Padding` in the body. `padding` creates space around the content.
7. Put a `Column` inside the padding. A `Column` places widgets vertically.
8. Create a reusable function:

   ```dart
   Widget hobbyBox(String name, IconData icon, Color color) {
   ```

   The function receives the name, icon, and color. This avoids writing the
   same box layout twice.

9. In `hobbyBox()`, return a `Container`.
10. Use `BoxDecoration` to add a background color and rounded corners.
11. Use a `Row` to place the icon and text next to each other.
12. Add the boxes:

    ```dart
    // The function keeps the layout the same.
    // Only the name, icon, and color change.
    hobbyBox('Travelling', Icons.travel_explore, Colors.green),
    hobbyBox('Skating', Icons.skateboarding, Colors.blueGrey),
    ```

`Icons.travel_explore` and `Icons.skateboarding` are built-in Material icons.

## Exercise 2: Custom buttons

File: `lib/ex2/main.dart`

### Goal

Create buttons with different text, colors, and icon positions.

### Write it step by step

1. Start with the normal import, `main()`, app class, `build()`,
   `MaterialApp`, and `Scaffold`.
2. Put a `Column` in the body so the buttons appear vertically.
3. Add the first button call. Run the app and check it before adding the
   other buttons.
4. Create a reusable function:

   ```dart
   Widget customButton(
     String label,
     IconData icon,
     Color color, [
     bool iconOnRight = false,
   ])
   ```

5. Create the icon and text:

   ```dart
   final iconWidget = Icon(icon, color: Colors.white);
   final text = Text(label);
   ```

6. Put them in a centered `Row`.
7. Use an optional boolean parameter to choose the icon position:

   ```dart
   iconOnRight
       ? [text, iconWidget]
       : [iconWidget, text]
   ```

   The `?` means “use the first list when true”; `:` means “otherwise use the
   second list”.

8. Add padding, a color, and rounded corners with `Container`.
9. Call the function three times:

   ```dart
   // The icon is on the left by default.
   customButton('Submit', Icons.check, Colors.blue),
   // true moves the icon to the right.
   customButton('Time', Icons.access_time, Colors.green, true),
   customButton('Account', Icons.account_tree, Colors.grey, true),
   ```

`const SizedBox(height: 10)` adds space between buttons. The `const` warning
appears when a widget can be constant but is written without `const`.

## Exercise 3: Product cards and images

File: `lib/ex3/main.dart`

### Goal

Display product cards with an image, title, and description.

### Write it step by step

1. Confirm that the images are in:

   ```text
   assets/ex3/dart.png
   assets/ex3/flutter.png
   assets/ex3/firebase.png
   ```

2. Confirm that `pubspec.yaml` contains:

   ```yaml
   flutter:
     assets:
       - assets/ex3/
   ```

   This gives Flutter permission to load the images.

3. Start with `main()`, `ProductsApp`, `build()`, `MaterialApp`, and
   `Scaffold`.
4. Put a blue background on the scaffold.
5. Put a `Column` in `Padding`.
6. Create a reusable function:

   ```dart
   Widget productCard(String title, String description, String image)
   ```

7. In `productCard()`, use a `Card` to create a white card.
8. Add `Padding` inside the card.
9. Add `Image.asset(image)` to display an image from the assets folder.
10. Add text with `Text(title)` and `Text(description)`.
11. Add one card for each product:

   ```dart
   // The image path tells Flutter which file to show.
   productCard(
     'Dart',
     'the best object language',
     'assets/ex3/dart.png',
   ),
   ```

The asset path is a string. It must match the path in `pubspec.yaml` and the
real file name exactly.

## Exercise 4: Weather cards

File: `lib/ex4/main.dart`

### Goal

Display weather cards with a city name, weather image, temperatures, and a
color gradient.

### Write it step by step

1. Confirm that the weather images are in:

   ```text
   assets/ex4/cloudy.png
   assets/ex4/sunny.png
   assets/ex4/sunnyCloudy.png
   assets/ex4/veryCloudy.png
   ```

2. Confirm that `pubspec.yaml` contains:

   ```yaml
   flutter:
     assets:
       - assets/ex4/
   ```

3. Start with `main()`, `WeatherApp`, `build()`, `MaterialApp`, and
   `Scaffold`.
4. Use a `ListView` instead of a `Column`. A `ListView` can scroll when there
   are many cards.
5. Create a reusable function:

   ```dart
   Widget weatherCard(
     String city,
     String image,
     double min,
     double max,
     double current,
     List<Color> colors,
   )
   ```

6. In the function, use `LinearGradient` to blend two named colors:

   ```dart
   gradient: LinearGradient(
     colors: [Colors.purple, Colors.deepPurple],
   )
   ```

7. Use `Image.asset(image)` to show the weather picture.
8. Use `Row` for the image, city information, and current temperature.
9. Use `Expanded` so the city information uses the available middle space.
10. Format decimal temperatures:

   ```dart
   current.toStringAsFixed(1)
   ```

   This displays one number after the decimal point.
11. Add one card for each city. The first two colors are the gradient colors:

    ```dart
    // Two colors make a smooth background gradient.
    weatherCard(
      'Phnom Penh',
      'assets/ex4/cloudy.png',
      10,
      30,
      12.2,
      [Colors.purple, Colors.deepPurple],
    ),
    ```

Useful named colors include `Colors.purple`, `Colors.green`, `Colors.pink`,
`Colors.orange`, `Colors.blue`, and `Colors.grey`.

## 5. How to practise

After finishing each exercise, change one thing yourself:

- Change a title or description.
- Change a named color, such as `Colors.blue` to `Colors.purple`.
- Change an icon, such as `Icons.check` to `Icons.star`.
- Add another card or box.
- Change padding or spacing.

First predict what the change will do, then run the app and compare the
result. This is better practice than only copying the finished code.

## 6. Common problems

### The image does not appear

- Check the image path and spelling.
- Check that the asset folder is listed in `pubspec.yaml`.
- Run `flutter pub get`.
- Stop and run the app again after changing `pubspec.yaml`.

### A yellow warning appears under a widget

Read the warning message. Common fixes include:

- Add `const` to constant widgets such as `const SizedBox(...)`.
- Format the file with:

  ```bash
  dart format lib/ex1/main.dart
  ```

- Check that brackets and commas are in the correct places.

### The app does not start

Run the command from the project folder and use the correct target:

```bash
flutter run -t lib/ex1/main.dart
```

### Changes do not appear

Save the file, then use hot reload. If the change affects assets or the app
structure, stop the app and run it again.
