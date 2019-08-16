import 'package:restaurant/store/appstore.dart';

class FoodListView extends StatelessWidget {
  const FoodListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0),
      child: Container(
        height: 160.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[ItemCard(), ItemCard(), ItemCard(), ItemCard()],
        ),
      ),
    );
  }
}