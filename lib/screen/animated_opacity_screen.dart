import 'package:flutter/material.dart';

class AnimatedOpacityScreen extends StatefulWidget {
  _AnimatedOpacityState createState() => _AnimatedOpacityState();
}

class _AnimatedOpacityState extends State<AnimatedOpacityScreen> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AnimatedOpacity'),
        ),
      body: Center(
        child: AnimatedOpacity(opacity: _visible ? 1.0 : 0.0, duration: Duration(seconds: 1),
        child: Container(
          width: 200,
          height: 200,
          color: Colors.green
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
          child: Icon(Icons.play_arrow)
      ),
    );
  }
}