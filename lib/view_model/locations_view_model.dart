import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ptmose/models/responses/locations_model.dart';

import '../Service/api_service.dart';
import '../dummy_data.dart';

class LocationsViewModel with ChangeNotifier {
  LocationData? _selectedLocation;
  LocationsModel? _locationsResponse;
  final List<LocationData> _locationsList = [];
  bool _showLocationList = false;

  LocationsModel get getLocationModel => _locationsResponse!;

  bool get getShowLocationList => _showLocationList;


  List<LocationData> get getLocationList => _locationsList;

  LocationData get getSelectedLocation => _selectedLocation!;

  void setLocationModel(LocationsModel value) {
    _locationsResponse = value;
    notifyListeners();
  }

  void setShowLocationList(bool value) {
    _showLocationList = value;
    notifyListeners();
  }

  void setLocationList(List<LocationData> value) {
    _locationsList.addAll(value);
    notifyListeners();
  }

  void setSelectedLocation(LocationData value) {
    _selectedLocation = value;
    notifyListeners();
  }

  callLocationsListApi() async {
    EasyLoading.show(status: 'Please Wait...');

    final response = await GetAllLocationsApi();
    if (response != null) {
      setLocationModel(response);
      if (_locationsResponse!.data!.getAllLocations!.data!.isNotEmpty) {
        _locationsList.clear();
        setLocationList(_locationsResponse!.data!.getAllLocations!.data!);
        setSelectedLocation(_locationsResponse!.data!.getAllLocations!.data!.first);
      }
      EasyLoading.dismiss();
    } else {
      return false;
    }
  }
}
