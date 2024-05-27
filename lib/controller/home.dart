import 'package:flutter/material.dart';
import 'package:learn_music/model/bar_choice.dart';
import 'package:learn_music/views/music_view.dart';

class Home extends StatefulWidget{
@override
HomeState createState() => HomeState();


}


class HomeState extends State<Home> {

int currentIndex = 0;
List<BarChoice> items = [
  BarChoice(label: 'Music', icon: Icons.music_note, page: MusicView()),
   BarChoice(label: 'Favoris', icon: Icons.whatshot, page: Container()),
    BarChoice(label: 'Recherche', icon: Icons.search, page: Container()),


];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(10),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  const Row(
                    children: [
                      Spacer(),
                      Icon(Icons.radio),
                      Icon(Icons.doorbell),
                      Icon(Icons.settings)
                    ],
                  ),
                items[currentIndex].titleForApp
                
                 ,
            ],),),
          ),
        ),
        body: items[currentIndex].page,
        bottomNavigationBar: BottomNavigationBar(currentIndex: currentIndex ,
        items: items.map((e) => e.getBarItem).toList(),
        onTap: barTapped ,
        )
        ,
      ),
    );
  }

barTapped(int index) {
  setState(() {
    currentIndex = index;
  });
}

}