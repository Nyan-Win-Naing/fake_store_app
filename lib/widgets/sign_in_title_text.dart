import 'package:fake_store_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class SignInTitleText extends StatelessWidget {
  String title;

  SignInTitleText({this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: TEXT_HEADING_1X,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
