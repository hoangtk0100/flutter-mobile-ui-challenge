import 'package:restaurant/store/appstore.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(burgerImage), fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 16.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: iconYellow,
                    borderRadius: BorderRadius.circular(4.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        size: 15.0,
                      ),
                      Text('4.5')
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'Special Chicken Burger',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Container(
                width: 208.0,
                child: Text(
                  'Chicken, Yogurt, Red chilli, Ginger paste, .......................',
                  style: TextStyle(color: Colors.grey[600]),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
