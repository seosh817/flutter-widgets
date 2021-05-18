import 'package:flutter/material.dart';

class OrientationBuilderScreen extends StatefulWidget {
  _OrientationBuilderState createState() => _OrientationBuilderState();
}

class _OrientationBuilderState extends State<OrientationBuilderScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('OrientationBuilder'),
        ),
        body: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return GridView.count(
              crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
              children: List.generate(
                50,
                (index) {
                  return Center(
                    child: Text('Item $index'),
                  );
                },
              ),
            );
          },
        ),
      );
}
