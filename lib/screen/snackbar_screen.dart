import 'package:flutter/material.dart';

class SnackBarScreen extends StatefulWidget {
  _SnackBarState createState() => _SnackBarState();
}

class _SnackBarState extends State<SnackBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SnackBar'),
      ),
      body: Builder( // Builder라는 것은 새로운 context를 만들고 화면을 만들 수 있음
        builder: (context) => Center(
          child: ElevatedButton(
            onPressed: () {
              final snackBar = SnackBar(content: Text('나는 스낵바'),
              action: SnackBarAction(label: '취소', onPressed: () {},),
              );
              // ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Scaffold.of(context).showSnackBar(snackBar);
            },
            child: Text('Show SnackBar'),
          ),
        ),
      ),
    );
  }
}

/*
class _SnackBarState extends State<SnackBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SnackBar'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final snackBar = SnackBar(
              content: Text('나는 스낵바')
            );
            // ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Scaffold.of(context).showSnackBar(snackBar);
          },
          child: Text('Show SnackBar'),
        ),
      ),
    );
  }
}
*/
