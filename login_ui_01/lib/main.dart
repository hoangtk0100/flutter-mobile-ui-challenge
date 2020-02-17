import 'package:login_ui/conf/appstore/app_store.dart';

void main() {
  runApp(
    // DevicePreview(
    //   builder: (context) => MyApp(),
    // ),
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (_) => LoginBloc(),
        child: LoginWidget(),
      ),
    );
  }
}
