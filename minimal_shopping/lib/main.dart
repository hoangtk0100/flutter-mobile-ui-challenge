import 'store/appstore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: Column(
          children: <Widget>[
            Logo(),            
            ProductCard(
                photoName: 'shoes_01.png',
                name: 'Hydrib Rocket WNS',
                price: '999.9',
                currentPrice: '\$777',
                color: 0x6FFAC172),
            SizedBox(
              height: 25.0,
            ),
            ProductCard(
                photoName: 'shoes_02.png',
                name: 'Hydrib Rocket WNS',
                price: '999.9',
                currentPrice: '\$777',
                color: 0x9F89D5C9),
            SizedBox(
              height: 25.0,
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
