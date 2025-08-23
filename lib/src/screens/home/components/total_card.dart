import 'package:app_taxis/src/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalCard extends StatelessWidget {
  TotalCard(
      {super.key,
      this.onClick,
      this.icon = Icons.bar_chart_sharp,
      this.textColor = Colors.black,
      required this.title,
      this.totalValue = "",
      required this.backgroundColor,
      required this.width,
      required this.height});
  final Function? onClick;
  final String title;
  final String totalValue;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color textColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 5),
      // color: Colors.grey.shade200,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15.0),
        color: backgroundColor,
        //backgroundBlendMode: BlendMode.darken,
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: textColor,
            size: Get.width < 370 ? 25 : 30,
          ),
          Text(
            totalValue.toString(),
            // textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: Get.width < 370 ? 19 : 24,
                fontWeight: FontWeight.bold,
                color: textColor),
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: Get.width < 370 ? 12 : 15.5,
                fontWeight: FontWeight.bold,
                color: textColor),
            // textAlign: TextAlign.center,
          ),
          IconButton(
            onPressed: onClick != null ? () => onClick!() : null,
            icon: Icon(
              Icons.navigate_next_outlined,
              //color: ColorsApp.lightGreen,
              size: Get.width < 370 ? 25 : 30,
            ),
          )
        ],
      ),
    );
  }
}
