import 'package:fake_store_app/resources/dimens.dart';
import 'package:fake_store_app/viewitems/category_chip_view.dart';
import 'package:fake_store_app/viewitems/product_view_for_see_all_page.dart';
import 'package:flutter/material.dart';

class SeeAllProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          "All Products",
          style: TextStyle(
            color: Colors.black,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CategoryChipListSectionView(),
              SizedBox(height: MARGIN_MEDIUM_2),
              Product2XGridSectionView(),
            ],
          ),
        ),
      ),
    );
  }
}

class Product2XGridSectionView extends StatelessWidget {
  const Product2XGridSectionView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 150 / 220,
      ),
      itemBuilder: (context, index) {
        return ProductViewForSeeAllPage();
      },
    );
  }
}

class CategoryChipListSectionView extends StatelessWidget {
  const CategoryChipListSectionView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      // color: Colors.orange,
      child: ListView(
        padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
        scrollDirection: Axis.horizontal,
        children: [
          UnselectAllCategoryButtonView(),
          CategoryChipView(),
          CategoryChipView(),
          CategoryChipView(),
          CategoryChipView(),
          CategoryChipView(),
          CategoryChipView(),
        ],
      ),
    );
  }
}

class UnselectAllCategoryButtonView extends StatelessWidget {
  const UnselectAllCategoryButtonView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      margin: EdgeInsets.only(right: MARGIN_MEDIUM),
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 0.2),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.close,
        size: MARGIN_MEDIUM_3,
        color: Color.fromRGBO(0, 0, 0, 0.6),
      ),
    );
  }
}
