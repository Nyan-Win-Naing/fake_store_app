import 'package:fake_store_app/resources/colors.dart';
import 'package:fake_store_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class FormStyleView extends StatelessWidget {
  String label;
  String hintText;
  bool isPasswordField;
  bool isNumberOnlyField;
  bool isDescriptionField;

  FormStyleView({
    this.label,
    this.hintText,
    this.isPasswordField = false,
    this.isNumberOnlyField = false,
    this.isDescriptionField = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.7),
              fontWeight: FontWeight.w600,
            ),
          ),
          TextField(
            obscureText: isPasswordField,
            keyboardType: isNumberOnlyField ? TextInputType.number : null,
            maxLines: isDescriptionField ? 5 : 1,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: SECONDARY_COLOR),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: PRIMARY_COLOR),
                ),
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: TEXT_REGULAR,
                )),
          ),
        ],
      ),
    );
  }
}
