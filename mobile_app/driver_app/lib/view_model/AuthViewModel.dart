import 'package:get/get.dart';
import 'package:simnumber/sim_number.dart';
import 'package:simnumber/siminfo.dart';

class AuthViewModel extends GetxController{

  var dummyList = <String>[].obs;
  var originalList = <String>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    printSimCardsData();
  }

  void printSimCardsData() async {
    dummyList.clear();
    originalList.clear();
    try {
      SimInfo simInfo = await SimNumber.getSimData();
      var phoneNumber;
      for (var s in simInfo.cards) {
        phoneNumber = s.phoneNumber!;
        phoneNumber = phoneNumber.replaceFirst(RegExp(r'^\+?91'), '');
        print('Serial number: ${s.slotIndex} ${s.phoneNumber}');
        dummyList.add(phoneNumber);
      }
      if(dummyList.isNotEmpty){
        originalList.value = dummyList;
      }
    } on Exception catch (e) {
      print("error! code: ${e.toString()} - message: ${e.toString()}");
    }
  }

}