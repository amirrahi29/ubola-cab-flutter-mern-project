import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:user_app/Config/AllDimensions.dart';
import 'package:user_app/Config/Confidential.dart';

class SearchLocation extends StatefulWidget {
  const SearchLocation({Key? key}) : super(key: key);

  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {

  final _sourceController = TextEditingController();
  final _destinationController = TextEditingController();

  //node
  FocusNode? _startFocusNode;
  FocusNode? _endFocusNode;

  //detail
  DetailsResult? _startPosition;
  DetailsResult? _endPosition;

  //list
  GooglePlace? _googlePlace;
  List<AutocompletePrediction> predictions = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startFocusNode = FocusNode();
    _endFocusNode = FocusNode();
    _googlePlace = GooglePlace(Confidential.googleMapApiKey);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _startFocusNode!.dispose();
    _endFocusNode!.dispose();
    _sourceController.dispose();
    _destinationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[

                TextField(
                  autofocus: false,
                  controller: _sourceController,
                  focusNode: _startFocusNode,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Source location',
                    filled: true,
                    fillColor: Colors.grey[200],
                    prefixIcon: Icon(Icons.my_location_outlined),
                    suffixIcon: InkWell(
                      onTap: (){
                        _sourceController.text = "";
                      },
                        child: Icon(Icons.close)),
                  ),
                  onChanged: (value){
                    print(value);
                    Future.delayed(Duration(seconds: 1),(){
                      if(value.isNotEmpty){
                        autoCompleteSearch(value);
                      }else{
                        if(predictions.isNotEmpty && mounted){
                          setState(() {
                            predictions = [];
                          });
                        }
                      }
                    });
                  },
                ),

                SizedBox(height: AllDimensions.eigth,),

                TextField(
                  autofocus: false,
                  controller: _destinationController,
                  focusNode: _endFocusNode,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Destination location',
                    filled: true,
                    fillColor: Colors.grey[200],
                    prefixIcon: Icon(Icons.flag),
                    suffixIcon: InkWell(
                      onTap: (){
                        _destinationController.text = "";
                      },
                        child: Icon(Icons.close)),
                  ),
                  onChanged: (value){
                    print(value);
                    Future.delayed(Duration(seconds: 1),(){
                      if(value.isNotEmpty){
                        autoCompleteSearch(value);
                      }else{
                        if(predictions.isNotEmpty && mounted){
                          setState(() {
                            predictions = [];
                          });
                        }
                      }
                    });

                  },
                ),

                SizedBox(height: AllDimensions.eigth,),

                Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context,index){
                        return Divider();
                      },
                      itemCount: predictions.length,
                        itemBuilder: (context,index){
                        return InkWell(
                          onTap: ()async{
                            var details = await _googlePlace!.details.get(predictions[index].placeId!);
                            if(_startFocusNode!.hasFocus){
                              setState(() {
                                _startPosition = details!.result!;
                                _sourceController.text = details.result!.name!;
                                predictions = [];
                              });
                            }
                            if(_endFocusNode!.hasFocus){
                              setState(() {
                                _endPosition = details!.result!;
                                _destinationController.text = details.result!.name!;
                                predictions = [];
                              });
                            }
                            if(_startPosition != null && _endPosition != null && mounted){
                              print("start position: ${_startPosition!.name}");
                              print("end position: ${_endPosition!.name}");
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 8,bottom: 8),
                            child: Row(
                              children: <Widget>[

                                Icon(Icons.location_on_outlined),
                                SizedBox(width: AllDimensions.eigth,),
                                Expanded(child: Text(predictions[index].description!))

                              ],
                            ),
                          ),
                        );
                        }
                    )
                )

              ],
            ),
          ),
        )
    );
  }

  void autoCompleteSearch(String value)async{
    var result = await _googlePlace!.autocomplete.get(value);
    if(result != null && result.predictions != null && mounted){
      setState(() {
        predictions = result.predictions!;
      });
    }
  }
}
