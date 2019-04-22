import 'package:ageru/components/gradient-button.dart';
import 'package:ageru/components/navigator-hub.dart';
import 'package:ageru/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class AuthScreen extends StatefulWidget {

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(30),
        child: _buildContent()
      )
    );
  }

  _headerImage(){
    return Container(
      margin: EdgeInsets.only(bottom: 40),
      child: FractionallySizedBox(
        child: Image.asset('assets/images/logo.png'),
        widthFactor: 0.6
      )
    );
  }

  Widget _facebookAuthSocialButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      height: 50,
      child: ButtonTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: FlatButton(
          color: AppThemeProvider.facebookBlue,
          onPressed: (){},
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             Image.asset('assets/icons/facebook.png',
                width: 18, height: 18),
             Text("Continue with Facebook", style: TextStyle(color: Colors.white)),
            ]
          )
        )
      ),
    );
  }

  Widget _googleAuthSocialButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      height: 50,
      child: ButtonTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: FlatButton(
          color: AppThemeProvider.googleRed,
          onPressed: (){},
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/icons/google.png',
                width: 18, height: 18),
              Text("Continue with Google", style: TextStyle(color: Colors.white)),
            ]
          )
        )
      ),
    );
  }

  Widget _signUpButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: GradientButton(
        height: 50.0,
        onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavigatorHub())),
        child: Text(
          'SIGN UP',
          style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Avenir-roman'),
        ),
        gradient: LinearGradient(
          colors: <Color>[AppThemeProvider.teal, AppThemeProvider.lime,],
        ),
      ),
    );
  }

  Widget _signInButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: OutlineButton(
        padding: EdgeInsets.all(13),
        borderSide: BorderSide(width: 1.5, color: AppThemeProvider.teal),
          child: Text("SIGN IN",
            style: TextStyle(color: AppThemeProvider.teal, fontSize: 14, fontFamily: 'Avenir-roman')
          ),
          onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavigatorHub())),
          shape: RoundedRectangleBorder(
            borderRadius:  BorderRadius.circular(5.0)
          )
      ),
    );
  }

  _footerText(){
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(fontSize: 13),
          children: [
        TextSpan(
          text: 'By Sign up or Login, you are agree to our',
          style: TextStyle(color: AppThemeProvider.darkTeal),
        ),
        TextSpan(
          text: '\n  Terms & Condition',
          style: TextStyle(color: AppThemeProvider.teal),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Fluttertoast.showToast(msg: "No link yet!");
            }
        ),
        TextSpan(
          text: ' and ',
          style: TextStyle(color: AppThemeProvider.darkTeal),
        ),
        TextSpan(
          text: 'Privacy Policy',
          style: TextStyle(color: AppThemeProvider.teal),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Fluttertoast.showToast(msg: "No link yet!");
            }
        ),
      ]),
    );
  }

  _buildContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _headerImage(),
        _facebookAuthSocialButton(),
        _googleAuthSocialButton(),
        _signUpButton(),
        _signInButton(),
        _footerText(),
      ],
    );
  }
}
