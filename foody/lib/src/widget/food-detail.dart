import 'package:foody/conf/store.dart';

class FoodDetail extends StatefulWidget {
  final heroTag, name, price;

  FoodDetail({this.heroTag, this.name, this.price});

  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  var selectedCard = 'WEIGHT';
  var selectedButton = Icons.add;
  int quantities = 1;

  @override
  Widget build(BuildContext context) {
    double widgetHeight = MediaQuery.of(context).size.height;
    double widgetWidth = MediaQuery.of(context).size.width;
    double imageFoodSize = widgetHeight / 6.8;
    double topContainer = widgetHeight / 12;
    double modifyButtonSize = widgetWidth / 16.5;
    Color mainColor = Color(0xFF7FA1FA);

    Widget _infoCard(String title, String info, String unit) {
      return Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: InkWell(
          onTap: () {
            selectCard(title);
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            height: widgetHeight / 9,
            width: widgetWidth / 4,
            padding: EdgeInsets.only(left: 16.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: selectedCard == title ? mainColor : Colors.white,
                border: Border.all(
                    style: BorderStyle.solid,
                    width: 0.75,
                    color: selectedCard == title
                        ? Colors.transparent
                        : Colors.grey.withOpacity(0.3))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 14.0,
                        color: selectedCard == title
                            ? Colors.white
                            : Colors.grey.withOpacity(0.8),
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: (widgetHeight / 9) / 1.28),
                  child: Text(
                    info,
                    style: TextStyle(
                        fontSize: 17.0,
                        color:
                            selectedCard == title ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    unit,
                    style: TextStyle(
                        fontSize: 12.0,
                        color:
                            selectedCard == title ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w100),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget _quantityButton(IconData iconData) {
      List<List<Color>> selectedButtonColors = [
        [mainColor, Colors.white],
        [Colors.white, mainColor]
      ];

      return InkWell(
        onTap: () {
          selectQuantityButton(iconData);
          if (iconData == Icons.add) {
            setState(() {
              quantities++;
            });
          } else {
            if (quantities != 0) {
              setState(() {
                quantities--;
              });
            }
          }
        },
        child: Container(
          height: modifyButtonSize,
          width: modifyButtonSize,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: selectedButton == iconData
                  ? selectedButtonColors[1][0]
                  : selectedButtonColors[0][0]),
          child: Center(
            child: Icon(
              iconData,
              size: 16.0,
              color: selectedButton == iconData
                  ? selectedButtonColors[1][1]
                  : selectedButtonColors[0][1],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: _appBar(context),
      backgroundColor: mainColor,
      body: Container(
        color: Colors.transparent,
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: topContainer,
              child: Container(
                height: widgetHeight - topContainer,
                width: widgetWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(60.0, 60.0),
                      topRight: Radius.elliptical(60.0, 60.0)),
                ),
              ),
            ),
            Positioned(
              top: topContainer - 35.0,
              left: (widgetWidth / 2) - (imageFoodSize),
              child: Hero(
                tag: widget.heroTag,
                child: CircleAvatar(
                  minRadius: imageFoodSize,
                  maxRadius: imageFoodSize,
                  backgroundImage: AssetImage(widget.heroTag),
                ),
              ),
            ),
            Positioned(
              top: widgetHeight / 2.8,
              left: 24.0,
              right: 24.0,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontSize: 32.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        'Bowl',
                        style: TextStyle(fontSize: 32.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '\$' + widget.price,
                        style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      Text(
                        '|',
                        style: TextStyle(
                            fontSize: 48.0,
                            fontWeight: FontWeight.w100,
                            color: Colors.grey.withOpacity(0.3)),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 6.0, right: 6.0),
                        width: modifyButtonSize * 3.6,
                        height: modifyButtonSize + 12.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: mainColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _quantityButton(Icons.remove),
                            Container(
                              width: modifyButtonSize,
                              child: Text(
                                quantities.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            _quantityButton(Icons.add)
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 45.0,
                  ),
                  Container(
                    width: widgetWidth,
                    height: widgetHeight / 5.5,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        _infoCard('WEIGHT', '300', 'G'),
                        _infoCard('CALORIES', '267', 'CAL'),
                        _infoCard('VITAMINS', 'A, B6', 'VIT'),
                        _infoCard('AVAIL', 'NO', 'AV'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _bottomBar(context, (quantities * double.tryParse(widget.price))),
          ],
        ),
      ),
    );
  }

  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }

  selectQuantityButton(iconData) {
    setState(() {
      selectedButton = iconData;
    });
  }
}

Widget _appBar(BuildContext context) {
  return AppBar(
    backgroundColor: Color(0xFF7FA1FA),
    elevation: 0.0,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      padding: EdgeInsets.only(left: 30.0),
      icon: Icon(Icons.arrow_back_ios),
    ),
    title: Text(
      'Detail',
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
    ),
    centerTitle: true,
    actions: <Widget>[
      IconButton(
        padding: EdgeInsets.only(right: 30.0),
        icon: Icon(Icons.menu),
        color: Colors.white,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ],
  );
}

Widget _bottomBar(BuildContext context, double total) {
  return Positioned(
    bottom: 24.0,
    left: 24.0,
    right: 24.0,
    child: Container(
      height: MediaQuery.of(context).size.height / 10,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
            bottomLeft: Radius.elliptical(40.0, 40.0),
            bottomRight: Radius.elliptical(40.0, 40.0),
          )),
      child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0, left: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white24,
                    size: 18.0,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white30,
                    size: 18.0,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white54,
                    size: 18.0,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white60,
                    size: 18.0,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 18.0,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width / 2 - 50.0),
                child: Text(
                  '\$' + total.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              )
            ],
          )),
    ),
  );
}
