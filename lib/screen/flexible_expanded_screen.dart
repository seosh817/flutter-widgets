import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlexibleExpandedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flexible Expanded Example'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'overflowed widgets',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Container(
                      width: 300,
                      height: 100,
                      color: Colors.blue,
                    ),
                    Container(
                      width: 600,
                      height: 100,
                      color: Colors.green,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  'Flexible FlexFit loose',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Container(
                      width: 300,
                      height: 100,
                      color: Colors.blue,
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Container(
                        width: 600,
                        height: 100,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  'Flexible FlexFit loose',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Container(
                      width: 300,
                      height: 100,
                      color: Colors.blue,
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Container(
                        width: 50,
                        height: 100,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  'Flexible FlexFit tight',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                        width: 50,
                        height: 100,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  'Flexible flex',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: Container(
                        height: 100,
                        color: Colors.blue,
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        height: 100,
                        color: Colors.green,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: 100,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  'Expanded',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Container(
                      width: 300,
                      height: 100,
                      color: Colors.blue,
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}