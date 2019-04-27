import 'package:ageru/components/gradient-button.dart';
import 'package:ageru/components/navigator-hub.dart';
import 'package:ageru/models/user.dart';
import 'package:ageru/screens/signup_step_1.dart';
import 'package:ageru/theme.dart';
import 'package:ageru/ui/form_field_decoration.dart';
import 'package:ageru/ui/signup_layout.dart';
import 'package:ageru/validators/email-validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class SigninScreen extends StatefulWidget {

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User user;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent()
    );
  }

  Widget _header(){
    return Text("Welcome Back!",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 26,
        fontFamily: 'Avenir-medium'
      )
    );
  }

  Widget _signInForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
//            style: TextStyle(a),
            controller: _emailController,
            validator: (value) {
              if (value.isEmpty) {
                return 'Email can\'t be blank!';
              }
              if (!EmailValidator.regex.hasMatch(value)) {
                return 'Enter valid email!';
              }
            },
            keyboardType: TextInputType.emailAddress,
            decoration: FormFieldDecoration(
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset('assets/icons/email.png', width: 15),
              ),
              "Email"
            ).build()
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            validator: (value) {
              if (value.isEmpty) {
                return 'Password can\'t be blank!';
              }
            },
            keyboardType: TextInputType.text,
            decoration: FormFieldDecoration(
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset('assets/icons/lock.png', width: 15),
              ),
              "Password"
            ).build()
          ),
          SizedBox(height: 30),
          GradientButton(
            height: 50.0,
            onPressed: _signInUser,
            child: Text(
              'SIGN IN',
              style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Avenir-medium'),
            ),
            gradient: LinearGradient(
              colors: <Color>[AppThemeProvider.teal, AppThemeProvider.lime,],
            ),
          )
        ]
      )
    );
  }



  _footerText(){
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(fontSize: 13),
        children: [
          TextSpan(
            text: 'Don\'t have an account? ',
            style: TextStyle(color: AppThemeProvider.darkTeal),
          ),
          TextSpan(
            text: 'Sign up',
            style: TextStyle(color: AppThemeProvider.teal),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                  SignupStep1Screen()
                ));
              }
          )
        ]
      ),
    );
  }

  _buildContent() {
    return SignUpLayout(
      content: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 100),
            _header(),
            SizedBox(height: 60),
            _signInForm(),
            SizedBox(height: 20),
            _footerText(),
          ],
        ),
      )
    );
  }

  _signInUser() async {
    if (_formKey.currentState.validate()) {
      try {
        final FirebaseUser firebaseUser = await _auth.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        if (firebaseUser != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
            NavigatorHub()
          ));
        } else {
          print("=================no user!!");
        }
      } on PlatformException catch(e) {
        Fluttertoast.showToast(msg: e.code, toastLength: Toast.LENGTH_LONG);
      }
    }
  }
}
