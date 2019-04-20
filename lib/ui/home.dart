import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:football_app/ui/tab_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "football app",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontStyle: FontStyle.italic),
            ),
            backgroundColor: Colors.red,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "standing",
                ),
                Tab(
                  text: "scorers",
                )
              ],
            ),
          ),
          body: MyTabBarView(),
        ),
      ),
    );
  }
}
