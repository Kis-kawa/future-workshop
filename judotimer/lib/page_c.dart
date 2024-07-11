import 'package:flutter/material.dart';
import 'package:judotimer/drawer.dart';

class GameHome extends StatelessWidget {
  const GameHome({super.key});

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
      child: Column(
          children: [
            Expanded(
              flex: 9,
              child: Container(
                color: const Color.fromARGB(255, 24, 24, 24),
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 30),
                child: Align(
                  child: Container(
                      color: Colors.amber,
                      child: AspectRatio(
                        aspectRatio: 1721 / 940,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 9,
                              child: Align(
                                alignment: Alignment.center,
                                child:Expanded(
                                  child:Row(
                                    children: [
                                      Expanded(flex:4 ,child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Expanded(flex:1 ,child: Container(color: Colors.red,),),
                                          Expanded(flex:2 ,child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Expanded(flex:1 ,child: Container(color: Colors.amber,),),
                                              Expanded(flex:1 ,child: Column(children: [
                                                Expanded(flex:1 ,child: Container(color: Colors.blueGrey,),),
                                                Expanded(flex:1 ,child: Container(color: Colors.red,),),
                                              ],),),
                                            ],
                                            ),
                                          ),
                                        ],
                                      )),
                                      Expanded(flex:10 ,child: Container(color: Colors.amber,),),
                                      Expanded(flex:4 ,child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Expanded(flex:1 ,child: Container(color: Colors.red,),),
                                          Expanded(flex:2 ,child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Expanded(flex:1 ,child: Column(children: [
                                                Expanded(flex:1 ,child: Container(color: Colors.blueGrey,),),
                                                Expanded(flex:1 ,child: Container(color: Colors.red,),),
                                              ],),),
                                              Expanded(flex:1 ,child: Container(color: Colors.amber,),),
                                            ],
                                            ),
                                          ),
                                        ],
                                      )),
                                    ],
                                  ),
                                  ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween ,children: [
                                Expanded(flex: 1, child: Container(color: Colors.black,),),
                                Expanded(flex: 10, child: Container(color: Colors.white,),),
                                Expanded(flex: 18, child: Container(color: Colors.black,),),
                                Expanded(flex: 10, child: Container(color: Colors.blueAccent,),),
                                Expanded(flex: 1, child: Container(color: Colors.black,),),
                              ],),
                            ),
                            Expanded(
                              flex: 9,
                              child: Row(
                                children: [
                                  Expanded(flex: 5, child: Container(color: Colors.blueAccent,),),
                                  Expanded(flex: 1, child: Container(color: Colors.amber,),),
                                  Expanded(flex: 5, child: Container(color: Colors.blueAccent,),),
                                  Expanded(flex: 1, child: Container(color: Colors.amber,),),
                                  Expanded(flex: 5, child: Container(color: Colors.blueAccent,),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  color: const Color.fromARGB(255, 76, 86, 87),
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(flex: 3, child: Row(children: [
                          Expanded(flex: 4, child: Container(color: Colors.blueAccent,),),
                          Expanded(flex: 2, child: Container(color: Colors.green,),),
                          Expanded(flex: 3, child: Container(color: Colors.blueAccent,),),
                        ],),),
                        Expanded(flex: 2, child: Container(color: Colors.green,),),
                        Expanded(flex: 3, child: Container(color: Colors.blueAccent,),),
                        Expanded(flex: 2, child: Container(color: Colors.green,),),
                        Expanded(flex: 3, child: Row(children: [
                          Expanded(flex: 3, child: Container(color: Colors.blueAccent,),),
                          Expanded(flex: 2, child: Container(color: Colors.green,),),
                          Expanded(flex: 4, child: Container(color: Colors.blueAccent,),),
                        ],),),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      );


  final scaffold = Scaffold(
    backgroundColor: const Color.fromARGB(255, 24, 24, 24),
    appBar: appBar,
    body: backRegion,
    drawer: drawer,
  );

    return scaffold;
  }

}
