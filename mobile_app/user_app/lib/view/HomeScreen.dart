import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_app/Config/AllDimensions.dart';
import 'package:user_app/Config/Allcolors.dart';
import 'package:user_app/Config/routes/PageConstants.dart';
import 'package:user_app/view_model/HomeViewModel.dart';
import 'package:user_app/view_model/SplashViewModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final homeViewModel = Get.put(HomeViewModel());
  final splashViewModel = Get.put(SplashViewModel());
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> _markers = <Marker>[];

  //declare this method for image
  Future<Uint8List> getImages(String path, int width) async{
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return(await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAllMapMarkersData();
  }

  Future<void> loadAllMapMarkersData()async{
    for(int i =0; i<homeViewModel.markerList.length; i++){

      final Uint8List markersIcons = await getImages(homeViewModel.markerList[i].icon!, 50);
      _markers.add(
        Marker(
            markerId: MarkerId(i.toString()),
          icon: BitmapDescriptor.fromBytes(markersIcons),
          position: LatLng(homeViewModel.markerList[i].latitude!,homeViewModel.markerList[i].longitude!),
          infoWindow: InfoWindow(
            title: homeViewModel.markerList[i].title,
            snippet: '${homeViewModel.markerList[i].distance} Km'
          )
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Obx(()=>
          Stack(
            children: <Widget>[

              GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(double.parse(splashViewModel.latitude.value),double.parse(splashViewModel.longitude.value)),
                    zoom: 12
                  ),
                markers: Set<Marker>.of(_markers),
                mapType: MapType.normal,
                myLocationEnabled: true,
                compassEnabled: false,
                zoomControlsEnabled: false,
                buildingsEnabled: false,
                trafficEnabled: false,
                indoorViewEnabled: false,
                onMapCreated: (GoogleMapController controller){
                  _controller.complete(controller);
                },
              ),

              Positioned(
                left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    color: Allcolors.whiteColor,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[

                        SizedBox(
                          height: AllDimensions.seventy,
                          child: ListView.builder(
                            itemCount: 10,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context,index){
                                return Column(
                                  children: <Widget>[

                                    Container(
                                      margin: EdgeInsets.only(left: AllDimensions.eigth,right: AllDimensions.eigth),
                                      padding: EdgeInsets.all(AllDimensions.eigth),
                                      child: Image.asset("assets/images/tour.png",height: AllDimensions.thirty,
                                      width: AllDimensions.fifty,),
                                    ),
                                    Text("Rental",
                                    style: TextStyle(fontSize: AllDimensions.fourteen),)

                                  ],
                                );
                              }
                          ),
                        ),

                        Divider(color: Colors.grey[300]),

                        Container(
                          margin: EdgeInsets.only(left: AllDimensions.eigth,right: AllDimensions.eigth),
                          child: Card(
                            elevation: 3,
                            child: Container(
                              margin: EdgeInsets.all(AllDimensions.eigth),
                              child: Column(
                                children: <Widget>[

                                  Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(AllDimensions.eigth),
                                      color: Colors.grey[300],
                                    ),
                                    child: Row(
                                      children: <Widget>[

                                        Container(
                                          margin: EdgeInsets.only(left: AllDimensions.eigth,right: AllDimensions.eigth),
                                          child: Icon(Icons.search,size: AllDimensions.thirtyTwo,color: Allcolors.greenColor,),
                                        ),

                                        Text("Search destination",
                                        style: TextStyle(fontSize: AllDimensions.twenty,
                                        fontWeight: FontWeight.bold),)

                                      ],
                                    ),
                                  ),

                                  for(int i =0; i<3; i++)
                                    Container(
                                      margin: EdgeInsets.only(left: AllDimensions.eigth,
                                      right: AllDimensions.eigth,top: AllDimensions.eigth),
                                      child: Row(
                                        children: <Widget>[

                                          Icon(Icons.refresh_outlined,color: Allcolors.greyColor,),
                                          SizedBox(width: AllDimensions.eigth,),
                                          Expanded(child: Text("Noida electronic city 201301city 201301..."))

                                        ],
                                      ),
                                    )

                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  )
              ),

              Positioned(
                top: AllDimensions.eigth,
                  left: AllDimensions.eigth,
                  right: AllDimensions.eigth,
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, PageConstants.locationSearchScreen);
                    },
                    child: Card(
                      elevation: 3,
                      child: Container(
                        height: AllDimensions.fourty,
                        margin: EdgeInsets.only(left: AllDimensions.eigth,
                        right: AllDimensions.eigth),
                        child: Row(
                          children: <Widget>[

                            Container(
                              margin: EdgeInsets.only(left: AllDimensions.eigth,
                              right: AllDimensions.eigth),
                              child: Icon(Icons.menu, size: AllDimensions.twentyFour,),
                            ),

                            Expanded(
                                child: Text("Your current location",
                                style: TextStyle(
                                  fontSize: AllDimensions.fourteen
                                ),)
                            ),

                            Icon(Icons.favorite_border_outlined)

                          ],
                        ),
                      ),
                    ),
                  )
              )

            ],
          )
          ),
        )
    );
  }
}
