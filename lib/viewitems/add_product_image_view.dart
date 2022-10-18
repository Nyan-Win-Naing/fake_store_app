import 'dart:io';

import 'package:fake_store_app/blocs/add_product_bloc.dart';
import 'package:fake_store_app/resources/dimens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProductImageView extends StatelessWidget {

  File imageFile;
  Function(File) onTapDelete;


  AddProductImageView({@required this.imageFile, @required this.onTapDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MARGIN_MEDIUM_2, bottom: MARGIN_MEDIUM_2),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.file(
              imageFile,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                this.onTapDelete(imageFile);
              },
              child: Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
