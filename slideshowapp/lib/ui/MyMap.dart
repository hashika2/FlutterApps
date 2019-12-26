import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMap extends StatefulWidget {
  MyMap({Key key}) : super(key: key);

  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  static const LatLng _center = const LatLng(45.521563, -122.677433);
  Completer<GoogleMapController> _controller = Completer();
  LatLng _lastMapPosition =_center;
  MapType _currentMapType =MapType.normal;
  final Set<Marker> _markers ={}; 
   
   static final CameraPosition _position =CameraPosition(
     bearing: 192.833,
     target: LatLng(45.521563,-122.677433),
     tilt: 59.440,
     zoom: 11.0,
   );
   Future<void> _goToPosition1() async {
     final GoogleMapController controller = await _controller.future;
     controller.animateCamera(CameraUpdate.newCameraPosition(_position));
   }
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }
  void _onCameraMove(CameraPosition position){
    _lastMapPosition=position.target;
  }
  Widget button(Function function,IconData icon){
    return FloatingActionButton(
      onPressed:function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.blue,
      );
  }

  _onMapTypeButtonPressed(){
    setState(() {
      _currentMapType =_currentMapType ==MapType.normal
      ? MapType.satellite
      :MapType.normal;
    });
  }
  _onAddMarkerButtonPressed(){
    setState(() {
      _markers.add(Marker(
        markerId:MarkerId(
          _lastMapPosition.toString()
        ),
        position: _lastMapPosition,
        infoWindow:InfoWindow(
          title: 'this is Title',
          snippet: 'This is a snippet'
        ),
        icon: BitmapDescriptor.defaultMarker
      ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home:Scaffold(
       appBar: new AppBar(
         title: Text('My Map'),
       ),
       body:Stack(
         children: <Widget>[
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target:_center,
            zoom: 11.0
          ),
          mapType: _currentMapType,
          markers: _markers,
          onCameraMove: _onCameraMove,
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Align(
            child:Column(
              children: <Widget>[
                button(_onMapTypeButtonPressed,Icons.map),
                SizedBox(height: 16.0,),
                button(_onAddMarkerButtonPressed,Icons.add_location),
                 SizedBox(height: 16.0,),
                 button(_goToPosition1,Icons.location_searching)
              ],) ,),)
         ],
       )
        
    )
    );
   
  }
}