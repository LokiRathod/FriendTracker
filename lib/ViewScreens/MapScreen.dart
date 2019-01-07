import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapScreen extends StatefulWidget {
  MapScreen(this.latitude, this.longitude ,this.userName);
  String longitude, latitude ,userName;
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userName),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 450.0,
              child: GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                  mapController.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                          tilt: 50.0,
                          bearing: 45.0,
                          zoom: 19.0,
                          target: LatLng(double.parse(widget.latitude), double.parse(widget.longitude))),
                    ),
                  );
                  mapController.addMarker(
                    MarkerOptions(
                      position: LatLng(double.parse(widget.latitude), double.parse(widget.longitude)),
                      infoWindowText: InfoWindowText('${widget.userName}', ''),
                      icon: BitmapDescriptor.defaultMarker,
                    ),
                  );
                },
                options: GoogleMapOptions(myLocationEnabled: true,trackCameraPosition: true),


              ),
            ),
          ),
        /* Container(
           child: Padding(
             padding: const EdgeInsets.all(18.0),
             child: Column(
               children: <Widget>[
                 Text("User Name: " + widget.userName),
                 Text("EmailID: loki@gmail.com"),
                 Text("Last Update Time: 12345690"),
               ],
             ),
           ),
         ),*/
        ],
      ),
    );
  }


/*  void _onMapCreated(GoogleMapController controller) {
   *//* mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(double.parse(widget.latitude), double.parse(widget.longitude)), zoom: 14.0),
      ),
    );*//*

    setState(() {
      mapController.addMarker(MarkerOptions(
        position: LatLng(double.parse(widget.latitude), double.parse(widget.longitude),),
        infoWindowText: InfoWindowText(widget.userName, ""),

      ),);
      mapController = controller;
    });
  }*/
}
