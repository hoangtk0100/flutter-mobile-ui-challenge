import 'package:login_ui/conf/appstore/app_store.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String message = '';
  bool isClicked = false;
  bool showPassword = false;
  String email = 'demo@mcom.app';
  bool isRecentAccount = true;

  @override
  void initState() {
    super.initState();

    emailController.addListener(() {
      LoginBloc.of(context).emailSink.add(emailController.text);
    });

    passwordController.addListener(() {
      LoginBloc.of(context).passwordSink.add(passwordController.text);
    });

    emailController.text = email;
  }

  @override
  Widget build(BuildContext context) {
    var loginBloc = LoginBloc.of(context);
    ResponsiveSize size = ResponsiveSize(context);

    onToggleShowPassword() {
      setState(() {
        showPassword = !showPassword;
      });
    }

    navigateToWidget(widget) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
      );
    }

    Widget buildNewAcountInput() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Sign in to continute',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: size.setByHeight(30.0),
            ),
          ),
          SizedBox(
            height: size.setByHeight(45.0),
          ),
          StreamBuilder<String>(
            stream: loginBloc.emailStream,
            builder: (context, snapshot) {
              return TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'EMAIL',
                  hintText: 'Enter your email',
                  errorText: snapshot.data,
                ),
              );
            },
          ),
          SizedBox(
            height: size.setByHeight(20.0),
          ),
          Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: <Widget>[
              StreamBuilder(
                stream: loginBloc.passwordStream,
                builder: (context, snapshot) {
                  return TextField(
                    controller: passwordController,
                    obscureText: showPassword,
                    decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      hintText: 'Enter your password',
                      errorText: snapshot.data,
                    ),
                  );
                },
              ),
              GestureDetector(
                onTap: onToggleShowPassword,
                child: Text(
                  showPassword ? 'SHOW' : 'HIDE',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: size.setByHeight(14.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }

    Widget buildRecentAcountInput() {
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Welcome back',
                    style: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                      fontSize: size.setByHeight(20.0),
                    ),
                  ),
                  Text(
                    'Hoang Tran',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: size.setByHeight(30.0),
                    ),
                  ),
                  SizedBox(
                    height: size.setByHeight(20.0),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        email = '';
                        emailController.text = '';
                        isRecentAccount = false;
                      });
                    },
                    child: Text(
                      'Oh no, This is not me',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: size.setByHeight(14.0),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: size.setByWidth(70.0),
                width: size.setByWidth(70.0),
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      Assets.avatar,
                    ),
                  ),
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.2,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.setByHeight(45.0),
          ),
          Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: <Widget>[
              StreamBuilder(
                stream: loginBloc.passwordStream,
                builder: (context, snapshot) {
                  return TextField(
                    controller: passwordController,
                    obscureText: showPassword,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: size.setByHeight(18.0),
                    ),
                    decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      hintText: 'Enter your password',
                      errorText: snapshot.data,
                      labelStyle: TextStyle(
                        color: CustomColors.grey,
                        fontSize: size.setByHeight(15.0),
                      ),
                    ),
                  );
                },
              ),
              GestureDetector(
                onTap: onToggleShowPassword,
                child: Text(
                  showPassword ? 'SHOW' : 'HIDE',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: size.setByHeight(14.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }

    Widget buildSignInButton() {
      return SizedBox(
        height: size.setByHeight(56.0),
        width: double.infinity,
        child: StreamBuilder(
            stream: loginBloc.btnLoginStream,
            builder: (context, snapshot) {
              return RaisedButton(
                onPressed: snapshot.data == true
                    ? () {
                        if (!isRecentAccount) {
                          if (emailController.text != 'demo@mcom.app' ||
                              passwordController.text != '12345678') {
                            setState(() {
                              isClicked = true;
                              message = failedLoginMessage;
                            });
                          } else {
                            navigateToWidget(HomeWidget());
                          }
                        } else {
                          if (email != 'demo@mcom.app' ||
                              passwordController.text != '12345678') {
                            setState(() {
                              isClicked = true;
                              message = failedLoginMessage;
                            });
                          } else {
                            navigateToWidget(HomeWidget());
                          }
                        }
                      }
                    : null,
                textColor: Colors.white,
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Text(
                  'SIGN IN',
                  style: TextStyle(
                    fontSize: size.setByHeight(20.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }),
      );
    }

    Widget buildBottomItems() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'NEW USER? ',
                style: TextStyle(
                  fontSize: size.setByWidth(16.0),
                  color: CustomColors.grey,
                ),
              ),
              InkWell(
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                    fontSize: size.setByWidth(16.0),
                    color: Colors.blue,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
          InkWell(
            child: Text(
              'FORGOT PASSWORD',
              style: TextStyle(
                fontSize: size.setByWidth(16.0),
                color: Colors.blue,
              ),
            ),
            onTap: () {},
          )
        ],
      );
    }

    Widget buildBody() {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            isRecentAccount ? buildRecentAcountInput() : buildNewAcountInput(),
            SizedBox(
              height: size.setByHeight(20.0),
            ),
            SizedBox(
              height: size.setByHeight(30.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  isClicked ? message : '',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: size.setByHeight(12.0),
                  ),
                ),
              ),
            ),
            buildSignInButton(),
            SizedBox(
              height: size.height * 0.1,
            ),
            buildBottomItems(),
          ],
        ),
      );
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          right: size.setByWidth(30.0),
          left: size.setByWidth(30.0),
          top: size.setByHeight(50.0),
        ),
        constraints: BoxConstraints.expand(),
        child: Align(
          alignment: Alignment.topCenter,
          child: buildBody(),
        ),
      ),
    );
  }
}
