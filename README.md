# websok

A high level websocket library. Use it when working with websockets
to avoid a few boilerplate and make your code look cleaner.

Supports IO and HTML websockets.

Original project [Websok](https://github.com/ConsoleTVs/Websok)
I only updated some files for null safety

# How to use

## Pubspec.yaml

```yaml
publish_to: 'none'

adonis_websok_null_safety:
  git:
    url: https://github.com/djpfs/AdonisWebsokNullSafety.git
```

## Import

```dart
import 'package:websokNullSafety/io.dart';
```

# Getting Started

```dart
/// For HTML:
/// import 'package:websok/html.dart';
///
/// For IO (Flutter, Dart, etc.)
import 'package:websokNullSafety/io.dart';

/// Testing library.
import 'package:test/test.dart';

/// The received string.
String received;
/// Callback to execute when the function is over.
void onData(dynamic message) => received = message;

void main() {
  test('Performs a test websocket connection', () async {
    /// For HTML: IOWebsok -> HTMLWebsok
    final sok = IOWebsok(host: 'echo.websocket.org', tls: true)
      ..connect()
      ..listen(onData: onData);
    // Assets the connection.
    expect(sok.isActive, true);
    // Send a message.
    final message = 'Hello, world!';
    sok.send(message);
    // Check the message.
    await Future.delayed(Duration(seconds: 1), () => expect(received, message));
    // Close the connection after 1 sec.
    sok.close();
    // Assets the connection.
    expect(sok.isActive, false);
  });
}
```
