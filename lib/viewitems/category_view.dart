import 'package:fake_store_app/resources/colors.dart';
import 'package:fake_store_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MARGIN_MEDIUM_2, bottom: MARGIN_MEDIUM_2),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: CategoryImageView(),
          ),
          Positioned.fill(
            child: OverlayView(),
          ),
          Align(
            alignment: Alignment.center,
            child: CategoryNameView(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: CategoryPopupMenuView(),
          ),
        ],
      ),
    );
  }
}

class CategoryPopupMenuView extends StatelessWidget {
  const CategoryPopupMenuView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
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
    );
  }
}

class CategoryNameView extends StatelessWidget {
  const CategoryNameView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Furniture",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: TEXT_REGULAR_3X,
      ),
    );
  }
}

class OverlayView extends StatelessWidget {
  const OverlayView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 0.5),
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2),
      ),
    );
  }
}

class CategoryImageView extends StatelessWidget {
  const CategoryImageView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2),
      child: Image.network(
        "https://www.feedough.com/wp-content/uploads/2020/07/PRODUCT-LINE.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
