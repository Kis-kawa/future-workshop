import 'package:flutter/material.dart';
import 'package:judotimer/drawer.dart';

class PracticeSetting extends StatelessWidget {
  const PracticeSetting({super.key});

  @override
  Widget build(BuildContext context) {

  const drawer = Drawer(
    child: SideBar(),
  );

  final appBar = AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
  );

final backRegion = SizedBox(
  child: AspectRatio(
    aspectRatio: 1248 / 843,
    child: Container(
      padding: const EdgeInsets.all(30),
      child: Container(
        color: Colors.amber,//背景
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 20, 5, 20),
                child: Container(color: Colors.blue,),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Container(color: Colors.red,),
              ),
            ),
          ],
        ),
        ),
    ),
  ),
);

  // final backRegion = SizedBox(
  //     child: Column(
  //         children: [
  //           Expanded(
  //             flex: 9,
  //             child: Container(
  //               color: const Color.fromARGB(255, 24, 24, 24),
  //               padding: const EdgeInsets.fromLTRB(30, 5, 30, 30),
  //               child: Align(
  //                 child: Container(
  //                     color: Colors.amber,
  //                     child: AspectRatio(
  //                       aspectRatio: 1721 / 940,
  //                       child: Column(
  //                         children: [
  //                           Expanded(
  //                             flex: 9,
  //                             child: Align(
  //                               alignment: Alignment.center,
  //                               child:Expanded(
  //                                 child: Row(
  //                                   children: [
  //                                     Expanded(flex:4 ,child: Container(color: Colors.red,),),
  //                                     Expanded(flex:6 ,child: Container(color: Colors.amber,),),
  //                                     Expanded(flex:4 ,child: Container(color: Colors.red,),),
  //                                   ],
  //                                 ),
  //                                 ),
  //                             ),
  //                           ),
  //                           Expanded(
  //                             flex: 1,
  //                             child: Container(color: Colors.green),
  //                           ),
  //                           Expanded(
  //                             flex: 9,
  //                             child: Row(
  //                               children: [
  //                                 Expanded(flex: 5, child: Container(color: Colors.blueAccent,),),
  //                                 Expanded(flex: 1, child: Container(color: Colors.amber,),),
  //                                 Expanded(flex: 5, child: Container(color: Colors.blueAccent,),),
  //                                 Expanded(flex: 1, child: Container(color: Colors.amber,),),
  //                                 Expanded(flex: 5, child: Container(color: Colors.blueAccent,),),
  //                               ],
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //               ),
  //             ),
  //           ),
  //           Expanded(
  //               flex: 1,
  //               child: Container(
  //                 color: const Color.fromARGB(255, 76, 86, 87),
  //                 child: Align(
  //                   alignment: Alignment.center,
  //                   child: Container(
  //                     color: Colors.amber,
  //                     width: 200,
  //                     child: const Center(child: Text('ボタン')),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //         ],
  //       ),
  //     );

  final scaffold = Scaffold(
    backgroundColor: const Color.fromARGB(255, 24, 24, 24),
    appBar: appBar,
    body: Center(child: backRegion,),
    drawer: drawer,
  );

    return scaffold;
  }
}
