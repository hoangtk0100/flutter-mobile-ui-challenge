import 'package:restaurant/store/appstore.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key key,
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    var categoryHeight = MediaQuery.of(context).size.height/ 100 * 12.0;
    var categoryWidth = MediaQuery.of(context).size.width/ 100 * 30.0;
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
      width: MediaQuery.of(context).size.width - 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: categoryHeight,
            width: categoryWidth,
            color: greenLight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(FontAwesomeIcons.futbol, color: green),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  'Sports store',
                  style: TextStyle(color: green),
                )
              ],
            ),
          ),
          Container(
            height: categoryHeight,
            width: categoryWidth,
            color: redLight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(FontAwesomeIcons.calendarAlt, color: red),
                SizedBox(height: 4.0),
                Text(
                  'Book a table',
                  style: TextStyle(color: red),
                )
              ],
            ),
          ),
          Container(
            height: categoryHeight,
            width: categoryWidth,
            color: blueLight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(FontAwesomeIcons.solidLaugh, color: blue),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  'Caterings',
                  style: TextStyle(color: blue),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
