import 'package:geolocator/geolocator.dart';

class Location {

  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {

    try {
      LocationPermission permission = await Geolocator.checkPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      // print(position);

      latitude = position.latitude;
      longitude = position.longitude;

    }
    catch (e){
      print(e);
    }
  }

}