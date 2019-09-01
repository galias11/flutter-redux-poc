// @Vendors
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

// @Theme
import 'package:workshop_twitter/theme/default/index.dart';

// @Screens
import 'package:workshop_twitter/screens/HomeScreen.dart';
import 'package:workshop_twitter/screens/SearchScreen.dart';

// @Components
import 'package:workshop_twitter/components/mainTabBar/MainTabBar.dart';

// @Reducers
import 'package:workshop_twitter/reducers/index.dart';

// @i18n
import 'package:workshop_twitter/config/lang/i18n.dart';

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
          primaryColor: ColorTheme.backgroundPrimary
        ),
        home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: mainAppBar(
            title: getTranslation('homeScreen', 'appBarTitle')
          ),
          body: TabBarView(
            children: [
              HomeScreen(),
              SearchScreen(),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
      )
    );
  }
}