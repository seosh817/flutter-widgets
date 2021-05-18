import 'package:flutter/material.dart';

class TabControllerScreen extends StatefulWidget {
  _TabControllerState createState() => _TabControllerState();
}

class _TabControllerState extends State<TabControllerScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabController'),
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.alarm), text: 'Tab1',),
            Tab(icon: Icon(Icons.movie)),
            Text('Tab3'),
          ],),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Tab1')),
            Icon(Icons.check),
            Center(child: Text('Tab3')),
          ],
        ),
      ),
    );
  }
}