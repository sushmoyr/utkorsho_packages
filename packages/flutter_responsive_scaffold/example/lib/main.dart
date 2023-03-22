import 'package:flutter/material.dart';
import 'package:flutter_responsive_scaffold/flutter_responsive_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      scaffoldKey: scaffoldKey,
      backgroundColor: Colors.blueGrey.shade100,
      topNavigationBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if (scaffoldKey.currentState?.hasDrawer == true) {
              scaffoldKey.currentState?.openDrawer();
            }
          },
          icon: Icon(Icons.menu),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text("Hello"),
      ),
      primaryNavigation: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 300,
        ),
        child: Container(
          color: Colors.blue,
        ),
      ),
    );
  }
}
