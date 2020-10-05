import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';

class Db {
  Db._();

  static Db db = Db._();
  User _u;

  User getUser() {
    return _u;
  }

  void removeUser() {
    _u = null;
  }

  User setUser(User u) {
    if (_u != null) return _u;
    _u = u;
    return _u;
  }

  String userLocation() {
    return (_u == null) ? null : _u.location;
  }

  double userLat() => (_u == null) ? null : _u.lat;

  double userLng() => (_u == null) ? null : _u.lng;

  String userName() => (_u == null) ? null : _u.name;

  String userEmail() => (_u == null) ? null : _u.email;

  String userImage() => (_u == null) ? null : _u.image;

  List<MyOrder> useOrders() => (_u == null) ? null : _u.myOrders;

  String useUuid() => (_u == null) ? null : _u.uuid;
}
