import 'package:appllotesting/View/Home/Controller/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var contoller = Get.put(HomeController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 80, left: 10, right: 10),
                child: TextField(
                  onChanged: (value) {
                    contoller.newList.value = contoller.ApiList.where(
                        (item) => item.fname!.toLowerCase().contains(value.toLowerCase())).toList();
                  },
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.0),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'User',
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Search User',
                      hintStyle: TextStyle(color: Colors.black)),
                ),
              ),
              contoller.newList.length == 0?
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Container(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator()),
              )
              :Container(
                height: height / 1.3,
                child:ListView.builder(
                        itemCount: contoller.newList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                decoration: new BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.black)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Container(
                                        width: 150,
                                        height: 150,
                                        decoration: new BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 2, color: Colors.black)),
                                        child:
                                            //Image.network("https://friendly-cohen.3-16-11-30.plesk.page/storage/profile/${contoller.newList[index].email}/${contoller.newList[index].profile}")
                                            Image.asset("assets/ijmg.png"),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 30, horizontal: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                contoller.newList[index].fname!,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                contoller.newList[index].lname!,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            contoller.newList[index].username!,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w800,
                                                fontSize: 20),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            contoller.newList[index].email!,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
