import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:judotimer/help.dart';
import 'package:judotimer/roulette.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:judotimer/paga_a.dart';
import 'package:judotimer/page_b.dart';
import 'package:judotimer/page_c.dart';
import 'package:judotimer/page_d.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    state = [state[0]= 1, state[1]];
  }

  void nowazaari() {
    state = [state[0]=0, state[1]];
  }

  void sidou() {
    if (state[1] < 4) {
      state = [state[0], state[1] + 1];
    }
  }

  void nosidou() {
    if (state[1] > 0) {
      state = [state[0], state[1] - 1];
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
    state = [state[0]= 1, state[1]];
  }

  void nowazaari() {
    state = [state[0]=0, state[1]];
  }

  void sidou() {
    if (state[1] < 4) {
      state = [state[0], state[1] + 1];
    }
  }

  void nosidou() {
    if (state[1] > 0) {
      state = [state[0], state[1] - 1];
    }
  }
}

@riverpod
class MatchTimeNotifier extends _$MatchTimeNotifier {
  @override
  List<int> build() {
    return [180, 180];
  }

  void chMT(int time){
    state = [state[0]=time, state[1]=time];
  }

  void disMT(){
    state = [state[0], state[1]-1];
  }
}

@riverpod
class WazanasiOsaekomiTimeNotifier extends _$WazanasiOsaekomiTimeNotifier {
  @override
  List<int> build() {
    return [20, 20];
  }

  void chOT(int time){
    state = [state[0]=time, state[1]=time];
  }

  void disOT(){
    state = [state[0], state[1]-1];
  }

  void init(){
    state = [state[0] = state[0], state[1] = state[0]];
  }
}

@riverpod
class WazaariOsaekomiTimeNotifier extends _$WazaariOsaekomiTimeNotifier {
  @override
  List<int> build() {
    return [10, 10];
  }

  void chWOT(int time){
    state = [state[0]=time, state[1]=time];
  }

  void disWOT(){
    state = [state[0], state[1]-1];
  }
}

@riverpod
class WazanasiOsaekomi2TimeNotifier extends _$WazanasiOsaekomi2TimeNotifier {
  @override
  List<int> build() {
    return [20, 20];
  }

  void chOT(int time){
    state = [state[0]=time, state[1]=time];
  }

  void disOT(){
    state = [state[0], state[1]-1];
  }

  void init(){
    state = [state[0] = state[0], state[1] = state[0]];
  }
}

@riverpod
class WazaariOsaekomi2TimeNotifier extends _$WazaariOsaekomi2TimeNotifier {
  @override
  List<int> build() {
    return [10, 10];
  }

  void chWOT(int time){
    state = [state[0]=time, state[1]=time];
  }

  void disWOT(){
    state = [state[0], state[1]-1];
  }
}

@riverpod
class Player1ColorNotifier extends _$Player1ColorNotifier {
  @override
  int build() {
    return 1;
  }

  void inc() {
    if (state < 2) state += 1;
  }

  void dec() {
    if (state > 0) state -= 1;
  }

  void dinc() {
    if (state == 0) state += 2;
  }

  void ddec() {
    if (state == 2) state -= 2;
  }
}

@riverpod
class Player2ColorNotifier extends _$Player2ColorNotifier {
  @override
  int build() {
    return 0;
  }

  void inc() {
    if (state < 2) state += 1;
  }

  void dec() {
    if (state > 0) state -= 1;
  }

  void dinc() {
    if (state == 0) state += 2;
  }

  void ddec() {
    if (state == 2) state -= 2;
  }
}

@riverpod
class ModelsNotifier extends _$ModelsNotifier {
  @override
  List<TimeCell> build() {
    return [TimeCell("1", "00:10"), TimeCell("2", "01:00")];
  }

  void add(String num, String settime) {
    state = [...state, TimeCell(num, settime)];
  }

  void delete(int index) {
    List<TimeCell> list = List.from(state);
    list.removeAt(index);
    state = list;
  }

  int teach(int id) {
    for (int i=0; i < state.length; i++) {
      if (int.parse(state[i].num) == id) {
        return i;
      }
    }
    return -1;
  }
}

@riverpod
class SetSecondNotifier extends _$SetSecondNotifier {
  @override
  double build() {
    return 0;
  }

  void updatesec(double newValue) {
    state = newValue;
  }
}

@riverpod
class SetMinuteNotifier extends _$SetMinuteNotifier {
  @override
  double build() {
    return 0;
  }

  void updatemin(double newValue) {
    state = newValue;
  }
}

@riverpod
class RepCountNotifier extends _$RepCountNotifier {
  @override
  int build() {
    return 8;
  }

  void update(int newValue) {
    state = newValue;
  }
}

@riverpod
class Lang extends _$Lang {
  @override
  Locale build() {
    return Locale('ja');
  }

  void chja() {
    state = Locale('ja');
  }

  void chen() {
    state = Locale('en');
  }

  void chko() {
    state = Locale('ko');
  }
}

void main(){
  final app = App();
  final scope = ProviderScope(child: app,);
  runApp(scope);
}

class App extends ConsumerWidget {
  App({super.key});

  final router = GoRouter(
    initialLocation: "/help",
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
      GoRoute(
        path: "/help",
        builder: (context, state) => const MyHelp(),
      ),
      GoRoute(
        path: "/roulette",
        builder: (context, state) => RouletteScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context,  WidgetRef ref) {
    final locale = ref.watch(langProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      supportedLocales: const [
        Locale('en'),
        Locale('ja'),
        Locale('ko'),
      ],
      locale: locale,
    );
  }
}
