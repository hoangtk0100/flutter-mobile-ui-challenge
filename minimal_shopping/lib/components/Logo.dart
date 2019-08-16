import '../store/appstore.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(top: 30, bottom: 25),
        child: Image.asset('logo.png', width: 62, height: 42),
      ),
    );
  }
}
