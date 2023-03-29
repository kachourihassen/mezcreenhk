import 'dart:convert';

import 'package:filling_slider/filling_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mezcreen/Controller/Provide.dart';
import 'package:mezcreen/Models/datatype.dart';
import 'package:mezcreen/Views/Popup.dart';
import 'package:mezcreen/Views/Widgets.dart';
import 'package:provider/provider.dart';

import '../env.dart';

class MyRoom extends StatefulWidget {
  String roomKey;
  dynamic roomValue;
  MyRoom({super.key, required this.roomKey, required this.roomValue});

  @override
  State<MyRoom> createState() => _MyRoomState();
}

List<dynamic> device = [];

class _MyRoomState extends State<MyRoom> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only(left: width * .2),
          child: text(" ${widget.roomValue}", 18, 0xff000000, FontWeight.w500,
              FontStyle.normal, 0),
        ),
      ),
      backgroundColor: Color(0xffffffff),
      body: Padding(
        padding: EdgeInsets.only(
            top: height * .033, left: width * .043, right: width * .043),
        child: SingleChildScrollView(
            child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                displayAddDialog(
                    context, "images/device.png", "Add new device", tpdGroup);
              },
              child: Container(
                height: height,
                child: Column(
                  children: [
                    Container(
                      height: height * .07,
                      color: Color(0xFFF5F5F5),
                      child: Center(child: Image.asset("images/Add.png")),
                    ),
                    Flexible(
                      child: FutureBuilder<DataSnapshot>(
                          future: FirebaseDatabase.instance
                              .ref()
                              .child("$rootNode/${widget.roomKey}/devices")
                              .get(),
                          builder: (BuildContext context,
                              AsyncSnapshot<DataSnapshot> snapshot) {
                            List<Widget> children = <Widget>[];
                            if (snapshot.hasData) {
                              Map<dynamic, dynamic> rooms =
                                  snapshot.data!.value as Map<dynamic, dynamic>;
                              rooms.forEach((key, value) {
                                device.add(value['name']);
                              });

                              children.add(
                                GridView.builder(
                                  padding: EdgeInsets.only(
                                      top: height * .03,
                                      left: width * .012,
                                      right: width * .012),
                                  shrinkWrap: true,
                                  itemCount: rooms.length,
                                  itemBuilder: (context, i) {
                                    return GridTile(
                                      child: GestureDetector(
                                        onTap: () {
                                          displaySelectRoomDialog(
                                              context,
                                              device[i],
                                              device[i],
                                              "",
                                              "",
                                              "images/device.png",
                                              false);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 1.5,
                                                blurRadius: 1.5,
                                                offset: Offset(0, 1),
                                              ),
                                            ],
                                          ),
                                          child: Center(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: height * .02,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: width * .04,
                                                      right: width * .04),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                          'images/light.png'),
                                                      Spacer(),
                                                      StyledSwitch(
                                                        onToggled:
                                                            (bool isToggled) {},
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: height * .02,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    text(
                                                        " ${device[i]}",
                                                        15,
                                                        0xFF000000,
                                                        FontWeight.w500,
                                                        FontStyle.normal,
                                                        0),
                                                    SizedBox(
                                                      height: height * .032,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: width * 0.3),
                                                      child: text(
                                                          "  On",
                                                          12,
                                                          0xffB1B0B0,
                                                          FontWeight.w500,
                                                          FontStyle.normal,
                                                          0.0008),
                                                    ),
                                                    SizedBox(
                                                      height: height * .02,
                                                    ),
                                                    device[i] == "Light 1"
                                                        ? slider()
                                                        : device[i] == "Light"
                                                            ? slider()
                                                            : SizedBox(),
                                                    device[i] == "Fan"
                                                        ? CountFan()
                                                        : device[i] ==
                                                                "Airconditioner"
                                                            ? CountFan()
                                                            : device[i] == "ac"
                                                                ? CountFan()
                                                                : SizedBox(),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 20,
                                  ),
                                ),
                              );
                            }
                            return Column(
                              children: children,
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
