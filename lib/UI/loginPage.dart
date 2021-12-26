import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_coba1/Model/errMSG.dart';
import 'package:flutter_coba1/Service/apiStatic.dart';
import 'package:flutter_coba1/UI/home.dart';

const users = const {
  'sas@gmail.com': '12345',
};

class PageLogin extends StatelessWidget {
  static var routeName = "login";
  late ErrorMSG res;
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    return Future.delayed(loginTime).then((_) async {
      var params = {
        'email': data.name,
        'password': data.password,
        'device_name': 'mobile'
      };
      res = await ApiStatic.sigIn(params);
      if (res.success != true) {
        return res.message;
      }
      return '';
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      onLogin: _authUser,
      onSignup: _authUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => homepage(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
