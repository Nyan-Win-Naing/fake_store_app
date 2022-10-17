import 'package:fake_store_app/pages/home_page.dart';
import 'package:fake_store_app/pages/main_screen.dart';
import 'package:fake_store_app/resources/colors.dart';
import 'package:fake_store_app/resources/dimens.dart';
import 'package:fake_store_app/widgets/form_style_view.dart';
import 'package:fake_store_app/widgets/sign_in_button_view.dart';
import 'package:fake_store_app/widgets/sign_in_title_text.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: MARGIN_MEDIUM_3,
                ),
                Text(
                  "Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MARGIN_XLARGE),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                child: SignInTitleText(title: "Welcome Back"),
              ),
              SizedBox(height: MARGIN_XXLARGE),
              FormStyleView(
                label: "Email",
                hintText: "Enter your email",
              ),
              SizedBox(height: MARGIN_MEDIUM_2),
              FormStyleView(
                label: "Password",
                hintText: "Enter password",
                isPasswordField: true,
              ),
              SizedBox(height: MARGIN_XXLARGE),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                child: SignInButtonView(
                  title: "Log In",
                  buttonColor: Color.fromRGBO(244, 143, 177, 1.0),
                  textColor: Colors.white,
                  isWelcomePage: false,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
