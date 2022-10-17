import 'package:fake_store_app/resources/colors.dart';
import 'package:fake_store_app/resources/dimens.dart';
import 'package:fake_store_app/widgets/gradient_view.dart';
import 'package:flutter/material.dart';

class BannerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: BannerImageView(),
        ),
        Positioned.fill(
          child: GradientView(),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: ProductNameAndCategoryView(),
        ),
      ],
    );
  }
}

class ProductNameAndCategoryView extends StatelessWidget {
  const ProductNameAndCategoryView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: MARGIN_MEDIUM_2, bottom: MARGIN_MEDIUM_2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Nike Shoes F1",
            style: TextStyle(
              color: Colors.black54,
              fontSize: TEXT_REGULAR_3X,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: MARGIN_SMALL),
          Text(
            "Shoes / 300 USD",
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class BannerImageView extends StatelessWidget {
  const BannerImageView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://cdn11.bigcommerce.com/s-mhohx7q5do/images/stencil/original/carousel/68/s21_livorno_pace_grey_0163__94889.jpeg?c=1",
      fit: BoxFit.cover,
    );
  }
}
