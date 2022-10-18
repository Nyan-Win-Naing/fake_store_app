import 'dart:ui';

import 'package:fake_store_app/dummy/profile_function_vo.dart';
import 'package:fake_store_app/pages/add_product_page.dart';
import 'package:fake_store_app/resources/colors.dart';
import 'package:fake_store_app/resources/dimens.dart';
import 'package:fake_store_app/widgets/form_style_view.dart';
import 'package:flutter/material.dart';

class ProfileFunctionView extends StatelessWidget {

  ProfileFunctionVO profileFunction;


  ProfileFunctionView({@required this.profileFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddProductPage(),
          ),
        );
      },
      child: Container(
        margin:
            EdgeInsets.only(right: MARGIN_MEDIUM_2, bottom: MARGIN_MEDIUM_2),
        padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2),
          color: PRIMARY_LIGHT_COLOR,
          // gradient: LinearGradient(
          //   begin: Alignment.centerLeft,
          //   end: Alignment.centerRight,
          //   colors: [
          //     PRIMARY_COLOR,
          //     PRIMARY_LIGHT_COLOR,
          //   ],
          // ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                profileFunction.icon,
                color: Colors.white,
                size: MARGIN_XLARGE,
              ),
              SizedBox(height: MARGIN_MEDIUM),
              Text(
                profileFunction.label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
