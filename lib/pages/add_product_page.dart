import 'dart:io';

import 'package:fake_store_app/blocs/add_product_bloc.dart';
import 'package:fake_store_app/resources/colors.dart';
import 'package:fake_store_app/resources/dimens.dart';
import 'package:fake_store_app/viewitems/add_product_image_view.dart';
import 'package:fake_store_app/widgets/add_category_button_view.dart';
import 'package:fake_store_app/widgets/form_style_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddProductBloc(),
      child: Scaffold(
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
                ChosenProductImageSectionView(),
                SizedBox(height: MARGIN_XLARGE),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChosenProductImageSectionView extends StatelessWidget {
  const ChosenProductImageSectionView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<AddProductBloc, List<File>>(
      selector: (context, bloc) => bloc.chosenImageFileList ?? [],
      shouldRebuild: (previous, next) => previous != next,
      builder: (context, chosenImageFileList, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
            child: ChooseImageTitleView(
              onTap: () async {
                final ImagePicker _picker = ImagePicker();
                // Pick an image
                final PickedFile image =
                    await _picker.getImage(source: ImageSource.gallery);
                if (image != null) {
                  var bloc =
                      Provider.of<AddProductBloc>(context, listen: false);
                  bloc.onImageChosen(File(image.path));
                }
              },
            ),
          ),
          SizedBox(height: MARGIN_MEDIUM_2),
          GridView.builder(
            itemCount: chosenImageFileList.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 150 / 150,
            ),
            itemBuilder: (context, index) {
              var bloc = Provider.of<AddProductBloc>(context, listen: false);
              return AddProductImageView(
                imageFile: chosenImageFileList[index],
                onTapDelete: (imageFile) {
                  bloc.onTapDeleteImage(imageFile);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class ChooseImageTitleView extends StatelessWidget {
  Function onTap;

  ChooseImageTitleView({@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Choose Product Images",
          style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0.7),
            fontWeight: FontWeight.w600,
          ),
        ),
        GestureDetector(
          onTap: () {
            this.onTap();
          },
          child: Icon(
            Icons.add,
            color: PRIMARY_LIGHT_COLOR,
          ),
        ),
      ],
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
