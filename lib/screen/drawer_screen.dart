import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.only(),
            children: [
              DrawerHeader(
                child: Text('Header'),
                decoration: BoxDecoration(color: Colors.blue),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 3'),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
        appBar: AppBar(title: Text('Drawer')),
        body: Center(child: Text('Drawer 예제')));
  }
}
