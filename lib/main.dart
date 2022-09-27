import 'package:flutter/material.dart';
import 'package:flutter_widgets/custom/custom_circular_progress.dart';

import 'package:flutter_widgets/screen/animated_container_screen.dart';
import 'package:flutter_widgets/screen/animated_opacity_screen.dart';
import 'package:flutter_widgets/screen/battery_plugin_screen.dart';
import 'package:flutter_widgets/screen/button_above_keyboard.dart';
import 'package:flutter_widgets/screen/permission_request_screen.dart';
import 'package:flutter_widgets/screen/custom_card_screen.dart';
import 'package:flutter_widgets/screen/drawer_screen.dart';
import 'package:flutter_widgets/screen/first_screen.dart';
import 'package:flutter_widgets/screen/second_screen.dart';
import 'package:flutter_widgets/screen/third_screen.dart';
import 'package:flutter_widgets/screen/flexible_expanded_screen.dart';
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
      theme: ThemeData(primaryColor: Colors.blue, brightness: Brightness.dark),
      initialRoute: HomeScreen.routeName,
      onGenerateRoute: generateRoute,
      routes: routes,
    );
  }

  Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case ThirdScreen.routeName:
        return MaterialPageRoute(
          builder: (context) {
            var map = routeSettings.arguments as Map<String, dynamic>;
            return ThirdScreen(
              update: map['update'] as bool,
            );
          },
          settings: routeSettings,
        );
      default:
        return null;
    }
  }
}

class HomeScreen extends StatelessWidget {
  static String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Flutter Widgets"),
      ),
      body: Container(
        child: Column(
          children: [
            CustomCircularProgress(width: 300, height: 300, startAngle: 60,),
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
                  ListTile(
                    title: Text('FirstScreen'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FirstScreen()));
                    },
                  ),
                  ListTile(
                    title: Text('SecondScreen'),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        SecondScreen.routeName,
                      );
                    },
                  ),
                  ListTile(
                    title: Text('ThirdScreen'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ThirdScreen(update: true)));
                      // Navigator.pushNamedAndRemoveUntil(context, ThirdScreen.routeName, ModalRoute.withName(HomeScreen.routeName), arguments: {"update": true});
                      // Navigator.pushReplacementNamed(context, ThirdScreen.routeName);
                    },
                  ),
                  ListTile(
                    title: Text('FourthScreen'),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        ButtonAboveKeyboardScreen.routeName,
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Card'),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        CustomCardScreen.routeName
                      );
                    }
                  ),
                  ListTile(
                      title: Text('Battery Plugin Screen'),
                      onTap: () {
                        Navigator.pushNamed(
                            context,
                            BatteryPluginScreen.routeName
                        );
                      }
                  ),
                  ListTile(
                      title: Text('Request Permission Screen'),
                      onTap: () {
                        Navigator.pushNamed(
                            context,
                            PermissionRequestScreen.routeName
                        );
                      }
                  ),
                        );
                      }
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

final routes = {
  ButtonAboveKeyboardScreen.routeName: (context) => ButtonAboveKeyboardScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  SecondScreen.routeName: (context) => SecondScreen(),
  CustomCardScreen.routeName: (context) => CustomCardScreen(),
  BatteryPluginScreen.routeName: (context) => BatteryPluginScreen(),
  PermissionRequestScreen.routeName: (context) => PermissionRequestScreen(),
};
