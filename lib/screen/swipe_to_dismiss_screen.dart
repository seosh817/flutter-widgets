import 'package:flutter/material.dart';

class SwipeToDismissScreen extends StatefulWidget {
  _SwipeToDismissState createState() => _SwipeToDismissState();
}

class _SwipeToDismissState extends State<SwipeToDismissScreen> {
  final items = List<String>.generate(20, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Swipe To Dismiss'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Dismissible(
              background: Container(color: Colors.red,),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  setState(() {
                    if (direction == DismissDirection.startToEnd) {
                      items.removeAt(index);
                    }
                  });
                },
                key: Key(item),
                child: ListTile(title: Text('${items[index]}')));
          },
        ));
  }
}
