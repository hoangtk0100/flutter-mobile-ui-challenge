import 'package:shoes_ecommerce/conf/store/app_store.dart';
import 'package:shoes_ecommerce/conf/utils/utils.dart';
import 'package:shoes_ecommerce/src/model/mock_data.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = ResponsiveSize(context);

    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF595C66),
            Color(0xFF41444D),
            Color(0xFF2C2F37),
          ],
          tileMode: TileMode.clamp,
        )),
        child: Scaffold(
            appBar: customAppBar(context, adidasEnergyCloud.name),
            backgroundColor: Colors.transparent,
            body: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                ProductDetail(),
                Positioned(
                  bottom: 0.0,
                  left: size.setByWidth(size.width / 16),
                  child: _foodter(size),
                ),
              ],
            )));
  }
}

/// Product detail
class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProductTopPart(),
            ProductBottomPart(),
          ],
        ),
      ),
    );
  }
}

/// Product detail top part
class ProductTopPart extends StatefulWidget {
  @override
  _ProductTopPartState createState() => _ProductTopPartState();
}

class _ProductTopPartState extends State<ProductTopPart> {
  @override
  Widget build(BuildContext context) {
    final size = ResponsiveSize(context);

    return Container(
      height: size.setByHeight(size.height / 3.8),
      width: size.width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SizedBox(
            child: Image.asset(
              AssetsShoes.redAdidas,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: size.setByHeight(size.height / 3.8) - size.setByHeight(50),
            left: size.setByWidth(20.0),
            right: size.setByWidth(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _titleField('Rating', size.setByHeight(16.0)),
                SizedBox(
                  height: size.setByHeight(10.0),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.setByWidth(10.0)),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        size: size.setByHeight(24.0),
                        color: Colors.yellowAccent,
                      ),
                      SizedBox(
                        width: size.setByWidth(5.0),
                      ),
                      Text(
                        '4.5',
                        style: TextStyle(
                          color: Colors.yellowAccent,
                          fontSize: size.setByHeight(16.0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: size.setByWidth(10.0),
                      ),
                      Text(
                        '(500 People)',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.setByHeight(12.0),
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Product detail bottom part
class ProductBottomPart extends StatefulWidget {
  @override
  _ProductBottomPartState createState() => _ProductBottomPartState();
}

class _ProductBottomPartState extends State<ProductBottomPart> {
  var selectedSize = '7';
  var selectedQuantityButton = Icons.add;
  var selectedColor = Color(0xFFE64A3C);
  int quantities = 1;
  bool isExpanded = false;
  double widgetWidth = 0;
  double itemSize = 0;

  Widget _productDescription(ResponsiveSize size) {
    return Padding(
      padding: EdgeInsets.only(top: size.setByHeight(20.0), bottom: size.setByHeight(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _titleField('Product Description', size.setByHeight(16.0)),
          SizedBox(
            height: size.setByHeight(10.0),
          ),
          Padding(
            padding: EdgeInsets.only(left: size.setByWidth(10.0)),
            child: AnimatedCrossFade(
              firstChild: Text(
                adidasEnergyCloud.description,
                maxLines: 2,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.setByHeight(14.0),
                ),
              ),
              secondChild: Text(
                adidasEnergyCloud.description,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.setByHeight(14.0),
                ),
              ),
              crossFadeState: isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: kThemeAnimationDuration,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.setByHeight(5.0)),
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  isExpanded ? "less" : "more....",
                  style: TextStyle(
                      color: Color(0xFFFB382F),
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      fontSize: size.setByHeight(14.0),
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sizeItem(String sizeNumber) {
    var isSelected = selectedSize == sizeNumber;

    return Padding(
      padding: EdgeInsets.only(right: 8.0, bottom: 8.0, top: 1.0),
      child: InkWell(
        onTap: () {
          _selectSize(sizeNumber);
        },
        child: AnimatedContainer(
          height: itemSize,
          width: itemSize,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
          decoration: BoxDecoration(
              color: isSelected ? Colors.red : Color(0xFF595C66),
              borderRadius: BorderRadius.circular(4.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  offset: Offset(1.5, 4.0),
                  color: isSelected
                      ? Colors.black.withOpacity(.6)
                      : Colors.transparent,
                ),
              ],
              border: Border.all(
                  style: BorderStyle.solid,
                  width: 0.75,
                  color: Colors.grey.withOpacity(0.1))),
          child: Center(
            child: Text(
              sizeNumber,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _quantityButton(IconData iconData) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectQuantityButton(iconData);
          if (iconData == Icons.add) {
            setState(() {
              ++quantities;
            });
          } else {
            if (quantities != 1) {
              --quantities;
            }
          }
        });
      },
      child: Container(
        height: 40.0,
        width: 20.0,
        child: Icon(
          iconData,
          color: Colors.white,
          size: 16.0,
        ),
      ),
    );
  }

  Widget _colorItem(Color color) {
    var currentSize = selectedColor == color ? itemSize + 2 : itemSize;
    var isSelected = selectedColor == color;

    return Padding(
      padding: EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () {
          _selectColor(color);
        },
        child: AnimatedContainer(
          height: currentSize,
          width: currentSize,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
          decoration: BoxDecoration(
            color: isSelected ? Colors.white38 : Colors.black,
            borderRadius: BorderRadius.circular(3.0),
            border: Border.all(
                style: BorderStyle.solid,
                width: 0.75,
                color: Colors.white.withOpacity(0.2)),
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                offset: Offset(1.5, 4.0),
                color: isSelected
                    ? Colors.black.withOpacity(.6)
                    : Colors.transparent,
              ),
            ],
          ),
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: currentSize * 0.7,
              width: currentSize * 0.7,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(3.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Size item list
  List<Widget> sizeItemList() {
    List<Widget> sizeItemList = new List();
    var sizes = adidasEnergyCloud.sizeNumbers;
    for (var index = 0; index < sizes.length; ++index) {
      sizeItemList.add(_sizeItem(sizes[index]));
    }

    return sizeItemList;
  }

  /// Color item list
  List<Widget> colorItemList() {
    List<Widget> colorItemList = new List();
    var colors = adidasEnergyCloud.colors;
    for (var index = 0; index < colors.length; ++index) {
      colorItemList.add(_colorItem(colors[index]));
    }

    return colorItemList;
  }

  @override
  Widget build(BuildContext context) {
    final size = ResponsiveSize(context);
    itemSize = size.width / 12.5;

    return Container(
      padding: EdgeInsets.only(
          left: size.setByWidth(20.0), right: size.setByWidth(20.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _productDescription(size),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: size.setByHeight(6.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _titleField('Size', size.setByHeight(16.0)),
                    SizedBox(
                      height: size.setByHeight(5.0),
                    ),
                    Container(
                      width: size.width * 0.54,
                      padding: EdgeInsets.only(
                          left: size.setByWidth(10.0)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: sizeItemList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _titleField('Quantity', size.setByHeight(16.0)),
                  SizedBox(
                    height: size.setByHeight(6.0),
                  ),
                  Container(
                    height: itemSize,
                    width: size.width / 4,
                    decoration: BoxDecoration(
                      color: Color(0xFF595C66),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _quantityButton(Icons.remove),
                        Text(
                          '|',
                          style: TextStyle(
                            fontSize: size.setByHeight(16.0),
                            color: Color(0xFF41444D),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: size.setByWidth(8.0),
                              right: size.setByWidth(8.0)),
                          child: Text(
                            quantities.toString(),
                            style: TextStyle(
                              fontSize: size.setByHeight(16.0),
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          '|',
                          style: TextStyle(
                            fontSize: size.setByHeight(16.0),
                            color: Color(0xFF41444D),
                          ),
                        ),
                        _quantityButton(Icons.add),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: size.setByHeight(10.0),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _titleField('Select Color', size.setByHeight(16.0)),
              SizedBox(
                height: size.setByHeight(5.0),
              ),
              Container(
                height: size.setByHeight(50.0),
                padding: EdgeInsets.only(left: size.setByWidth(10.0)),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: colorItemList(),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: size.setByHeight(10.0),
          ),
          _titleField('Price', size.setByHeight(16.0)),
          Padding(
            padding: EdgeInsets.only(
              top: size.setByHeight(8.0),
              left: size.setByWidth(10.0),
            ),
            child: Text(
                '\$' + (adidasEnergyCloud.price * quantities).toString(),
                style: TextStyle(
                    fontSize: size.setByHeight(40.0),
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
          ),
        ],
      ),
    );
  }

  _selectSize(sizeNumber) {
    setState(() {
      selectedSize = sizeNumber;
    });
  }

  _selectQuantityButton(iconData) {
    setState(() {
      selectedQuantityButton = iconData;
    });
  }

  _selectColor(color) {
    setState(() {
      selectedColor = color;
    });
  }
}

/// Clipper for corner triangle in colorItem
class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

/// Content title
Widget _titleField(String title, double size) {
  return Text(
    title,
    style: TextStyle(
      color: Color(0xFF969599),
      fontWeight: FontWeight.bold,
      fontSize: size,
    ),
  );
}

/// Button add to cart
Widget _foodter(ResponsiveSize size) {
  return Container(
    width: size.width,
    height: size.setByWidth(size.width * 0.5),
    child: Stack(
      children: <Widget>[
        Positioned(
          bottom: size.setByWidth(size.width / 8),
          left: 0.0,
          child: SizedBox(
            height: size.setByWidth(size.width / 7.5),
            width: size.setByWidth(size.width),
            child: MaterialButton(
              onPressed: () {},
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding:
                      EdgeInsets.only(right: size.setByWidth(size.width / 3)),
                  child: Text(
                    'Add to cart',
                    style: TextStyle(
                      fontSize: size.setByHeight(18.0),
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: size.setByWidth(-size.width / 12),
          right: size.setByWidth(-size.width / 4),
          child: Container(
            padding: EdgeInsets.only(right: size.setByWidth(20.0), top: size.setByHeight(40.0)),
            width: size.setByWidth(size.width / 1.2),
            height: size.setByWidth(size.height / 2.8),
            child: Image.asset(
              AssetsShoes.adidasCards,
              fit: BoxFit.cover,
              width: size.setByWidth(size.width / 1.2),
              height: size.setByWidth(size.height / 4),
            ),
          ),
        ),
      ],
    ),
  );
}

/// Customize AppBar
Widget customAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    title: Text(
      title,
      style: TextStyle(
        fontSize: ResponsiveSize(context).setByHeight(20.0),
        fontWeight: FontWeight.bold,
        color: Colors.white,
        letterSpacing: 2.5,
      ),
    ),
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        color: Colors.white,
        padding: EdgeInsets.only(left: 10.0),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
    centerTitle: true,
    actions: <Widget>[
      IconButton(
        padding: EdgeInsets.only(right: 15.0),
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.favorite_border,
          color: Colors.white,
        ),
      ),
    ],
  );
}
