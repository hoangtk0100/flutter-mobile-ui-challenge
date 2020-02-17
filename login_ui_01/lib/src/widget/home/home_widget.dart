import 'package:flutter/material.dart';
import 'package:login_ui/conf/appstore/app_store.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ResponsiveSize size = ResponsiveSize(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
