import 'package:flutter/material.dart';
import 'package:rugwell/screens/about_page.dart';
import 'package:rugwell/screens/homecart_page.dart';
import 'package:rugwell/screens/favorits_page.dart';
import 'package:rugwell/screens/intro_page.dart';
import '../widgets/home_bottomnavbar.dart';
import 'homeshop_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // selected index to controle the bottom nav bar
  int _selectedIndex = 0;
  // update selected index
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //pages to display
  final List<Widget> _pages = [
    // shop page
    const HomeShopPage(),
    // Cart page
    const Cart2Page(),
    // favorite page
    const FavoritePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 207, 207, 207),
      bottomNavigationBar: HomeBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 207, 207, 207),
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
            color: Colors.black,
          );
        }),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 240, 239, 239),
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset("assets/images/splash.png"),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Divider(
                color: Color.fromARGB(255, 144, 69, 63),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: ListTile(
                leading: const Icon(
                  Icons.logout,
                  size: 30,
                ),
                title: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (BuildContext context) => IntroPage()),
                    );
                  },
                  child: const Text(
                    'Logout',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: ListTile(
                leading: const Icon(
                  Icons.info,
                  size: 30,
                ),
                title: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (BuildContext context) => const AboutPage()),
                    );
                  },
                  child: const Text(
                    'About',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
