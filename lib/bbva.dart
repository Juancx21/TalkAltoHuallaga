import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:firstalk/withoutstate.dart';

class Bbvaanimation extends StatefulWidget {
  Bbvaanimation({Key? key}) : super(key: key);

  @override
  _BbvaanimationState createState() => _BbvaanimationState();
}

class _BbvaanimationState extends State<Bbvaanimation>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale, translatex, translatey;
  bool isanimated = false;

  @override
  void initState() {
    controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    scale = Tween(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(parent: controller, curve: Curves.linear),
    );
    translatex = Tween(begin: 0.0, end: 0.7).animate(
      CurvedAnimation(parent: controller, curve: Curves.linear),
    );
    translatey = Tween(begin: 0.0, end: 0.025).animate(
      CurvedAnimation(parent: controller, curve: Curves.linear),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, __) {
        return Transform.scale(
          scale: scale.value,
          child: Transform.translate(
            offset: Offset(
              translatex.value * sizeScreen.width,
              translatey.value * sizeScreen.height,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Withoutstate(),
                  Positioned(
                    bottom: 30,
                    right: 30,
                    child: GestureDetector(
                      onTap: () {
                        controller.forward();
                        isanimated = true;
                      },
                      child: Container(
                        child: Icon(
                          Icons.dehaze_rounded,
                          size: 42,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  isanimated
                      ? TextButton(
                          onPressed: () {
                            controller.reverse();
                            isanimated = false;
                          },
                          child: Container(
                            height: sizeScreen.height,
                            width: sizeScreen.width,
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
