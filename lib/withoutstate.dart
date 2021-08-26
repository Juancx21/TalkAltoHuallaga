import 'package:flutter/material.dart';

class Withoutstate extends StatelessWidget {
  const Withoutstate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(120),
      child: Image.asset("assets/android.png"),
    );
  }
}
