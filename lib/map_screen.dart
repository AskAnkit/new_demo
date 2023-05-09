import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_demo/helper/map_repo.dart';
import 'package:new_demo/helper/user_model.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  late GoogleMapController mapController;

  //final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  late LatLng sourceLocation;
  late LatLng DEST_LOCATION;
  BitmapDescriptor? _markerIcon;


  @override
  void initState() {
    sourceLocation =  const LatLng(37.42796133580664, -122.085749655962);
    super.initState();
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

    final CameraPosition _kLake = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.342867, -122.037499),
      tilt: 59.440717697143555,
      zoom: 49.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        onTap: (cor){
          _handleTap(cor);
        },
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
         setState(() {
           mapController  =controller;
         });
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }
  Future<void> _goToTheLake() async {
    mapController.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  Future<void> _handleTap(LatLng latLng) async {
    //final GoogleMapController controller = await _controller.future;
    var model = UserModel();
    model.latitude = latLng.latitude;
    model.longitude = latLng.longitude;
    MapRepository().addData(model);
    mapController.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }


}
