import 'package:fake_store_app/dummy/dummy_profile_function_list.dart';
import 'package:fake_store_app/resources/colors.dart';
import 'package:fake_store_app/resources/dimens.dart';
import 'package:fake_store_app/viewitems/profile_function_view.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
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
            "Profile",
            style: TextStyle(
              color: Colors.black,
              fontSize: TEXT_HEADING_1X,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: MARGIN_MEDIUM_2),
            child: Icon(
              Icons.logout,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MARGIN_XXLARGE),
              ProfileSectionView(),
              SizedBox(height: MARGIN_XXLARGE),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
                shrinkWrap: true,
                itemCount: profileFunctionList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return ProfileFunctionView(
                    profileFunction: profileFunctionList[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileSectionView extends StatelessWidget {
  const ProfileSectionView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileImageView(),
        SizedBox(height: MARGIN_MEDIUM_2),
        Text(
          "Louis Daniel",
          style: TextStyle(
            color: Color.fromRGBO(244, 143, 177, 1.0),
            fontSize: TEXT_REGULAR_3X,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM),
        Text(
          "louisdaniel@gmail.com",
          style: TextStyle(
            color: Colors.grey,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class ProfileImageView extends StatelessWidget {
  const ProfileImageView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg",
                ),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                  color: Color.fromRGBO(248, 187, 208, 1.0), width: 4)),
        ),
      ],
    );
  }
}
