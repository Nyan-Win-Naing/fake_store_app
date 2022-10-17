import 'package:fake_store_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class ProductDetailTitle extends StatelessWidget {

  String title;


  ProductDetailTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 0.7),
        fontSize: TEXT_REGULAR_3X,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
