import 'package:filling_slider/filling_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcreen/Models/datatype.dart';
import 'package:provider/provider.dart';

Widget text(String text, double size, int color, FontWeight weight,
    FontStyle style, double height) {
  return Text(
    text,
    style: GoogleFonts.poppins(
      height: height,
      color: Color(color),
      fontSize: size,
      fontWeight: weight,
      fontStyle: style,
    ),
  );
}

class StyledSwitch extends StatefulWidget {
  final void Function(bool isToggled) onToggled;

  const StyledSwitch({Key? key, required this.onToggled}) : super(key: key);

  @override
  State<StyledSwitch> createState() => _StyledSwitchState();
}

bool click = false;
bool click2 = false;
int value = 0;

class _StyledSwitchState extends State<StyledSwitch> {
  bool isToggled = false;
  double size = 15;
  double innerPadding = 0;

  @override
  void initState() {
    innerPadding = size / 10;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => isToggled = !isToggled);
        widget.onToggled(isToggled);
      },
      onPanEnd: (b) {
        setState(() => isToggled = !isToggled);
        widget.onToggled(isToggled);
      },
      child: AnimatedContainer(
        height: size,
        width: size * 2,
        padding: EdgeInsets.all(innerPadding),
        alignment: isToggled ? Alignment.centerLeft : Alignment.centerRight,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isToggled ? Color(0xffF5F5F5) : Color(0xffD7E1FF),
        ),
        child: Container(
          width: size - innerPadding * 2,
          height: size - innerPadding * 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: isToggled ? Color(0xffB1B0B0) : Color(0xff7B9AF8),
          ),
        ),
      ),
    );
  }
}

Widget slider() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FillingSlider(
            color: Color(0xff7B9AF8),
            fillColor: Color(0xffF5F5F5),
            initialValue: 0.5,
            width: 150,
            height: 32,
            direction: FillingSliderDirection.horizontal,
            childBuilder: (ctx, value) => AnimatedSwitcher(
                  layoutBuilder:
                      (Widget? currentChild, List<Widget> previousChildren) {
                    return currentChild!;
                  },
                  duration: Duration(seconds: 1),
                  child: SizedBox(),
                )),
      ],
    ),
  );
}

class CountFan extends StatefulWidget {
  const CountFan({super.key});

  @override
  State<CountFan> createState() => _CountFanState();
}

class _CountFanState extends State<CountFan> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          height: height * .08,
          width: width * .08,
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                value--;
                click = true;
                click2 = false;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: height * .02),
              child: Icon(Icons.minimize, color: Colors.black),
            ),
            backgroundColor:
                click == true ? Color(0xff7B9AF8) : Color(0xffF5F5F5),
          ),
        ),
        Text(
          '${value}°',
          style: TextStyle(fontSize: 18.0),
        ),
        Container(
          height: height * .08,
          width: width * .08,
          child: FloatingActionButton(
            child: Icon(Icons.add, color: Colors.black87),
            backgroundColor:
                click2 == true ? Color(0xff7B9AF8) : Color(0xffF5F5F5),
            onPressed: () {
              setState(() {
                value++;
                click2 = true;
                click = false;
              });
            },
          ),
        ),
      ],
    );
  }
}
