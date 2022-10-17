import 'package:fake_store_app/pages/sign_in_page.dart';
import 'package:fake_store_app/pages/sign_up_page.dart';
import 'package:fake_store_app/resources/colors.dart';
import 'package:fake_store_app/resources/dimens.dart';
import 'package:fake_store_app/widgets/sign_in_button_view.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: PRIMARY_COLOR,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/welcome_image.png",
                height: MediaQuery.of(context).size.height * 1 / 3,
              ),
              SizedBox(height: MARGIN_CARD_MEDIUM_2),
              Text(
                "Welcome to Fake Store App",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_REGULAR_3X,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: MARGIN_XLARGE),
              SignInButtonView(
                title: "Sign Up",
                buttonColor: Colors.white,
                textColor: PRIMARY_COLOR,
                onTap: () {
                  navigateToNextScreen(context, SignUpPage());
                },
              ),
              SizedBox(height: MARGIN_MEDIUM_2),
              SignInButtonView(
                title: "Sign In",
                buttonColor: Color.fromRGBO(248, 187, 208, 1.0),
                textColor: Colors.white,
                onTap: () {
                  navigateToNextScreen(context, SignInPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToNextScreen(BuildContext context, Widget nextScreen) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => nextScreen,
      ),
    );
  }
}