import 'dart:io';

import 'package:fake_store_app/blocs/sign_up_bloc.dart';
import 'package:fake_store_app/resources/colors.dart';
import 'package:fake_store_app/resources/dimens.dart';
import 'package:fake_store_app/widgets/form_style_view.dart';
import 'package:fake_store_app/widgets/sign_in_button_view.dart';
import 'package:fake_store_app/widgets/sign_in_title_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpBloc(),
      child: Scaffold(
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
                  child: SignInTitleText(title: "Get Started"),
                ),
                SizedBox(height: MARGIN_MEDIUM_2),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                  child: Text(
                    "Create Your Account!",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: MARGIN_XXLARGE),
                ProfileImageChooseSectionView(),
                SizedBox(height: MARGIN_MEDIUM_3),
                FormStyleView(
                  label: "Name",
                  hintText: "Enter your name",
                ),
                SizedBox(height: MARGIN_MEDIUM_2),
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
                    title: "Sign Up",
                    buttonColor: Color.fromRGBO(244, 143, 177, 1.0),
                    textColor: Colors.white,
                    isWelcomePage: false,
                    onTap: () {},
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

class ProfileImageChooseSectionView extends StatelessWidget {
  const ProfileImageChooseSectionView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<SignUpBloc, File>(
      selector: (context, bloc) => bloc.chosenImageFile,
      builder: (context, chosenImageFile, child) => Center(
        child: (chosenImageFile == null)
            ? GestureDetector(
                onTap: () async {
                  final ImagePicker _picker = ImagePicker();

                  /// Pick and image
                  final PickedFile image =
                      await _picker.getImage(source: ImageSource.gallery);
                  if (image != null) {
                    var bloc = Provider.of<SignUpBloc>(context, listen: false);
                    bloc.onImageChosen(File(image.path));
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                  width: 80,
                  height: 80,
                  color: SECONDARY_COLOR,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: MARGIN_XLARGE,
                  ),
                ),
              )
            : Container(
                width: 80,
                height: 80,
                color: Colors.blue,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.file(
                        chosenImageFile ?? File(""),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          var bloc = Provider.of<SignUpBloc>(context, listen: false);
                          bloc.onTapDeleteImage();
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
