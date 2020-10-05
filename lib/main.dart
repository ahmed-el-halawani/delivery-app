import 'package:delivery_app/routs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';
import 'bages/login_screen.dart';

import 'bages/home.dart';
import 'controller/auth_provider.dart';
import 'controller/auth_result_state.dart';
import 'controller/db_provider.dart';
import 'controller/image_picker.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => AuthenticationProvider.auth,
      ),
      ChangeNotifierProvider(
        create: (_) => ImagePicker2.pic,
      ),
      ChangeNotifierProvider(
        create: (_) => DBProvider.db,
      )
    ],
    child: myApp(),
  ));
}

class myApp extends StatelessWidget {
  @override
  Widget build(context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: MyColors.backGroundColor,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: mTheme(context),
      initialRoute: "/",
      onGenerateRoute: Router.routeGenerator,
    );
  }
}

class SwitchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (c, a) => (a.hasData)
          ? Consumer(
              builder: (context, AuthenticationProvider auth, _) {
                switch (auth.state) {
                  case AuthResultStatus.successful:
                    return Home();
                  default:
                    return LoginScreen();
                }
              },
            )
          : Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }
}
