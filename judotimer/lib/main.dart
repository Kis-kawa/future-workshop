import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:judotimer/paga_a.dart';
import 'package:judotimer/page_b.dart';
import 'package:judotimer/page_c.dart';
import 'package:judotimer/page_d.dart';

part 'main.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@riverpod
class StatePracticeNotifier extends _$StatePracticeNotifier {
  @override
  String build() {
    return "previous";
  }

  void resetting() {
    state = "previous";
  }

  void working() {
    state = "working";
  }

  void waiting() {
    state = "waiting";
  }
}

@riverpod
class StateMatchNotifier extends _$StateMatchNotifier {
  @override
  String build() {
    return "previous";
  }

  void resetting() {
    state = "previous";
  }

  void working() {
    state = "working";
  }

  void waiting() {
    state = "waiting";
  }

  void osaekomi_1() {
    state = "osaekomi_1";
  }

  void osaekomi_2() {
    state = "osaekomi_2";
  }
}

@riverpod
class Player1Notifier extends _$Player1Notifier {
  @override
  List<int> build() {
    return [0, 0];
  }

  void previous() {
    state = [0, 0];
  }

  void wazaari() {
    state[0] = 1;
  }

  void nowazaari() {
    state[0] = 0;
  }

  void sidou() {
    if (state[1] < 4) {
      state[1]++;
    }
  }

  void nosidou() {
    if (state[1] > 0) {
      state[1]--;
    }
  }
}

@riverpod
class Player2Notifier extends _$Player2Notifier {
  @override
  List<int> build() {
    return [0, 0];
  }

  void previous() {
    state = [0, 0];
  }

  void wazaari() {
    state[0] = 1;
  }

  void nowazaari() {
    state[0] = 0;
  }

  void sidou() {
    if (state[1] < 4) {
      state[1]++;
    }
  }

  void nosidou() {
    if (state[1] > 0) {
      state[1]--;
    }
  }
}


void main(){
  final app = App();
  final scope = ProviderScope(child: app,);
  runApp(scope);
}

class App extends StatelessWidget {
  App({super.key});

  final router = GoRouter(
    initialLocation: "/a",
    routes: [
      GoRoute(
        path: "/a",
        builder: (context, state) => const PracticeHome(),
      ),
      GoRoute(
        path: "/b",
        builder: (context, state) => const PracticeSetting(),
      ),
      GoRoute(
        path: "/c",
        builder: (context, state) => const GameHome(),
      ),
      GoRoute(
        path: "/d",
        builder: (context, state) => const GameSetting(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
