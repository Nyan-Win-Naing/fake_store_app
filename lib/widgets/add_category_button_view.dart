import 'package:fake_store_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class AddCategoryButtonView extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final Function onTap;

  AddCategoryButtonView({
    this.label,
    this.backgroundColor,
    this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: RaisedButton(
        onPressed: () {
          this.onTap();
        },
        color: backgroundColor,
        elevation: 0,
        child: Text(
          label,
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