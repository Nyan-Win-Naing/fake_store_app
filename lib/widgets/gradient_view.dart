import 'package:fake_store_app/resources/colors.dart';
import 'package:flutter/material.dart';

class GradientView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Color.fromRGBO(255, 255, 255, 1),
          ]
        )
      ),
    );
  }
}
