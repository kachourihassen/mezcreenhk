import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcreen/Models/datatype.dart';
import 'package:mezcreen/Views/MyRoom.dart';
import 'package:mezcreen/Views/Widgets.dart';
import 'package:mezcreen/main.dart';

displayAddDialog(
    BuildContext context, String image, String title, List<String> list) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (BuildContext context, setState) {
          return Container(
            child: Dialog(
                backgroundColor: Colors.transparent,
                insetPadding: EdgeInsets.zero,
                child: Container(
                  height: MediaQuery.of(context).size.height * .53,
                  width: MediaQuery.of(context).size.width * .95,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                            Image.asset(
                              image,
                            ),
                            Center(
                              child: text(title, 24, 0xFF000000,
                                  FontWeight.w500, FontStyle.normal, 0),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: MediaQuery.of(context).size.width *
                                          .72),
                                  child: text("Name", 15, 0xFF000000,
                                      FontWeight.w500, FontStyle.normal, 0),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .01,
                                ),
                                Center(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    child: TextFormField(
                                      // ignore: unnecessary_new
                                      decoration: new InputDecoration(
                                        hintText: 'Name',
                                        fillColor: Colors.grey,
                                        focusColor: Colors.grey,
                                        hintStyle: GoogleFonts.poppins(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.036),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            vertical: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.017),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                              color: Color(0xFFD6D6E8),
                                            )),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Color(0xff4048FF))),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: MediaQuery.of(context).size.width *
                                          .72),
                                  child: text("Type", 15, 0xFF000000,
                                      FontWeight.w500, FontStyle.normal, 0),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .01,
                                ),
                                Center(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    child: DropdownButtonFormField<String>(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          focusColor: Colors.white,
                                          hoverColor: Colors.white,
                                          filled: true,
                                          isDense: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.012,
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.033),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5))),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(5),
                                              borderSide: BorderSide(color: Colors.grey.withOpacity(0.5))),
                                          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: Colors.red)),
                                          focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: Colors.red))),
                                      hint: text(
                                          'Select your room type',
                                          15,
                                          0xff000000,
                                          FontWeight.w500,
                                          FontStyle.normal,
                                          0),
                                      isExpanded: true,
                                      isDense: true,
                                      iconSize: 30.0,
                                      style: GoogleFonts.poppins(
                                          color: Color(0Xff000000),
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.033,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal),
                                      items: list.map((item) {
                                        return DropdownMenuItem(
                                          value: item,
                                          child: Text(item),
                                        );
                                      }).toList(),
                                      validator: (value) =>
                                          value?.isEmpty ?? true
                                              ? 'Cannot Empty'
                                              : null,
                                      onChanged: (selectedItem) => setState(
                                        () {},
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                ElevatedButton(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.34,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.34,
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                        bottom:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                    child: text("Add ", 15, 0xffffffff,
                                        FontWeight.w500, FontStyle.normal, 0),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color(0xFF7B9AF8),
                                    ),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          );
        });
      });
}

displaySelectRoomDialog(BuildContext context, String Rname, String Rtitle,
    String Rkey, dynamic Rvalue, String image, bool verif) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (BuildContext context, setState) {
          return Container(
            child: Dialog(
                backgroundColor: Colors.transparent,
                insetPadding: EdgeInsets.zero,
                child: Container(
                  height: verif == true
                      ? MediaQuery.of(context).size.height * .57
                      : MediaQuery.of(context).size.height * .4,
                  width: MediaQuery.of(context).size.width * .95,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                            Image.asset(
                              image,
                            ),
                            Center(
                              child: text(Rtitle, 24, 0xFF000000,
                                  FontWeight.w500, FontStyle.normal, 0),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: MediaQuery.of(context).size.width *
                                          .72),
                                  child: text("Name", 15, 0xFF000000,
                                      FontWeight.w500, FontStyle.normal, 0),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .01,
                                ),
                                Center(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    child: TextFormField(
                                      // ignore: unnecessary_new
                                      decoration: new InputDecoration(
                                        hintText: Rname != "" ? Rname : 'Name',
                                        fillColor: Colors.grey,
                                        focusColor: Colors.grey,
                                        hintStyle: GoogleFonts.poppins(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.036),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            vertical: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.017),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                              color: Color(0xFFD6D6E8),
                                            )),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Color(0xff4048FF))),
                                      ),
                                    ),
                                  ),
                                ),
                                verif
                                    ? SizedBox(
                                        height: 15,
                                      )
                                    : SizedBox(),
                                verif
                                    ? Padding(
                                        padding: EdgeInsets.only(
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .72),
                                        child: text(
                                            "Type",
                                            15,
                                            0xFF000000,
                                            FontWeight.w500,
                                            FontStyle.normal,
                                            0),
                                      )
                                    : SizedBox(),
                                verif
                                    ? SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .01,
                                      )
                                    : SizedBox(),
                                verif
                                    ? Center(
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.85,
                                          child:
                                              DropdownButtonFormField<String>(
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            //value: Rvalue,
                                            decoration: InputDecoration(
                                                fillColor: Colors.white,
                                                focusColor: Colors.white,
                                                hoverColor: Colors.white,
                                                filled: true,
                                                isDense: true,
                                                contentPadding: EdgeInsets.symmetric(
                                                    vertical: MediaQuery.of(context).size.height *
                                                        0.012,
                                                    horizontal:
                                                        MediaQuery.of(context).size.width *
                                                            0.033),
                                                enabledBorder: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    borderSide: BorderSide(
                                                        color: Colors.grey
                                                            .withOpacity(0.5))),
                                                focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(5),
                                                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5))),
                                                errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: Colors.red)),
                                                focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: Colors.red))),
                                            hint: text(
                                                'Select your room type',
                                                15,
                                                0xff000000,
                                                FontWeight.w500,
                                                FontStyle.normal,
                                                0),
                                            isExpanded: true,
                                            isDense: true,
                                            iconSize: 30.0,
                                            style: GoogleFonts.poppins(
                                                color: Color(0Xff000000),
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.033,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.normal),
                                            items: tpGroup.map((item) {
                                              return DropdownMenuItem(
                                                value: item,
                                                child: Text(item),
                                              );
                                            }).toList(),
                                            validator: (value) =>
                                                value?.isEmpty ?? true
                                                    ? 'Cannot Empty'
                                                    : null,
                                            onChanged: (selectedItem) =>
                                                setState(
                                              () {},
                                            ),
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                                SizedBox(
                                  height: 30,
                                ),
                                ElevatedButton(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.34,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.34,
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                        bottom:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                    child: text("Save ", 15, 0xffffffff,
                                        FontWeight.w500, FontStyle.normal, 0),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      verif == false
                                          ? Navigator.pop(context)
                                          : Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) => MyRoom(
                                                  roomKey: Rkey,
                                                  roomValue: Rvalue,
                                                ),
                                              ),
                                            );
                                    });
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color(0xFF7B9AF8),
                                    ),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () => setState(() {
                                    Navigator.of(context).pop();
                                  }),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Spacer(),
                                        Image.asset("images/Delete.png"),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .02,
                                        ),
                                        text(
                                            "Delete",
                                            15,
                                            0xffff0000,
                                            FontWeight.w500,
                                            FontStyle.normal,
                                            0),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          );
        });
      });
}
