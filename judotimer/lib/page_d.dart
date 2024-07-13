// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:judotimer/drawer.dart';


class PlayerColor extends StatelessWidget {
  final int numcolor;
  const PlayerColor({
    super.key,
    required this.numcolor,
  });

  @override
  Widget build(BuildContext context) {
    "$numcolor";

    Color containerColor;

    if (numcolor == 0) {
      containerColor = Colors.white;
    } else if (numcolor == 1) {
      containerColor = Colors.red;
    } else if (numcolor == 2) {
      containerColor = Colors.blue;
    } else {
      containerColor = Colors.black; // 決めてない
    }

    return Container(
      // width: 50,
      // height: 200,
      color: containerColor,
      margin: const EdgeInsets.all(5),
    );
  }
}


class GameSetting extends StatelessWidget {
  const GameSetting({super.key});

  @override
  Widget build(BuildContext context) {

  final leftContant = Column(
                  children: [
                    Expanded(flex: 2,child: Container(color: Colors.black,),),
                    Expanded(flex: 2,child: Container(color: Colors.white,),),
                    Expanded(flex: 1,child: Container(color: Colors.black,),),
                    Expanded(flex: 8,child: Container(alignment:Alignment.center, child: Row(
                      children: [
                        Expanded(flex: 1,child: Container(color: Colors.black,),),
                        const Expanded(flex: 3, child: PlayerColor(numcolor: 2),),
                        Expanded(flex: 1,child: Container(color: Colors.black,),),
                        const Expanded(flex: 3, child: PlayerColor(numcolor: 0),),
                        Expanded(flex: 1,child: Container(color: Colors.black,),),
                      ],
                    ),),),
                    Expanded(flex: 1,child: Container(color: Colors.black,),),
                  ],
                );


  final lightContantu = Container(
    color: Colors.amber,
    margin: const EdgeInsets.fromLTRB(55, 30, 55, 30),
    child:Align(alignment: Alignment.center, child: SizedBox(
        width: 500,
        child: Column(
          children: [
            Expanded(flex: 1,child: Container(color: Colors.black,),),
            Expanded(flex: 1,child: Container(color: Colors.white,),),
            Expanded(flex: 1,child: Container(color: Colors.black,),),
            Expanded(flex: 1,child: Container(color: Colors.white,),),
            Expanded(flex: 1,child: Container(color: Colors.black,),),
            Expanded(flex: 1,child: Container(color: Colors.white,),),
          ],
        ),
      ),),
    );

  final con = Align(
    alignment: Alignment.center,
    child: Container(
      margin: const EdgeInsets.fromLTRB(100, 40, 100, 40),
      color: Colors.red,
      child: Container(
        margin: const EdgeInsets.fromLTRB(40, 40, 40, 40),
          color: Colors.amber,
          child: Container(color: Colors.green, child: Row(
            children: [
              Expanded(flex: 1, child: leftContant,),
              Expanded(flex: 3, child: Container(child: lightContantu),),
            ],
          ),),
        ),
      ),
  );


  const drawer = Drawer(
    child: SideBar(),
  );

  final appBar = AppBar(
    title: const Text("試合モードの設定"),
    backgroundColor: Colors.red[300],
  );

  final scaffold = Scaffold(
    appBar: appBar,
    body: con,
    drawer: drawer,
  );

    return scaffold;
  }

}
