import 'package:restaurant/store/appstore.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.0),
      child: Container(
        height: 160.0,
        width: 300.0,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(meatImage), fit: BoxFit.cover)),
        child: Stack(
          children: <Widget>[
            Container(
              height: 160.0,
              width: 300.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black.withOpacity(0.1), Colors.black],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(),
                  Text(
                    '25% OFF',
                    style: TextStyle(
                        color: textYellow,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                        letterSpacing: 1.2),
                  ),
                  Text(
                    'ON FITST 3 ORDERS',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        letterSpacing: 1.2),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}