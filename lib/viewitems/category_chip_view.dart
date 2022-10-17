import 'package:fake_store_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class CategoryChipView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: MARGIN_MEDIUM),
      child: Chip(
        label: Text(
          "Furniture",
          style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0.6),
          ),
        ),
        backgroundColor: null,
      ),
    );
  }
}
