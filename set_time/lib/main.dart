import 'package:flutter/material.dart';
import 'package:segment_display/segment_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  const app = MaterialApp(home: MyApp());
  const scope = ProviderScope(child: app);
  runApp(scope);
}

final durations = StateProvider<Duration>(
  (ref) {
    return const Duration(minutes: 4);
  }
);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final duration = ref.watch( durations );
    void showDialog(Widget child) {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          height: 216,
          padding: const EdgeInsets.only(top: 6.0),
          // The bottom margin is provided to align the popup above the system
          // navigation bar.
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Provide a background color for the popup.
          color: CupertinoColors.systemBackground.resolveFrom(context),
          // Use a SafeArea widget to avoid system overlaps.
          child: SafeArea(
            top: false,
            child: child,
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text("set_time")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () => showDialog(
                CupertinoTimerPicker(
                  mode: CupertinoTimerPickerMode.ms,
                  initialTimerDuration: duration,
                  onTimerDurationChanged: (Duration newDuration) {
                    final notifier = ref.read( durations.notifier );
                    notifier.state = newDuration;
                  },
                ),
              ),
              child: SevenSegmentDisplay(
                value: "$duration".substring(2, 7),
                size: 12.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

