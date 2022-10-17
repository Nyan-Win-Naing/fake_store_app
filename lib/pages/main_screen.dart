import 'package:fake_store_app/pages/category_page.dart';
import 'package:fake_store_app/pages/home_page.dart';
import 'package:fake_store_app/pages/profile_page.dart';
import 'package:fake_store_app/resources/colors.dart';
import 'package:fake_store_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedIndex = 0;

  List<Widget> _pageOptions = [
    HomePage(),
    CategoryPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: PRIMARY_COLOR,
        selectedFontSize: TEXT_13,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: MARGIN_XLARGE,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
              size: MARGIN_XLARGE,
            ),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: MARGIN_XLARGE,
            ),
            label: "Profile",
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _pageOptions.elementAt(_selectedIndex),
    );
  }
}
