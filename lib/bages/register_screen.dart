import 'package:delivery_app/controller/auth_provider.dart';
import 'package:delivery_app/controller/auth_result_state.dart';
import 'package:delivery_app/controller/firebase_auth_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';
import 'more_info_screen.dart';

class Field {
  String fName;
  bool fErrorState;
  String fHint;
  String fType;
  TextEditingController fController = TextEditingController();

  Field(this.fName, this.fErrorState, this.fHint, this.fType);
}

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  List<String> errorFailds = [];
  List<TextEditingController> textEditingControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  List<Field> listOfFields = [
    Field("name", false, "Your Name", "text"),
    Field("email", false, "Your Email", "text"),
    Field("password", false, "password", "password"),
    Field("confPassword", false, "Confirm password", "password")
  ];

  bool submit = false;
  bool displayErrorMassage = false;
  AuthenticationProvider authProvider;
  String inCorrectMassage = "";
  bool showIndicator = false;

  @override
  Widget build(BuildContext context) {
    authProvider = Provider.of<AuthenticationProvider>(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: WrapWithIndicator(
        indecatorState: showIndicator,
        child: registerForm2(context),
      ),
    );
  }

  bool isThereError(Field f) {
    return (f.fErrorState || f.fController.text.isEmpty && submit);
  }

  /// widgets /////////
  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text(
        "SIGN UP",
        style: TextStyle(color: MyColors.loginPrimaryColor),
      ),
      backgroundColor: MyColors.backGroundColor,
    );
  }

  Container registerForm2(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: ListView(
        shrinkWrap: true,
        children: [
          inCorrectFieldMassage(),
          ...List.generate(listOfFields.length, (index) {
            Field field = listOfFields[index];
            return (field.fType == "text")
                ? RoundedInputField(
                    controller: field.fController,
                    error: isThereError(field),
                    hintText: field.fHint,
                    onChanged: (value) {
                      setState(() {});
                    },
                  )
                : RoundedPasswordField(
                    controller: field.fController,
                    error: isThereError(field),
                    onChanged: (value) {
                      setState(() {});
                    },
                    hint: field.fHint,
                  );
          }),
          RoundedButton(
            text: "SIGN UP",
            press: () {
              submit = true;
              setState(() {
                showIndicator = true;
              });
              _signUp2();
            },
          ),
          SizedBox(height: MySize.height(context) * 0.03),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Container inCorrectFieldMassage() {
    return (displayErrorMassage)
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
                Container(
                  width: MySize.width(context) * .75,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(inCorrectMassage),
                  ),
                ),
                InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      setState(() {
                        displayErrorMassage = false;
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

  /// functions /////
  isEmpty(String field) {
    if (field.isEmpty && submit) {
      return true;
    }
    return false;
  }

  _signUp() {
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String confPassword = confPasswordController.text;
    if (name.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        confPassword.isNotEmpty) {
      if (password != confPassword) {
        errorFailds.add("value");
        showIndicator = false;
        setState(() {
          displayErrorMassage = true;
          inCorrectMassage = "password and confirm password mismatch";
        });
      } else {
        authProvider.signUp(email, password).then((value) {
          if (value == AuthResultStatus.successful) {
            Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
          } else {
            showIndicator = false;
            setState(() {
              displayErrorMassage = true;
              inCorrectMassage =
                  MyAuthException.generateExceptionMessage(value);
            });
          }
        });
      }
    } else {
      showIndicator = false;
    }
  }

  _signUp2() {
    for (Field i in listOfFields) {
      if (i.fController.text.isEmpty) {
        showIndicator = false;
        return;
      }
    }

    if (listOfFields[2].fController.text != listOfFields[3].fController.text) {
      errorFailds.add("value");
      showIndicator = false;
      setState(() {
        displayErrorMassage = true;
        inCorrectMassage = "password and confirm password mismatch";
      });
    } else {
      authProvider
          .signUp(listOfFields[1].fController.text,
              listOfFields[2].fController.text)
          .then((value) {
        if (value == AuthResultStatus.successful) {
          Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
        } else {
          showIndicator = false;
          setState(() {
            displayErrorMassage = true;
            inCorrectMassage = MyAuthException.generateExceptionMessage(value);
          });
        }
      });
    }
  }
}
