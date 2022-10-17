import 'package:fake_store_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class ProductImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MARGIN_MEDIUM),
      width: 150,
      child: Image.network(
        "https://static.nike.com/a/images/f_auto,cs_srgb/w_1536,c_limit/lkb5w5osszf4sb3auziu/image.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}
