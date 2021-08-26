import 'package:flutter/material.dart';

class Withstate extends StatefulWidget {
  Withstate({Key? key}) : super(key: key);

  @override
  _WithstateState createState() => _WithstateState();
}

class _WithstateState extends State<Withstate> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$number"),
          TextButton(
              onPressed: () {
                setState(() {
                  number++;
                });
              },
              child: Container(
                color: Colors.red,
                padding: EdgeInsets.all(20),
                child: Text("Aumentar"),
              ))
        ],
      ),
    );
  }
}
