import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:ptmose/models/responses/locations_model.dart';

import '../Service/api_service.dart';
import '../dummy_data.dart';
import 'home_view_model.dart';

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

  Future<void> setSelectedLocation(
      LocationData value, BuildContext context) async {
    _selectedLocation = value;
    await Provider.of<HomeViewModel>(context, listen: false)
        .callWineriesAndTestingList(_selectedLocation!.id);
    notifyListeners();
  }

  Future<void> callLocationsListApi(BuildContext context) async {
    EasyLoading.show(status: 'Please Wait...');

    final response = await getAllLocationsApi();
    if (response != null) {
      setLocationModel(response);
      if (_locationsResponse!.data!.getAllLocations!.data!.isNotEmpty) {
        _locationsList.clear();
        setLocationList(_locationsResponse!.data!.getAllLocations!.data!);
        setSelectedLocation(
            _locationsResponse!.data!.getAllLocations!.data!.first, context);
      }
      EasyLoading.dismiss();
    } else {
      EasyLoading.dismiss();
    }
  }
}
