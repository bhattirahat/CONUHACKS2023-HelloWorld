import 'package:conuhacks/Aboutus.dart';
import 'package:conuhacks/Learning.dart';
import 'package:conuhacks/pictureCollection.dart';
import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  List<Widget> tabItems = [
    const HomePage(),
    const AboutUs(),
    const Learning()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("App Name"),
            ),
            body: Center(
              child: tabItems[_selectedIndex],
            ),
            bottomNavigationBar: FlashyTabBar(
              animationCurve: Curves.linear,
              selectedIndex: _selectedIndex,
              showElevation: true,
              onItemSelected: (index) => setState(() {
                _selectedIndex = index;
              }),
              items: [
                FlashyTabBarItem(
                  icon: const Icon(Icons.home),
                  title: const Text('Home'),
                ),
                FlashyTabBarItem(
                  icon: const Icon(Icons.contact_page),
                  title: const Text('About us'),
                ),
                FlashyTabBarItem(
                  icon: const Icon(Icons.school),
                  title: const Text('Learning'),
                ),
              ],
            )));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(
        child: GestureDetector(
          child: Image.asset(
            'asset/picture/person_throwing_trash.jpg',
            width: 300.0,
            height: 300.0,
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Camera(),
            ));
          },
        ),
      )
    ]);
  }
}



