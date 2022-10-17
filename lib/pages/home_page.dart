import 'package:fake_store_app/pages/see_all_product_page.dart';
import 'package:fake_store_app/resources/colors.dart';
import 'package:fake_store_app/resources/dimens.dart';
import 'package:fake_store_app/viewitems/banner_view.dart';
import 'package:fake_store_app/viewitems/product_view.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(20),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HiSectionView(),
              SizedBox(height: MARGIN_XLARGE),
              BannerSectionView(),
              SizedBox(height: MARGIN_MEDIUM_3),
              ProductListSectionView(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductListSectionView extends StatelessWidget {
  const ProductListSectionView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Products For You",
                style: TextStyle(
                  fontSize: TEXT_REGULAR_2X,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SeeAllProductPage(),
                    ),
                  );
                },
                child: Text(
                  "See All",
                  style: TextStyle(
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w600,
                    color: SECONDARY_COLOR,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        HorizontalProductListView(),
      ],
    );
  }
}

class HorizontalProductListView extends StatelessWidget {
  const HorizontalProductListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return ProductView();
        },
      ),
    );
  }
}

class BannerSectionView extends StatefulWidget {
  const BannerSectionView({
    Key key,
  }) : super(key: key);

  @override
  _BannerSectionViewState createState() => _BannerSectionViewState();
}

class _BannerSectionViewState extends State<BannerSectionView> {
  double _position = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3.5,
          child: PageView(
            onPageChanged: (page) {
              setState(() {
                _position = page.toDouble();
              });
            },
            children: [
              BannerView(),
              BannerView(),
              BannerView(),
              BannerView(),
            ],
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        new DotsIndicator(
          dotsCount: 4,
          position: _position,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            activeColor: SECONDARY_COLOR,
          ),
        )
      ],
    );
  }
}

class HiSectionView extends StatelessWidget {
  const HiSectionView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: Row(
        children: [
          CircleAvatar(
            radius: MediaQuery.of(context).size.height / 25,
            backgroundImage: NetworkImage(
              "https://static-01.shop.com.mm/p/f2a42498bdac1bf323ca988dee5fc8b7.jpg",
            ),
          ),
          SizedBox(width: MARGIN_MEDIUM_2),
          Text(
            "Hi Thomas !",
            style: TextStyle(
              fontSize: TEXT_REGULAR_3X,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
