# Tasks

## Task 1
```Dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(const Clock());

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  State<Clock> createState() {
    return _ClockState();
  }
}

class _ClockState extends State<Clock> {
  String? _clock;
  Timer? _timer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      setState(() {
        String clock = DateFormat('HH:mm:ss').format(DateTime.now());
        _clock = clock;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clock',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Widget'),
        ),
        body: Scaffold(
          body: Center(
            child: Text(
              _clock.toString(),
              style: TextStyle(fontSize: 32.0),
            ),
          ),
        ),
      ),
    );
  }
}
```
## Result
<img src="https://i.imgur.com/WsTBDVH.gif" width="200" />

## Task 2
```Dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter clock',
      home: Clock(),
    );
  }
}

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  Timer? _timer;
  String? _clock;

  @override
  void initState() {
    _timer = Timer.periodic(
      const Duration(milliseconds: 1000),
      (timer) => _getClock(),
    );

    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widget'),
      ),
      body: _clock != null ? _showClock() : null,
    );
  }

  Widget _showClock() {
    return Center(
      child: Text(
        _clock.toString(),
        style: const TextStyle(
          fontSize: 32.0,
        ),
      ),
    );
  }

  void _getClock() {
    DateTime dateTime = DateTime.now();
    String clock = DateFormat('HH:mm:ss').format(dateTime);
    setState(() => _clock = clock);
  }
}
```
## Result
<img src="https://i.imgur.com/WsTBDVH.gif" width="200" />
