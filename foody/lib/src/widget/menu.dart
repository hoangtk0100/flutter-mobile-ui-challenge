import 'package:foody/conf/store.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    double widgetHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Color(0xFF0BC2BF),
        appBar: _appBar(context),
        body: Stack(
          children: <Widget>[
            Container(
                constraints: BoxConstraints.expand(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 45.0,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 45.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Healthy',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'Food',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 45.0,
                    ),
                    Container(
                      height: widgetHeight * 0.75 - 2.0,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 16.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(85.0),
                          )),
                      child: ListView(
                        primary: false,
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          FoodItem(
                            name: 'Prawn Noodles',
                            price: '14.0',
                            imagePath: 'lib/src/assets/prawn-noodles.jpeg',
                          ),
                          FoodItem(
                            name: 'Noodles',
                            price: '24.0',
                            imagePath: 'lib/src/assets/noodles.jpeg',
                          ),
                          FoodItem(
                            name: 'Chicken Noodles',
                            price: '34.0',
                            imagePath:
                                'lib/src/assets/chicken-rice-noodles.jpg',
                          ),
                          FoodItem(
                            name: 'Ramen',
                            price: '44.0',
                            imagePath: 'lib/src/assets/ramen.jpeg',
                          ),
                          FoodItem(
                            name: 'Beef Steak',
                            price: '34.0',
                            imagePath: 'lib/src/assets/beef-steak.jpg',
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            _bottomBar(),
          ],
        ));
  }
}

class FoodItem extends StatelessWidget {
  final String name, price, imagePath;
  FoodItem({this.name, this.price, this.imagePath});

  @override
  Widget build(BuildContext context) {
    double imageSize = MediaQuery.of(context).size.width / 9;

    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 20.0, top: 30.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FoodDetail(
                      heroTag: imagePath, name: name, price: price)));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Hero(
                      tag: imagePath,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(imagePath),
                        minRadius: imageSize,
                        maxRadius: imageSize,
                      )),
                  SizedBox(
                    width: 25.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '\$$price',
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _appBar(BuildContext context) {
  return AppBar(
    backgroundColor: Color(0xFF0BC2BF),
    elevation: 0.0,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      padding: EdgeInsets.only(left: 30.0),
      icon: Icon(Icons.arrow_back_ios),
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.view_list),
        color: Colors.white,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      SizedBox(width: 20.0),
      IconButton(
        padding: EdgeInsets.only(right: 30.0),
        icon: Icon(Icons.pin_drop),
        color: Colors.white,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FoodDetail(
                        heroTag: 'lib/src/assets/normal.jpeg',
                        name: 'asdfsd',
                        price: 34,
                      )));
        },
      ),
    ],
  );
}

Widget _bottomBar() {
  return Positioned(
    bottom: 0.0,
    left: 0.0,
    right: 0.0,
    child: Container(
      height: 105.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(40.0), right: Radius.circular(40.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          BorderButtonItem(size: 60.0, icon: Icons.search, action: () {}),
          BorderButtonItem(
              size: 60.0, icon: Icons.shopping_basket, action: () {}),
          InkWell(
            onTap: () {},
            child: Container(
              height: 60.0,
              width: 120.0,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey, style: BorderStyle.solid, width: 1.0),
                  borderRadius: BorderRadius.circular(18.0),
                  color: Color(0xFF1C1428)),
              child: Center(
                  child: Text('Checkout',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0))),
            ),
          )
        ],
      ),
    ),
  );
}

class BorderButtonItem extends StatelessWidget {
  final double size;
  final IconData icon;
  final Function action;
  BorderButtonItem({this.size, this.icon, this.action});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        action();
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.grey, style: BorderStyle.solid, width: 1.0),
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Center(
          child: Icon(icon, color: Colors.black),
        ),
      ),
    );
  }
}
