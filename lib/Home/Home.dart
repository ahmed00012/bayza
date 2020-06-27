import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_webservice/places.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color _getColor(String color) {
    return Color(int.parse(color.substring(1, 7), radix: 16) + 0xFF000000);
  }



  GoogleMapsPlaces _places =
  GoogleMapsPlaces(apiKey: 'AIzaSyALuXnyfDaPxuWG1yCF2esWqqJ6prtNPbg');
  GoogleMapController mapController;
  Completer<GoogleMapController> _controller = Completer();

  List<Marker> _markers = <Marker>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _markers.add(Marker(
        markerId: MarkerId('SomeId'),
        position: LatLng(31.198037, 29.913910),
        infoWindow: InfoWindow(title: 'The title of the marker')));
  }

  //  void _onMapCreated(GoogleMapController controller) {
//    mapController = controller;
//  }

  Future<Null> displayPrediction(Prediction p,ScaffoldState scaffold) async {
    if (p != null) {
      PlacesDetailsResponse detail =
      await _places.getDetailsByPlaceId(p.placeId);

      var placeId = p.placeId;
      double lat = detail.result.geometry.location.lat;
      double lng = detail.result.geometry.location.lng;
      scaffold.showSnackBar(
        SnackBar(content: Text("${p.description} - $lat/$lng")),
      );

      var address = await Geocoder.local.findAddressesFromQuery(p.description);

      print(lat);
      print(lng);
    }
  }

  @override
  Widget build(BuildContext context) {

    final homeScaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      body: Stack(alignment: Alignment.topCenter, children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.99,
          width: double.infinity,
          child: GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            gestureRecognizers: Set()
              ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
              ..add(
                Factory<VerticalDragGestureRecognizer>(
                        () => VerticalDragGestureRecognizer()),
              )
              ..add(
                Factory<HorizontalDragGestureRecognizer>(
                        () => HorizontalDragGestureRecognizer()),
              )
              ..add(
                Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()),
              ),
            zoomGesturesEnabled: true,
            scrollGesturesEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition:
            CameraPosition(target: LatLng(31.201132, 29.930865), zoom: 13),
          ),
        ),
        Positioned(
          top: 30,
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.all(Radius.circular(20))),
            child: Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(7)),
                Text(
                  'Your Location',
                  style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.black45,
                ),
                Expanded(
                  child: InkWell(

                    onTap: () async {
                      Prediction p = await PlacesAutocomplete.show(
                          context: context,
                          mode: Mode.overlay,
                          components: [Component(Component.country, "egy"),
                          ],
                          logo: Container(
                            height: 0,
                          ),


                          apiKey: 'AIzaSyALuXnyfDaPxuWG1yCF2esWqqJ6prtNPbg');
                      displayPrediction(p,homeScaffoldKey.currentState);
                    },

                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
