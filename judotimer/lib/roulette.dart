import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'dart:math' as math;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:judotimer/drawer.dart';

class RouletteScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final time = useState(10); // 回転時間：2~5秒に変更

    final List<String> items = [
      '-57 kg',
      '-73 kg',
      '-70 kg',
      '-90 kg',
      '+70 kg',
      '+90 kg',
    ];

    final scrollController = useScrollController(keepScrollOffset: false);
    final animationController = useAnimationController(
      duration: Duration(seconds: time.value),
    );

    final targetIndex = useState(0);
    final isAnimating = useState(false);

    useEffect(() {
      configureAnimationListener(
        animationController,
        scrollController,
        targetIndex,
        isAnimating,
      );
      return null;
    }, [animationController]);

    void startRoulette() {
      if (isAnimating.value) return;

      isAnimating.value = true;
      time.value = math.Random().nextInt(2) + 1; // 回転時間を2〜5秒に設定
      animationController.duration = Duration(seconds: time.value);
      targetIndex.value = math.Random().nextInt(items.length);

      animationController.reset();

      // 最初は速く回り、最後の2周でゆっくり決まる
      scrollController.animateTo(
        10000 + (targetIndex.value * 170.0), // スクロールの距離を増やす
        duration: animationController.duration!,
        curve: Curves.linear,
      );

      // アニメーションを最後の2周を遅くする
      animationController.forward().whenComplete(() {
        scrollController.animateTo(
          targetIndex.value * 170.0,
          duration: Duration(seconds: 9), // 最後の調整時間を設定
          curve: Curves.easeOut, // 最後の部分をゆっくり決まるように
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          // "ルーレット",
          AppLocalizations.of(context)!.title,
          style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho"),
        ),
        backgroundColor: Color.fromARGB(255, 50, 50, 150),
      ),
      drawer: const Drawer(
        backgroundColor: Color.fromARGB(255, 100, 113, 115),
        child: SideBar(),
      ),
      body: buildBody(
        buildBackground(),
        buildRouletteWheel(scrollController, items, targetIndex, isAnimating),
        buildStartButton(startRoulette),
      ),
    );
  }

  Widget buildBody(Widget background, Widget rouletteWheel, Widget startButton) {
    return Stack(
      children: [
        background,
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              rouletteWheel,
              SizedBox(height: 30),
              startButton,
            ],
          ),
        ),
      ],
    );
  }

  Widget buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color.fromARGB(255, 14, 35, 55),
            const Color.fromARGB(255, 50, 73, 123),
            const Color.fromARGB(255, 50, 73, 123),
            const Color.fromARGB(255, 14, 35, 55),
          ],
          stops: [0.0, 0.4, 0.6, 1.0],
        ),
      ),
    );
  }

  Widget buildRouletteWheel(
    ScrollController scrollController,
    List<String> items,
    ValueNotifier<int> targetIndex,
    ValueNotifier<bool> isAnimating,
  ) {
    return Container(
      height: 600,
      width: 900,
      child: ShaderMask(
        shaderCallback: (bounds) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.white,
              Colors.white,
              Colors.transparent,
            ],
            stops: [0.0, 0.2, 0.8, 1.0],
          ).createShader(bounds);
        },
        blendMode: BlendMode.dstIn,
        child: ListWheelScrollView.useDelegate(
          controller: scrollController,
          itemExtent: 170,
          physics: const FixedExtentScrollPhysics(),
          childDelegate: ListWheelChildLoopingListDelegate(
            children: items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              final isSelected = index == targetIndex.value && !isAnimating.value;
              return buildItem(item, isSelected);
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget buildItem(String item, bool isSelected) {
    final isWomenClass = item == '-57 kg' || item == '-70 kg' || item == '+70 kg';

    return Center(
      child: Text(
        item,
        style: TextStyle(
          fontSize: 130,
          fontWeight: FontWeight.bold,
          color: isWomenClass
              ? Colors.white
              : (isSelected ? Colors.white : Colors.lightBlueAccent),
        ),
      ),
    );
  }

  Widget buildStartButton(VoidCallback startRoulette) {
    return ElevatedButton(
      onPressed: startRoulette,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 50, 50, 150),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      ),
      child: Text(
        'スタート',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: "Zen_Old_Mincho",
        ),
      ),
    );
  }

  void configureAnimationListener(
    AnimationController animationController,
    ScrollController scrollController,
    ValueNotifier<int> targetIndex,
    ValueNotifier<bool> isAnimating,
  ) {
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          // 最後の2周をゆっくり決まるように
          scrollController.animateTo(
            targetIndex.value * 170.0,
            duration: Duration(seconds: 1),
            curve: Curves.easeOut,
          );
        });
        isAnimating.value = false;
      }
    });
  }
}
