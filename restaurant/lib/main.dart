import 'store/appstore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Mobile',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MyFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(),
      body: Container(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 16.0),
            MyAppBar(),
            SizedBox(height: 16.0),
            FoodListView(),
            SizedBox(height: 9.0),
            Categories(),
            SizedBox(height: 16.0),
            MenuItemsList()
          ],
        ),
      ),
    );
  }
}
