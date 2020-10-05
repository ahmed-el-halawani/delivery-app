import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';

class User {
  String image;
  String email;
  String name;
  String uuid;
  List<MyOrder> myOrders;
  double lat;
  double lng;
  String location;

  User(
      {this.image,
      this.email,
      this.name,
      this.uuid,
      this.myOrders,
      this.lat,
      this.lng,
      this.location});

  factory User.fromJson(json) => User(
      email: json["email"],
      image: json["image"],
      name: json["name"],
      uuid: json["uuid"],
      myOrders: json["myOrders"],
      lat: json["lat"],
      lng: json["lng"],
      location: json["location"]);

  Map<String, dynamic> toMap() => {
        "email": email,
        "image": image,
        "name": name,
        "uuid": uuid,
        "myOrders": myOrders,
        "lat": lat,
        "lng": lng,
        "location": location,
      };
}

List<User> userDB = [
  User(
    name: "ahmed",
    email: "ahmed",
    uuid: "123",
  ),
];
