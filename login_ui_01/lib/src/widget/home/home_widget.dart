import 'package:flutter/material.dart';
import 'package:login_ui/conf/appstore/app_store.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ResponsiveSize size = ResponsiveSize(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Welcome',
            style: TextStyle(
              color: Colors.grey,
              fontSize: size.setByWidth(42.0),
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'MCOM Solutions',
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: size.setByWidth(50.0),
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      )),
    );
  }
}
