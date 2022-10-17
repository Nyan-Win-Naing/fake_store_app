import 'package:fake_store_app/resources/colors.dart';
import 'package:fake_store_app/resources/dimens.dart';
import 'package:fake_store_app/widgets/form_style_view.dart';
import 'package:flutter/material.dart';

class AddPostPage extends StatelessWidget {
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
          "Add Product",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MARGIN_LARGE),
              FormStyleView(
                label: "Product Name",
                hintText: "Enter product name",
              ),
              SizedBox(height: MARGIN_MEDIUM_3),
              FormStyleView(
                label: "Price (Only in USD)",
                hintText: "Enter price",
                isNumberOnlyField: true,
              ),
              SizedBox(height: MARGIN_MEDIUM_3),
              FormStyleView(
                label: "Description",
                hintText: "Enter description",
                isDescriptionField: true,
              ),
              SizedBox(height: MARGIN_XLARGE),
              ChooseCategoryDropDownView(),
              SizedBox(height: MARGIN_MEDIUM_3),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Choose Product Images",
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.7),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(
                      Icons.add,
                      color: PRIMARY_LIGHT_COLOR,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChooseCategoryDropDownView extends StatelessWidget {
  const ChooseCategoryDropDownView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Choose Category",
            style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.7),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: MARGIN_MEDIUM),
          Container(
            child: DropdownButton<String>(
              isExpanded: true,
              value: "Three",
              icon: Icon(
                Icons.arrow_drop_down_outlined,
                size: MARGIN_XLARGE,
                color: PRIMARY_LIGHT_COLOR,
              ),
              underline: Container(
                height: 1,
                color: SECONDARY_COLOR,
              ),
              onChanged: (value) {},
              items: ["One", "Two", "Three", "Four"]
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
