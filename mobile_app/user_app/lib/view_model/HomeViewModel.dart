import 'package:get/get.dart';
import 'package:user_app/model/LocationModel.dart';

class HomeViewModel extends GetxController{

  var markerList = <LocationModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAllMarkers();
  }

  Future<void> fetchAllMarkers()async{

    markerList.value = [
      LocationModel(
          id: 1,
          title: 'marker 1',
          latitude: 28.632313,
          longitude: 77.359028,
          icon: 'assets/images/marker1.png',
          distance: "5"),
      LocationModel(
          id: 2,
          title: 'marker 2',
          latitude: 28.622519,
          longitude: 77.344062,
          icon: 'assets/images/marker1.png',
          distance: "3"),
      LocationModel(
          id: 3,
          title: 'marker 3',
          latitude: 28.618760,
          longitude: 77.3827287,
          icon: 'assets/images/marker1.png',
          distance: "7"),
      LocationModel(
          id: 4,
          title: 'marker 4',
          latitude: 28.638513,
          longitude: 77.399745,
          icon: 'assets/images/marker1.png',
          distance: "5"),
      LocationModel(
          id: 5,
          title: 'marker 5',
          latitude: 28.642808,
          longitude: 77.350016,
          icon: 'assets/images/marker1.png',
          distance: "5"),
      LocationModel(
          id: 6,
          title: 'marker 6',
          latitude: 28.598802,
          longitude: 77.362039,
          icon: 'assets/images/marker1.png',
          distance: "9"),
      LocationModel(
          id: 7,
          title: 'marker 7',
          latitude: 28.638513,
          longitude: 77.389745,
          icon: 'assets/images/marker1.png',
          distance: "9"),
      LocationModel(
          id: 8,
          title: 'marker 8',
          latitude: 28.648513,
          longitude: 77.399745,
          icon: 'assets/images/marker1.png',
          distance: "9"),
      LocationModel(
          id: 9,
          title: 'marker 9',
          latitude: 28.648802,
          longitude: 77.372039,
          icon: 'assets/images/marker1.png',
          distance: "9"),
      LocationModel(
          id: 10,
          title: 'marker 10',
          latitude: 28.628802,
          longitude: 77.382039,
          icon: 'assets/images/marker1.png',
          distance: "9"),
    ];

  }

}