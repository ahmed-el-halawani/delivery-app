import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  int click = 0;
  GoogleMapController _mapController;
  LocationPermission geoStatus;
  Future<Position> position;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkPermission().then((value) {
      geoStatus = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: getCurrentPosition(),
                builder: (context, AsyncSnapshot<Position> pos) => (pos.hasData)
                    ? GoogleMap(
                        onMapCreated: (mapController) {
                          setState(
                            () {
                              _mapController = mapController;
                            },
                          );
                        },
                        initialCameraPosition: CameraPosition(
                            target:
                                LatLng(pos.data.latitude, pos.data.longitude),
                            zoom: 8.0),
                      )
                    : Container(
                        child: Text("empty screen"),
                      ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _goToTheLake();
        },
      ),
    );
  }

  Future _goToTheLake() async {
    click = (click * -1) - 1;
    ((click) == 0)
        ? _mapController.animateCamera(CameraUpdate.newCameraPosition(_kLake2))
        : _mapController.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  static final CameraPosition _kLake = CameraPosition(
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 8.0);
  static final CameraPosition _kLake2 =
      CameraPosition(target: LatLng(26.8206, 30.8025), zoom: 8.0);
}
