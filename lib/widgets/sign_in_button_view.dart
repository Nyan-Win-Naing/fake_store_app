import 'package:fake_store_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class SignInButtonView extends StatelessWidget {
  final String title;
  final Color buttonColor;
  final Color textColor;
  final Function onTap;
  final bool isWelcomePage;

  SignInButtonView({
    this.title,
    this.buttonColor,
    this.textColor,
    this.onTap,
    this.isWelcomePage = true,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 50,
      minWidth: (isWelcomePage) ? MediaQuery.of(context).size.width * 2.5 / 3 : double.infinity,
      child: RaisedButton(
        onPressed: () {
          this.onTap();
        },
        color: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MARGIN_LARGE),
        ),
        elevation: 0,
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
