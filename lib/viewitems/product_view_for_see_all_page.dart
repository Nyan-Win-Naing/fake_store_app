import 'package:fake_store_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class ProductViewForSeeAllPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MARGIN_MEDIUM_2, bottom: MARGIN_MEDIUM_2),
      // color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "https://www.feedough.com/wp-content/uploads/2020/07/PRODUCT-LINE.png",
            height: 190,
            fit: BoxFit.cover,
          ),
          SizedBox(height: MARGIN_MEDIUM),
          Text(
            "Nike Air Shoe",
            style: TextStyle(
              fontSize: TEXT_REGULAR,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: MARGIN_SMALL),
          Text(
            "USD 2000",
            style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.6),
              fontSize: TEXT_13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
