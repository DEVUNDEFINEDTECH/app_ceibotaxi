import 'package:app_taxis/src/global_memory.dart';
import 'package:app_taxis/src/routes/app_pages.dart';
import 'package:app_taxis/src/screens/home/components/graphic.dart';
import 'package:app_taxis/src/screens/home/home_controller.dart';
import 'package:app_taxis/src/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnalyticsDetailPage extends StatelessWidget {
  GlobalMemory gm = Get.find<GlobalMemory>();
  HomeController hc = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(width * 0.05),
                  decoration: const BoxDecoration(
                      color: ColorsApp.lightGreen,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  height: height * 0.05,
                  width: height * 0.05,
                  child: IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.DASHBOARD);
                    },
                    icon: const Icon(Icons.navigate_before_outlined),
                  ),
                ),
                const Center(
                    child: Text(
                  "Bases",
                  style: TextStyle(fontSize: 25),
                ))
              ],
            ),
            const MyBarChart(),
          ],
        ),
      ),
    );
  }
}
