import 'package:flutter/material.dart';
import 'package:flutter_widgets/screen/animated_container_screen.dart';
import 'package:flutter_widgets/screen/animated_opacity_screen.dart';
import 'package:flutter_widgets/screen/button_above_keyboard.dart';
import 'package:flutter_widgets/screen/drawer_screen.dart';
import 'package:flutter_widgets/screen/flexible_expanded_screen.dart';
import 'package:flutter_widgets/screen/form_validation_screen.dart';
import 'package:flutter_widgets/screen/method_channel_screen.dart';
import 'package:flutter_widgets/screen/orientation_builder_screen.dart';
import 'package:flutter_widgets/screen/snackbar_screen.dart';
import 'package:flutter_widgets/screen/swipe_to_dismiss_screen.dart';
import 'package:flutter_widgets/screen/tab_controller_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widgets',
      theme: ThemeData(
          // primarySwatch: Colors.yellow
          primaryColor: Colors.blue,
          accentColor: Colors.yellow,
          brightness: Brightness.dark),
      routes: pages,
      home: new HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Flutter Widgets"),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => AnimatedContainerScreen()));
                  },
                  style: ButtonStyle(textStyle: MaterialStateProperty.all(TextStyle(fontSize: 14, color: Colors.white)), backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
                  child: Text("AnimatedContainer"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AnimatedOpacityScreen()));
                  },
                  style: ButtonStyle(textStyle: MaterialStateProperty.all(TextStyle(fontSize: 14, color: Colors.white)), backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
                  child: Text("AnimatedOpacity"),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Drawer'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DrawerScreen()));
                    },
                  ),
                  ListTile(
                    title: Text('SnackBar'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SnackBarScreen()));
                    },
                  ),
                  ListTile(
                    title: Text('OrientationBuilder'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => OrientationBuilderScreen()));
                    },
                  ),
                  ListTile(
                    title: Text('TabController'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TabControllerScreen()));
                    },
                  ),
                  ListTile(
                    title: Text('FormValidation'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FormValidationScreen()));
                    },
                  ),
                  ListTile(
                    title: Text('Swipe to Dismiss'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SwipeToDismissScreen()));
                    },
                  ),
                  ListTile(
                    title: Text('MethodChannel'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MethodChannelScreen()));
                    },
                  ),
                  ListTile(
                    title: Text('Expanded Flexible'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FlexibleExpandedScreen()));
                    },
                  ),
                  ListTile(
                    title: Text('ButtonAboveKeyboardScreen'),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        ButtonAboveKeyboardScreen.routeName,
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

final pages = {
  ButtonAboveKeyboardScreen.routeName: (context) => ButtonAboveKeyboardScreen(),
};
