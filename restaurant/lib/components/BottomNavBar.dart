import 'package:restaurant/store/appstore.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Container(
            height: 60.0,
            padding: EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Icon(Icons.home),
                    Text('Home', style: TextStyle(fontSize: 12.0))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(Icons.search, color: Colors.black45),
                    Text('Search', style: TextStyle(fontSize: 12.0))
                  ],
                ),
                Container(
                  width: 100.0,
                ),
                Column(
                  children: <Widget>[
                    Icon(Icons.shop, color: Colors.black45),
                    Text('Wishlist', style: TextStyle(fontSize: 12.0))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(Icons.shopping_cart, color: Colors.black45),
                    Text('Cart', style: TextStyle(fontSize: 12.0))
                  ],
                ),
              ],
            )));
  }
}
