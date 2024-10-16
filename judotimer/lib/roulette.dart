import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'dart:math';

import 'package:judotimer/drawer.dart';

class RouletteScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // 回転時間（3〜10秒のランダム）
    final random = Random();
    int time = random.nextInt(8) + 3;

    final List<String> items = [
      '-57kg', // 女子
      '-73kg', // 男子
      '-70kg',
      '-90kg',
      '+70kg',
      '+90kg',
    ];

    final scrollController = useScrollController(keepScrollOffset: false);
    final animationController = useAnimationController(
      duration: Duration(seconds: time),
    );

    useEffect(() {
      animationController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          final targetIndex = random.nextInt(items.length);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            scrollController.animateTo(
              targetIndex * 100.0,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeOut,
            );
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text('結果'),
                content: Text('選ばれたのは: ${items[targetIndex]}'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('閉じる'),
                  ),
                ],
              ),
            );
          });
        }
      });
      return null;
    }, [animationController]);

    void startRoulette() {
      time = random.nextInt(8) + 3;
      animationController.duration = Duration(seconds: time);

      animationController.reset();
      scrollController.animateTo(
        1000, // 大きな値にしてスムーズに見せる
        duration: animationController.duration!,
        curve: Curves.decelerate, // 減速させることでよりリアルに
      );
      animationController.forward();
    }

    const drawer = Drawer(
      backgroundColor: Color.fromARGB(255, 100, 113, 115),
      child: SideBar(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("ルーレット",style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho")),
        backgroundColor: Color.fromARGB(255, 100, 113, 115),
      ),
      drawer: drawer,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 400, // 高さを大きくしてルーレットを拡大
              width: 200, // 幅を大きくして表示を拡大
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.transparent,
                      Colors.black.withOpacity(0.5),
                    ],
                    stops: [0.2, 0.5, 0.8], // 中央部分を明るく
                  ).createShader(bounds);
                },
                blendMode: BlendMode.dstOut,
                child: ListWheelScrollView.useDelegate(
                  controller: scrollController,
                  itemExtent: 100, // 各項目のサイズを大きくして見やすく
                  physics: const FixedExtentScrollPhysics(),
                  childDelegate: ListWheelChildLoopingListDelegate(
                    children: items
                        .map(
                          (item) => Center(
                            child: Text(
                              item,
                              style: TextStyle(
                                fontSize: 32, // フォントサイズを大きく
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: startRoulette,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 100, 113, 115), // ボタンの色
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text(
                'スタート',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white, fontFamily: "Zen_Old_Mincho"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
