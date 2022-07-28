import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:provider/provider.dart';
import 'package:ptmose/models/responses/locations_model.dart';
import 'package:ptmose/models/responses/tasting_list_by_location_reaponse.dart';
import 'package:ptmose/view_model/wineriesListViewModel.dart';

import '../Service/api_service.dart';
import '../models/requests/location_request.dart';
import '../models/requests/tastings_list_by_location_request.dart';
import '../models/requests/wineries_and_testing_request.dart';
import '../models/requests/wineries_list_by_location_request.dart';
import '../models/responses/tastings_response.dart';
import '../models/responses/wineries_and_testing_response.dart';
import '../models/responses/wineries_list_by_location_reaponse.dart';
import '../models/responses/wineries_response.dart';
import 'home_view_model.dart';

class LocationsViewModel with ChangeNotifier {
  final List<Tastings> _tastingList = [];
  final List<Wineries> _wineriesList = [];
  WineriesAndTestingResponse? _wineriesAndTestingResponse;
  LocationData? _selectedLocation;
  LocationsModel? _locationsResponse;
  final List<LocationData> _locationsList = [];
  bool _showLocationList = false;
  final List<Wineries> _wineriesListByLocation = [];
  final List<Tastings> _tastingListByLocation = [];
  TastingListByLocationResponse? _tastingListByLocationResponse;
  WineriesListByLocationResponse? _wineriesListByLocationResponse;

  LocationsModel get getLocationModel => _locationsResponse!;

  TastingListByLocationResponse get getTastingListByLocationResponse =>
      _tastingListByLocationResponse!;

  List<Tastings> get getTastingListByLocation => _tastingListByLocation;

  bool get getShowLocationList => _showLocationList;

  List<LocationData> get getLocationList => _locationsList;

  LocationData get getSelectedLocation => _selectedLocation!;

  WineriesAndTestingResponse get getWineriesAndTestingResponse =>
      _wineriesAndTestingResponse!;

  List<Wineries> get getWineriesList => _wineriesList;

  List<Tastings> get getTastingList => _tastingList;

  List<Wineries> get getWineriesListByLocation => _wineriesListByLocation;

  WineriesListByLocationResponse get getWineriesListByLocationResponse =>
      _wineriesListByLocationResponse!;

  void setWineriesListByLocationResponse(WineriesListByLocationResponse value) {
    _wineriesListByLocationResponse = value;
    notifyListeners();
  }

  void setTastingListByLocationResponse(TastingListByLocationResponse value) {
    _tastingListByLocationResponse = value;
    notifyListeners();
  }

  void setTastingListByLocation(List<Tastings> value) {
    _tastingListByLocation.addAll(value);
    notifyListeners();
  }

  void setWineriesList(List<Wineries> value) {
    _wineriesList.addAll(value);
    notifyListeners();
  }

  void setWineriesAndTestingResponse(WineriesAndTestingResponse value) {
    _wineriesAndTestingResponse = value;
    notifyListeners();
  }

  void setWineriesListByLocation(List<Wineries> value) {
    _wineriesListByLocation.addAll(value);
    notifyListeners();
  }

  void setTestingList(List<Tastings> value) {
    _tastingList.addAll(value);
    notifyListeners();
  }

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

  Future<void> setSelectedLocation(LocationData value) async {
    _selectedLocation = value;
    await callWineriesAndTastingList(_selectedLocation!.id);
    await callWineriesListByLocation(_selectedLocation!.id);
    await callTastingListByLocation(_selectedLocation!.id);

    notifyListeners();
  }

  Future<void> callLocationsListApi(BuildContext context) async {
    EasyLoading.show(status: 'Please Wait...');
    LocationRequest locationRequest = LocationRequest();

    final response = await getAllLocationsApi(locationRequest: locationRequest);
    if (response != null) {
      setLocationModel(response);
      if (_locationsResponse!.data!.getAllLocations!.data!.isNotEmpty) {
        _locationsList.clear();
        setLocationList(_locationsResponse!.data!.getAllLocations!.data!);
        setSelectedLocation(
            _locationsResponse!.data!.getAllLocations!.data!.first);
      }
      EasyLoading.dismiss();
    } else {
      EasyLoading.dismiss();
    }
  }

  Future<void> callWineriesListByLocation(int? locationId) async {
    _wineriesListByLocation.clear();
    WineriesListByLocationRequest wineriesListByLocationRequest =
        WineriesListByLocationRequest(locationId!);
    final response = await getAllWineriesListByLocation(
        wineriesListByLocationRequest: wineriesListByLocationRequest);
    if (response != null) {
      setWineriesListByLocationResponse(response);
      if (_wineriesListByLocationResponse!
          .data!.getAllWineries!.data!.isNotEmpty) {
        setWineriesListByLocation(
            _wineriesListByLocationResponse!.data!.getAllWineries!.data!);
      }
    } else {
      EasyLoading.dismiss();
    }
    EasyLoading.dismiss();
  }

  Future<void> callTastingListByLocation(int? locationId) async {
    _tastingListByLocation.clear();
    TastingListByLocationRequest tastingListByLocationRequest =
        TastingListByLocationRequest(locationId!);
    final response = await getAllTastingListByLocation(
        tastingListByLocationRequest: tastingListByLocationRequest);
    if (response != null) {
      setTastingListByLocationResponse(response);
      if (_tastingListByLocationResponse!
          .data!.getAllTastings!.data!.isNotEmpty) {
        setTastingListByLocation(
            _tastingListByLocationResponse!.data!.getAllTastings!.data!);
      }
    } else {
      EasyLoading.dismiss();
    }
    EasyLoading.dismiss();
  }

  Future<void> callWineriesAndTastingList(int? locationId) async {
    EasyLoading.show(status: 'Please Wait...');
    _wineriesList.clear();
    _tastingList.clear();
    WineriesAndTastingsRequest wineriesAndLocationRequest =
        WineriesAndTastingsRequest(locationId!);
    final response = await getWineriesAndTastings(
        wineriesAndLocationRequest: wineriesAndLocationRequest);
    if (response != null) {
      setWineriesAndTestingResponse(response);
      if (_wineriesAndTestingResponse!
          .data!.getWineryByLocation!.data!.wineries!.isNotEmpty) {
        setWineriesList(_wineriesAndTestingResponse!
            .data!.getWineryByLocation!.data!.wineries!);
      }
      if (_wineriesAndTestingResponse!
          .data!.getWineryByLocation!.data!.tastings!.isNotEmpty) {
        setTestingList(_wineriesAndTestingResponse!
            .data!.getWineryByLocation!.data!.tastings!);
      }
    } else {
      EasyLoading.dismiss();
    }
  }

  Future<void> showLocation() async {
    final googleMap = await MapLauncher.isMapAvailable(MapType.google);
    if (googleMap!) {
      await MapLauncher.showDirections(
        mapType: MapType.google,
        destination: Coords(24.91787128399232, 67.06985695767303),
      );
    }
  }
}
