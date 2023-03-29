import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcreen/Controller/Provide.dart';
import 'package:mezcreen/Models/datatype.dart';
import 'package:mezcreen/env.dart';
import 'package:provider/provider.dart';
import 'Popup.dart';
import 'Widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> Rkey = [];
  List<dynamic> items = [];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: height * .033, left: width * .04, right: width * .04),
        child: SingleChildScrollView(
          child: Stack(children: [
            Column(
              children: [
                Row(
                  children: [
                    text("Hello Mateo, ", 20, 0xFF000000, FontWeight.w500,
                        FontStyle.normal, 0),
                    Padding(
                      padding: EdgeInsets.only(left: width * .46),
                      child: Image.asset("images/ProfileImage.png"),
                    ),
                  ],
                ),
                //textScaleFactor: 1.2,
                Align(
                  alignment: Alignment.centerLeft,
                  child: text("Today’s weather", 15, 0xFF494949,
                      FontWeight.w400, FontStyle.normal, 0),
                ),
                Row(
                  children: [
                    Image.asset("images/Meteo.png"),
                    SizedBox(
                      width: width * .02,
                    ),
                    text("14°C", 18, 0xFF000000, FontWeight.w400,
                        FontStyle.normal, 0),
                  ],
                ),
                SizedBox(
                  height: height * .02,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: text("Energy saving", 18, 0xFF000000, FontWeight.w500,
                      FontStyle.normal, 0),
                ),
                SizedBox(
                  height: height * .01,
                ),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: height * .1,
                            width: width * .445,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1.5,
                                  blurRadius: 1.5,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: width * .012),
                              child: Center(
                                child: Row(
                                  children: [
                                    Image.asset('images/Electro.png'),
                                    SizedBox(
                                      width: width * .02,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: height * .025,
                                          right: width * .01),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: width * .05,
                                            ),
                                            child: text(
                                                "Today",
                                                12,
                                                0xffB1B0B0,
                                                FontWeight.w500,
                                                FontStyle.normal,
                                                0),
                                          ),
                                          SizedBox(
                                            height: height * .02,
                                          ),
                                          text(
                                              "93 kWh",
                                              15,
                                              0xff000000,
                                              FontWeight.w500,
                                              FontStyle.normal,
                                              0.0008),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width * .025,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: height * .1,
                            width: width * .445,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1.5,
                                  blurRadius: 1.5,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: width * .012),
                              child: Center(
                                child: Row(
                                  children: [
                                    Image.asset('images/Bolt.png'),
                                    SizedBox(
                                      width: width * .02,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: height * .025,
                                        left: width * .01,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: width * .1,
                                            ),
                                            child: text(
                                                "This week",
                                                12,
                                                0xffB1B0B0,
                                                FontWeight.w500,
                                                FontStyle.normal,
                                                0),
                                          ),
                                          SizedBox(
                                            height: height * .02,
                                          ),
                                          text(
                                              "970,244 kWh",
                                              15,
                                              0xFF000000,
                                              FontWeight.w500,
                                              FontStyle.normal,
                                              0.0008),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .02,
                ),
                Container(
                  height: height * .5,
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: text("Rooms", 18, 0xFF000000, FontWeight.w500,
                            FontStyle.normal, 0),
                      ),
                      Flexible(
                        child: FutureBuilder<DataSnapshot>(
                            future: FirebaseDatabase.instance
                                .ref()
                                .child(rootNode)
                                .get(),
                            builder: (BuildContext context,
                                AsyncSnapshot<DataSnapshot> snapshot) {
                              List<Widget> children = <Widget>[];
                              if (snapshot.hasData) {
                                Map<dynamic, dynamic> rooms = snapshot
                                    .data!.value as Map<dynamic, dynamic>;
                                rooms.forEach((key, value) {
                                  items.add(value['name']);
                                  Rkey.add(key);
                                });
                                children.add(GridView.builder(
                                  padding: EdgeInsets.only(top: height * .01),
                                  shrinkWrap: true,
                                  itemCount: rooms.length + 1,
                                  itemBuilder: (context, i) {
                                    if (i == rooms.length) {
                                      return GestureDetector(
                                        onTap: () {
                                          displayAddDialog(
                                              context,
                                              "images/Addnewroom.png",
                                              "Add new room",
                                              tpGroup);
                                        },
                                        child: Container(
                                          height: height * .001,
                                          width: width * .44,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF5F5F5),
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
                                          child: Image.asset('images/Add.png'),
                                        ),
                                      );
                                    }

                                    return GridTile(
                                      child: GestureDetector(
                                        onTap: () {
                                          displaySelectRoomDialog(
                                              context,
                                              "${items[i]}",
                                              "${items[i]}",
                                              Rkey[i],
                                              items[i],
                                              "images/${i + 1}.png",
                                              true);
                                        },
                                        child: Container(
                                          height: height * .001,
                                          width: width * .44,
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
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: width * .012),
                                            child: Center(
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: height * .02,
                                                  ),
                                                  Image.asset(
                                                      'images/${i + 1}.png'),
                                                  SizedBox(
                                                    height: height * .02,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      text(
                                                          items[i],
                                                          15,
                                                          0xFF000000,
                                                          FontWeight.w500,
                                                          FontStyle.normal,
                                                          0),
                                                      SizedBox(
                                                        height: height * .02,
                                                      ),
                                                      text(
                                                          "$i devices",
                                                          12,
                                                          0xffB1B0B0,
                                                          FontWeight.w500,
                                                          FontStyle.normal,
                                                          0.0008),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 1,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 15,
                                  ),
                                ));
                              }
                              return Column(
                                children: children,
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * .54,
            ),
          ]),
        ),
      ),
    );
  }
}
