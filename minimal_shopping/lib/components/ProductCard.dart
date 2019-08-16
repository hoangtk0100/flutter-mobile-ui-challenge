import '../store/appstore.dart';

class ProductCard extends StatelessWidget {
  final String photoName, name;
  final String price, currentPrice;
  final int color;

  ProductCard(
      {this.photoName, this.name, this.price, this.currentPrice, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 320,
      decoration: BoxDecoration(
          color: Color(this.color),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.withOpacity(.3), width: .2)),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 8.0,
          ),
          Image.asset(
            this.photoName,
            width: 281,
            height: 190,
          ),
          Text(
            this.name,
            style: TextStyle(fontFamily: 'Raleway', fontSize: 22),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(CustomIcons.favorite),
                  onPressed: () {},
                ),
                Column(
                  children: <Widget>[
                    Text(this.price,
                        style: TextStyle(
                            color: Color(0xFFFF4646),
                            fontSize: 16,
                            fontFamily: "Helvetica")),
                    SizedBox(
                      height: 5,
                    ),
                    Text(this.currentPrice,
                        style: TextStyle(fontSize: 28, fontFamily: "Helvetica"))
                  ],
                ),
                IconButton(
                  icon: Icon(CustomIcons.cart),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}