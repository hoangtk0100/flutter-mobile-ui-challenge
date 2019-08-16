import 'package:restaurant/store/appstore.dart';

class MenuItemsList extends StatelessWidget {
  const MenuItemsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Popular Dishes',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Colors.black87),
          ),
          SizedBox(
            height: 10.0,
          ),
          MenuItem(),
          MenuItem(),
          MenuItem(),
          MenuItem(),
          MenuItem(),
          MenuItem(),
        ],
      ),
    );
  }
}