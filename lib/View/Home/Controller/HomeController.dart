import 'package:appllotesting/Model/User.dart';
import 'package:appllotesting/Service/ApiService.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  RxList<AllUsers> newList=<AllUsers>[].obs;
  RxList<AllUsers> ApiList=<AllUsers>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    callApi();
  }
  callApi() async{
   List<AllUsers>? list=await ApiService.callApi();
   ApiList.value=list!;
   newList.value=list!;
   print("Updated list: "+newList.length.toString());
  }
}