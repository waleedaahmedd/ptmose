import 'package:flutter/cupertino.dart';
import 'package:ptmose/models/responses/locations_model.dart';

import '../dummy_data.dart';

class LocationsViewModel with ChangeNotifier {
  final List<LocationsModel> _locationList = [];
  LocationsModel? _selectedLocation;

  List<LocationsModel> get getLocationsList => _locationList;

  LocationsModel get getSelectedLocation => _selectedLocation!;

  void setLocationsList(List<LocationsModel> value) {
    _locationList.addAll(value);
    notifyListeners();
  }

  void setSelectedLocation(LocationsModel value) {
    _selectedLocation = value;
    notifyListeners();
  }

  callLocationsListApi() {
    _locationList.clear();
    setLocationsList(DummyData().locationsList);
  }
}
