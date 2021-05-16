import 'package:circle_bottom_navigation/circle_bottom_navigation.dart';
import 'package:circle_bottom_navigation/widgets/tab_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:journey_app/Screens/Favourites.dart';
import 'package:journey_app/Screens/Home.dart';
import 'package:journey_app/Screens/Search.dart';
import 'package:journey_app/Screens/Settings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _app = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: FutureBuilder(
        future: _app,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('You have an error! ${snapshot.error.toString()}');
            return Text('Something went wrong');
          } else if (snapshot.hasData) {
            return MyHomePage(title: 'Journey App');
          } else {
            return Center(
              child: new CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;
  final List<Widget> _pages = [
    Home(),
    Favourites(),
    Search(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _pages[currentPage],
      bottomNavigationBar: CircleBottomNavigation(
        barHeight: 60,
        circleSize: 45,
        initialSelection: currentPage,
        inactiveIconColor: Colors.grey,
        textColor: Colors.black,
        hasElevationShadows: false,
        tabs: [
          TabData(
            icon: Icons.home,
            iconSize: 25,
            title: 'Home',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          TabData(
            icon: Icons.favorite,
            iconSize: 25,
            title: 'Favourites',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          TabData(
            icon: Icons.search,
            iconSize: 25,
            title: 'Search',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          TabData(
            icon: Icons.settings,
            iconSize: 25,
            title: 'Settings',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ],
        onTabChangedListener: (index) => setState(() => currentPage = index),
      ),
    );
  }
}
