import 'package:delivery_app/controller/auth_provider.dart';
import 'package:delivery_app/widget/rounded_card_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';

class MyDrawer extends StatelessWidget {
  AuthenticationProvider authProvider;

  @override
  Widget build(BuildContext context) {
    authProvider = Provider.of<AuthenticationProvider>(context);
    return drawer();
  }

  Drawer drawer() {
    return Drawer(
      child: Container(
        color: Color(0xffd46960),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color(0xffd46960))),
                  color: Color(0xffd46960),
                ),
                accountName: Text("ahmed gomaa"),
                accountEmail: Text("agomaa528@gmail.com"),
                currentAccountPicture: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(ImageKey.imageProfile))),
                )),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3, vertical: 10),
                decoration: BoxDecoration(
                  color: MyColors.backGroundColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    RoundedCardMenu(
                      icon: Icon(
                        Icons.move_to_inbox,
                        color: Colors.black87,
                      ),
                      title: "My Orders",
                      onTap: () {
                        print("hello world1");
                      },
                    ),
                    RoundedCardMenu(
                      icon: Icon(
                        Icons.account_circle,
                        color: Colors.black87,
                      ),
                      title: "My Information",
                      onTap: () {
                        print("hello world2");
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Divider(
                        thickness: 2,
                        color: Color(0xff09000000),
                      ),
                    ),
                    RoundedCardMenu(
                      icon: Icon(
                        Icons.scanner,
                        color: Colors.black87,
                      ),
                      title: "My Orders",
                    ),
                    RoundedCardMenu(
                      icon: Icon(
                        Icons.card_giftcard,
                        color: Colors.black87,
                      ),
                      title: "Share and earn",
                    ),
                    RoundedCardMenu(
                      icon: Icon(
                        Icons.move_to_inbox,
                        color: Colors.black87,
                      ),
                      title: "Promocodes",
                    ),
                    RoundedCardMenu(
                      icon: Icon(
                        Icons.notifications_active,
                        color: Colors.black87,
                      ),
                      title: "Notifications",
                    ),
                    RoundedCardMenu(
                      icon: Icon(
                        Icons.exit_to_app,
                        color: Colors.black87,
                      ),
                      title: "LogOut",
                      onTap: () {
                        authProvider.signOut();
                        Db.db.removeUser();
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Card roundedCard(
      {@required Widget child, Function onTap, Color color = Colors.white}) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: onTap ?? () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: child,
        ),
      ),
    );
  }
}
