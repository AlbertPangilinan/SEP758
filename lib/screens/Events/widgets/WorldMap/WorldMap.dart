import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../classes/Event.dart';

class WorldMap extends StatefulWidget {
  WorldMap({Key? key}) : super(key: key);

  @override
  _WorldMapState createState() => _WorldMapState();
}

class _WorldMapState extends State<WorldMap> {
  Map<String, Marker> _markers = {};
  List<Event> _lanEvents = [];

  Future<void> _onMapCreated(GoogleMapController controller) async {
    DatabaseReference _eventsRef = FirebaseDatabase.instance.ref("events");
    DatabaseEvent _readEvents = await _eventsRef.once();

    late List<Object?> _data = _readEvents.snapshot.value as List<Object?>;

    for (dynamic _obj in _data) {
      _lanEvents.add(Event(
        name: _obj["name"],
        venue: _obj["venue"],
        lat: _obj["lat"],
        long: _obj["long"],
      ));
    }

    setState(() {
      _markers.clear();
      for (Event event in _lanEvents) {
        final marker = Marker(
          markerId: MarkerId(event.name),
          position: LatLng(event.lat, event.long),
          infoWindow: InfoWindow(
            title: event.name,
            snippet: event.venue,
          ),
        );
        _markers[event.name] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(43, -100),
          zoom: 0,
        ),
        markers: _markers.values.toSet(),
      ),
    );
  }
}
