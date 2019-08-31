// @Vendors
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

// @Screens
import 'package:workshop_twitter/screens/HomeScreen.dart';

// @Components
import 'package:workshop_twitter/components/mainTabBar/MainTabBar.dart';

// @Reducers
import 'package:workshop_twitter/reducers/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: tweetsStore,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.lime,
        ),
        home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: mainAppBar,
          body: TabBarView(
            children: [
              HomeScreen(title: 'Multi changos', store: tweetsStore),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
      )
    );
  }
}