import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget {
  const StackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ColoredBox(
          color: Colors.black,
          child: FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor: 0.5,
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Container(
                    width: 150.0,
                    height: 150.0,
                    color: Colors.yellow,
                  ),
                ),
                Image.network('')
                PositionedDirectional(
                  bottom: 10.0,
                  start: 10.0,
                  width: 50.0,
                  child: SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: ColoredBox(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
