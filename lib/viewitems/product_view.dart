import 'package:fake_store_app/pages/product_detail_page.dart';
import 'package:fake_store_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: MARGIN_MEDIUM),
        // color: Colors.orange,
        width: 150,
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
      ),
    );
  }
}
