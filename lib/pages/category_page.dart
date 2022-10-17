import 'package:fake_store_app/resources/colors.dart';
import 'package:fake_store_app/resources/dimens.dart';
import 'package:fake_store_app/viewitems/category_view.dart';
import 'package:fake_store_app/widgets/form_style_view.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 200,
        leading: Padding(
          padding: const EdgeInsets.only(
              top: MARGIN_MEDIUM_2, left: MARGIN_MEDIUM_2),
          child: Text(
            "Category",
            style: TextStyle(
              color: Colors.black,
              fontSize: TEXT_HEADING_1X,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GridView.builder(
                    padding: EdgeInsets.only(
                        left: MARGIN_MEDIUM_2, top: MARGIN_MEDIUM_2),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 1),
                    itemBuilder: (context, index) {
                      return CategoryView();
                    },
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                showAddCategoryDialog(context);
              },
              child: AddNewCategoryButtonSectionView(),
            ),
          ),
        ],
      ),
    );
  }

  void showAddCategoryDialog(BuildContext context) {
    /// set up the AlertDialog
    AlertDialog alert = AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: MediaQuery.of(context).size.width * 2.7 / 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                child: Text(
                  "Add Category",
                  style: TextStyle(
                    fontSize: TEXT_REGULAR_3X,
                    fontWeight: FontWeight.bold,
                    color: SECONDARY_COLOR,
                  ),
                ),
              ),
              SizedBox(height: MARGIN_MEDIUM_3),
              FormStyleView(
                label: "Category Name",
                hintText: "Enter category name",
              ),
              SizedBox(height: MARGIN_MEDIUM_3),
              CategoryImageChooseView(),
              SizedBox(height: MARGIN_MEDIUM_3),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                child: Row(
                  children: [
                    AddCategoryButtonView(
                      label: "Cancel",
                      backgroundColor: Colors.grey,
                      textColor: Colors.white,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: MARGIN_MEDIUM),
                    AddCategoryButtonView(
                      label: "Add New",
                      backgroundColor: SECONDARY_COLOR,
                      textColor: Colors.white,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    /// show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class AddCategoryButtonView extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final Function onTap;

  AddCategoryButtonView({
    this.label,
    this.backgroundColor,
    this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: RaisedButton(
        onPressed: () {
          this.onTap();
        },
        color: backgroundColor,
        elevation: 0,
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class CategoryImageChooseView extends StatelessWidget {
  const CategoryImageChooseView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: Text(
            "Image Attachment",
            style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.7),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          width: 90,
          height: 90,
          color: SECONDARY_COLOR,
          child: Icon(
            Icons.image,
            size: MARGIN_XLARGE,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class AddNewCategoryButtonSectionView extends StatelessWidget {
  const AddNewCategoryButtonSectionView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM_2),
      padding: EdgeInsets.symmetric(
          horizontal: MARGIN_MEDIUM_2, vertical: MARGIN_MEDIUM_2),
      decoration: BoxDecoration(
        color: PRIMARY_COLOR,
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.2),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.create_outlined,
            color: Colors.white,
          ),
          SizedBox(width: MARGIN_MEDIUM),
          Text(
            "Add New",
            style: TextStyle(
              fontSize: TEXT_REGULAR_2X,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
