import 'package:login_ui/conf/appstore/app_store.dart';

class LoginBloc extends ChangeNotifier {
  final _emailSubject = BehaviorSubject<String>();
  final _passwordSubject = BehaviorSubject<String>();
  final _btnLoginSubject = BehaviorSubject<bool>();

  final emailValidation =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    sink.add(Validator.isEmail(email) ? null : invalidEmailMessage);
  });

  final passwordValidation = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    sink.add(
        Validator.isPassword(password) ? null : invalidPasswordFormatMessage);
  });

  Stream<String> get emailStream =>
      _emailSubject.stream.transform(emailValidation).skip(1);
  Sink<String> get emailSink => _emailSubject.sink;

  Stream<String> get passwordStream =>
      _passwordSubject.stream.transform(passwordValidation).skip(1);
  Sink<String> get passwordSink => _passwordSubject.sink;

  Stream<bool> get btnLoginStream => _btnLoginSubject.stream;
  Sink<bool> get btnLoginSink => _btnLoginSubject.sink;

  static LoginBloc of(BuildContext context) {
    return Provider.of<LoginBloc>(context, listen: false);
  }

  LoginBloc() {
    CombineLatestStream.combine2(_emailSubject, _passwordSubject,
        (email, password) {
      return Validator.isEmail(email) && Validator.isPassword(password);
    }).listen((enable) {
      btnLoginSink.add(enable);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailSubject.close();
    _passwordSubject.close();
    _btnLoginSubject.close();
  }
}
