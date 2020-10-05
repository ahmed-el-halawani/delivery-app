import 'package:delivery_app/bages/register_screen.dart';
import 'package:delivery_app/controller/auth_provider.dart';
import 'package:delivery_app/controller/auth_result_state.dart';
import 'package:delivery_app/controller/firebase_auth_exception.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool inCorrectEmail = false;
  AuthenticationProvider auth;
  String errorMassage = "";

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    auth = Provider.of<AuthenticationProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "LOG IN",
              style: TextStyle(color: MyColors.loginPrimaryColor),
            ),
          ],
        ),
        backgroundColor: MyColors.backGroundColor,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              inCorrectMassage(),
              RoundedInputField(
                controller: emailController,
                hintText: "enter your email",
                icon: Icons.email,
              ),
              RoundedPasswordField(
                controller: passwordController,
                hint: "Password",
              ),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  _signIn();
                },
              ),
              RoundedButton(
                text: "test",
                press: () {
                  _test();
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RegisterScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container inCorrectMassage() {
    return (inCorrectEmail)
        ? Container(
            width: MySize.width(context) * .8,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.redAccent.withAlpha(35),
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(width: 1, color: Colors.black87.withAlpha(40))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(errorMassage),
                InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      setState(() {
                        inCorrectEmail = false;
                      });
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.black87,
                    ))
              ],
            ),
          )
        : Container();
  }

  _signIn() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    print(email);
    print(password);
    auth.signIn(email, password).then((value) {
      if (value == AuthResultStatus.successful) {
        Db.db.setUser(User(email: email, uuid: password));
        Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
      } else {
        setState(() {
          inCorrectEmail = true;
          errorMassage = MyAuthException.generateExceptionMessage(value);
        });
      }
    });
  }

  _test() {
    User u = User(
      email: "ag@gmail.com",
      uuid: "123123",
      name: "ahmed gomaa",
      lat: 29.8407818,
      lng: 31.3565201,
      location: "Street 133, Helwan, Cairo Governorate",
    );
    auth.signIn(u.email, u.uuid).then((value) {
      if (value == AuthResultStatus.successful) {
        Db.db.setUser(u);
        Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
      } else {
        setState(() {
          inCorrectEmail = true;
          errorMassage = MyAuthException.generateExceptionMessage(value);
        });
      }
    });
  }

//  =>_login()
}
