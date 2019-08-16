import 'package:restaurant/store/appstore.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      child: ClipPolygon(
          sides: 6,
          child: Container(
            color: iconYellow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(FontAwesomeIcons.book),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  'Menu',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                )
              ],
            ),
          )),
    );
  }
}
