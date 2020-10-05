import 'package:delivery_app/bages/category_screen.dart';
import 'package:delivery_app/bages/search_screen.dart';
import 'package:delivery_app/bages/show_stores.dart';
import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<int> catColors = [0xff808dde, 0xffd46960, 0xffe6bf73, 0xff68b5b0];

  int _catColorIndex = 0;

  BuildContext _context;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    this._context = context;
    return Scaffold(
      drawer: MyDrawer(),
      appBar: appBar(),
      body: SafeArea(
        child: (Db.db.userLocation() != null)
            ? Column(
                children: [
                  searchBar(context),
                  categoryList(),
                ],
              )
            : Container(),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: MyColors.backGroundColor,
      title: location(),
      actions: [
        InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Icon(Icons.card_giftcard),
          ),
        ),
      ],
    );
  }

  Center location() {
    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          getLocation();
          _getMyLocationDialog();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ConstrainedBox(
                constraints:
                    BoxConstraints(maxWidth: MySize.width(context) * .5),
                child: Text(
                  (Db.db.userLocation() != null)
                      ? Db.db.userLocation()
                      : "set a delivery address",
                  style: TextStyle(color: MyColors.titleTextColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }

  _getMyLocationDialog() {
    return showDialog(
      context: _context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: MyColors.backGroundColor,
          title: Container(
            padding: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              width: 1,
              color: Colors.black87,
            ))),
            child: Text("Choose a delivery address".allCaps()),
          ),
          content: FutureBuilder(
            future: getLocation(),
            builder: (context, AsyncSnapshot<Address> a) {
              return (a.hasData)
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.of(context, rootNavigator: true).pop();
                          Db.db.getUser().location = a.data.addressLine;
                          Db.db.getUser().lat = a.data.coordinates.latitude;
                          Db.db.getUser().lng = a.data.coordinates.longitude;
                          print(
                              "${a.data.addressLine} : ${a.data.coordinates.latitude}:${a.data.coordinates.longitude}");
                        });
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.my_location,
                                  color: Colors.black87,
                                  size: 30,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Current Location"),
                                  ConstrainedBox(
                                      constraints: BoxConstraints(
                                          maxWidth: MySize.width(context) * .5),
                                      child: Text(
                                        a.data.addressLine,
                                        overflow: TextOverflow.ellipsis,
                                      ))
                                  // location after gelocator
                                ],
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black87,
                          ),
                        ],
                      ))
                  : Container(
                      width: 50,
                      height: 50,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
            },
          ),
        );
      },
    );
  }

  Future<Address> getLocation() async {
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    Address first = addresses.first;
    print("${first.featureName} : ${first.addressLine}");

    return first;
  }

  Expanded categoryList() {
    return Expanded(
      child: ListView.builder(
          itemCount: cats.length,
          itemBuilder: (context, i) {
            _catColorIndex = (_catColorIndex < catColors.length - 1)
                ? _catColorIndex + 1
                : 0;
            return roundedCard(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (c) => (cats[i].containedCatsList != null)
                        ? CategoryScreen(cats[i].containedCatsList)
                        : ShowStores(cats[i].catName),
                  ),
                );
              },
              color: Color(catColors[_catColorIndex]),
              category: cats[i],
            );
          }),
    );
  }

  Card roundedCard(
      {@required Category category,
      Function onTap,
      Color color = Colors.white}) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () {
          if (onTap != null) onTap();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
              category.catName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            trailing: (category.containedCatsList != null)
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        getCatItemsLength(category.catName),
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  )
                : Text(getCatItemsLength(category.catName),
                    style: TextStyle(color: Colors.white)),
            leading: Image.asset(category.catIcon),
          ),
        ),
      ),
    );
  }

  Widget searchBar(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SearchScreen()));
        },
        child: Stack(
          children: [
            Icon(
              Icons.search,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  "whats can we get you?".allCaps(),
                  style: TextStyle(color: Color(0xff949494)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String getCatItemsLength(catName) {
    int catLength = 0;
    storesName.forEach((element) {
      if (element.storeCategory.contains(catName) || catName == "other") {
        catLength += 1;
      }
    });
    return "$catLength";
  }

  Card roundedCardMenu(
      {@required String title,
      @required Icon icon,
      Function onTap,
      Color color = Colors.white}) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () {
          if (onTap != null) onTap();
        },
        child: ListTile(
          leading: icon,
          title: Text(
            title,
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.black87),
        ),
      ),
    );
  }
}
