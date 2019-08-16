import '../store/appstore.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _currentIndex = 0;

  List<Widget> bottomNavIconList = [
    Image.asset('store.png', width: 35.0, height: 35.0),
    Icon(CustomIcons.search, size: 32.0),
    Icon(CustomIcons.favorite, size: 32.0),
    Icon(CustomIcons.cart, size: 32.0),
    Image.asset('profile.png', width: 35.0, height: 35.0)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black12.withOpacity(0.065),
            offset: Offset(0.0, -3.0),
            blurRadius: 10.0)
      ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: bottomNavIconList.map((item) {
          var index = bottomNavIconList.indexOf(item);

          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                child: bottomNavItem(item, index == _currentIndex)),
          );
        }).toList(),
      ),
    );
  }
}

bottomNavItem(Widget item, bool isSelected) => Container(
      decoration: BoxDecoration(
          boxShadow: isSelected
              ? [
                  BoxShadow(
                      color: Colors.black12.withOpacity(.2),
                      offset: Offset(0.0, 5.0),
                      blurRadius: 25.0)
                ]
              : []),
      child: item,
    );
