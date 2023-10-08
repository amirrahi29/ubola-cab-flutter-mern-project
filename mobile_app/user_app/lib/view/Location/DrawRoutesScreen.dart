import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_app/Config/Confidential.dart';

class DrawRoutesScreen extends StatefulWidget {
  const DrawRoutesScreen({Key? key}) : super(key: key);

  @override
  State<DrawRoutesScreen> createState() => _DrawRoutesScreenState();
}

class _DrawRoutesScreenState extends State<DrawRoutesScreen> {

  double? startLatitude = 28.5733039;
  double? startLongitude = 77.0038956;
  double? endLatitude = 28.6441857;
  double? endLongitude = 77.1103125;

  int? distance;

  //markers to show points on map
  Map<MarkerId, Marker> markers = {};
  PolylinePoints _polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};

  //google map controller
  final Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? _mapController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setMarkers();
    _getPolylines();
    _calculateDistance();
  }
  void _calculateDistance()async{
    var result = await Geolocator.distanceBetween(startLatitude!, startLongitude!, endLatitude!, endLongitude!);
    distance = (result/1000).toInt();
  }

  _addMarker(LatLng position, String id, BitmapDescriptor descriptor, title){
    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(
        markerId: markerId,
      icon: descriptor,
      position: position,
      infoWindow: InfoWindow(title: title)
    );
    markers[markerId] = marker;
  }

  _setMarkers()async{
    _addMarker(
        LatLng(startLatitude!, startLongitude!),
        "Source",
        await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(48,48)), 'assets/images/marker.png'),
        "Source Location"
    );
    _addMarker(
        LatLng(endLatitude!, endLongitude!),
        "Destination",
        await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(48,48)), 'assets/images/marker.png'),
        "Destination Location"
    );
  }

  _addPolyLines(List<LatLng> polylinesCoordinates){
    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
        polylineId: id,
      points: polylinesCoordinates,
      width: 4
    );
    polylines[id] = polyline;
    setState(() {});
  }

  _getPolylines()async{
    List<LatLng> polyLineCoordinates = [];
    PolylineResult result = await _polylinePoints.getRouteBetweenCoordinates(
        Confidential.googleMapApiKey,
        PointLatLng(startLatitude!, startLongitude!),
        PointLatLng(endLatitude!, endLongitude!),
      travelMode: TravelMode.driving
    );
    if(result.points.isNotEmpty){
      result.points.forEach((PointLatLng pointLatLng) {
        polyLineCoordinates.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
      });
    }else{
      print("${result.errorMessage}");
    }
    _addPolyLines(polyLineCoordinates);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[

              GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(startLatitude!,startLongitude!),
                    zoom: 12
                  ),
                compassEnabled: false,
                  buildingsEnabled: false,
                trafficEnabled: false,
                polylines: Set<Polyline>.of(polylines.values),
                markers: Set<Marker>.of(markers.values),
                onMapCreated: (GoogleMapController controller){
                    _controller.complete(controller);
                },
              ),

              Positioned(
                top: 8,
                  right: 8,
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Text("Distance: ${distance} Km."),
                    ),
                  )
              )

            ],
          ),
        )
    );
  }
}
