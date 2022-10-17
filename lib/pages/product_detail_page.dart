import 'package:fake_store_app/resources/colors.dart';
import 'package:fake_store_app/resources/dimens.dart';
import 'package:fake_store_app/widgets/product_detail_title.dart';
import 'package:fake_store_app/widgets/product_image_view.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: [
            ProductDetailSliverAppBarView(),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: MARGIN_MEDIUM_2),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                    child: ProductInfoSection(),
                  ),
                  SizedBox(height: MARGIN_MEDIUM_3),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                    child: DescriptionSectionView(),
                  ),
                  SizedBox(height: MARGIN_MEDIUM_3),
                  ProductImagesSectionView(),

                  SizedBox(height: MARGIN_MEDIUM_3),
                  ProductImagesSectionView(),

                  SizedBox(height: MARGIN_MEDIUM_3),
                  ProductImagesSectionView(),

                  SizedBox(height: MARGIN_MEDIUM_3),
                  ProductImagesSectionView(),

                  SizedBox(height: MARGIN_MEDIUM_3),
                  ProductImagesSectionView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductImagesSectionView extends StatelessWidget {
  const ProductImagesSectionView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
          child: ProductDetailTitle(title: "Images"),
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        Container(
          height: 110,
          child: ListView.builder(
            padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return ProductImageView();
            },
          ),
        ),
      ],
    );
  }
}

class DescriptionSectionView extends StatelessWidget {
  const DescriptionSectionView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductDetailTitle(title: "Description"),
        SizedBox(height: MARGIN_MEDIUM),
        Text(
          "Tom and Jerry is an American animated media franchise and series of comedy short films created in 1940 by William Hanna and Joseph Barbera. Best known for its 161 theatrical short films by Metro-Goldwyn-Mayer.",
          style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0.6),
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

class ProductInfoSection extends StatelessWidget {
  const ProductInfoSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Nike Air One",
          style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0.7),
            fontSize: TEXT_HEADING_1X,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM),
        Text(
          "USD 2,000",
          style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0.6),
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM_3),
        CategoryView(),
      ],
    );
  }
}

class CategoryView extends StatelessWidget {
  const CategoryView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductDetailTitle(title: "Category"),
        SizedBox(height: MARGIN_MEDIUM),
        Chip(
          backgroundColor: PRIMARY_LIGHT_COLOR,
          label: Text(
            "Shoes",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class ProductDetailSliverAppBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: PRIMARY_LIGHT_COLOR,
      automaticallyImplyLeading: false,
      expandedHeight: 300,
      flexibleSpace: Stack(
        children: [
          FlexibleSpaceBar(
            background: Stack(
              children: [
                Positioned.fill(
                  child: ProductDetailAppBarImageView(),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: BackButtonView(),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: PopUpMenuView(),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 25,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(MARGIN_XLARGE),
                  topRight: Radius.circular(MARGIN_XLARGE),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PopUpMenuView extends StatelessWidget {
  const PopUpMenuView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MARGIN_XLARGE + 3,
        right: MARGIN_MEDIUM_2,
      ),
      child: PopupMenuButton(
        color: Colors.white,
        icon: Icon(
          Icons.more_horiz,
          color: Colors.white,
        ),
        onSelected: (int value) {
          print("Value is $value");
        },
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Text("Edit"),
            value: 1,
          ),
          PopupMenuItem(
            child: Text("Delete"),
            value: 2,
          ),
        ],
      ),
    );
  }
}

class BackButtonView extends StatelessWidget {
  const BackButtonView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: MARGIN_XXLARGE,
        left: MARGIN_MEDIUM_2,
      ),
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
    );
  }
}

class ProductDetailAppBarImageView extends StatelessWidget {
  const ProductDetailAppBarImageView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://cdn.thewirecutter.com/wp-content/media/2021/02/whitesneakers-2048px-4180.jpg?auto=webp&quality=75&width=1024",
      fit: BoxFit.cover,
    );
  }
}
