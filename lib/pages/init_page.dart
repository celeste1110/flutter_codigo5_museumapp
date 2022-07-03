import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo5_museumapp/pages/home-page.dart';
import 'package:flutter_codigo5_museumapp/ui/general/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../services/api_service.dart';
import '../ui/widgets/my_app.dart';
import 'explorer_page.dart';
import 'favorite_page.dart';

class InitPage extends StatefulWidget {
  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    HomePage(),
    ExplorerPage(),
    FavoritePage(),
    Text('apage 4'),
  ];

  @override
  Widget build(BuildContext context) {
    // APIService _apiService = APIService();
    // _apiService.getMuseums().then((value){
    //
    // }).catchError((error){
    //
    // });
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 64.0),
          child: MyAppBar()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterFloat,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kBrandPrimaryColor,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int index) {
          _currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              color: _currentIndex == 0 ? Colors.blue : Colors.white,
            ),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/compass.svg',
              color: _currentIndex == 1 ? Colors.blue : Colors.white,
            ),
            label: "Explorar",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/heart.svg',
              color: _currentIndex == 2 ? Colors.blue : Colors.white,
            ),
            label: "Favoritos",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/user.svg',
              color: _currentIndex == 3 ? Colors.blue : Colors.white,
            ),
            label: "Perfil",
          ),
        ],
      ),
    );
  }
}
