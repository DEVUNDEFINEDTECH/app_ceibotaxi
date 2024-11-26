import 'package:app_taxis/src/data/models/base_model.dart';
import 'package:app_taxis/src/global_memory.dart';
import 'package:app_taxis/src/screens/home/home_controller.dart';
import 'package:app_taxis/src/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasesDetailPage extends StatelessWidget {
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
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.navigate_before_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Center(
                    child: Text(
                  "Bases",
                  style: TextStyle(fontSize: 25),
                ))
              ],
            ),
            Expanded(
              //height: height * 0.5,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: gm.bases.length,
                itemBuilder: (context, index) {
                  final Base base = gm.bases[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                    height: height * 0.17,
                    width: width,
                    child: Card(
                      elevation: 4,
                      shadowColor: Colors.grey[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(width * 0.04),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Base ${base.nombre ?? ""}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const Icon(
                                  Icons.gps_fixed_outlined,
                                  color: ColorsApp.lightGreen,
                                )
                              ],
                            ),
                            Text(
                              overflow: TextOverflow.ellipsis,
                              "Lim1 :${base.prlimite}",
                              style: const TextStyle(color: Colors.grey),
                            ),
                            Text(
                                overflow: TextOverflow.ellipsis,
                                "Lim2 :${base.selimite}",
                                style: const TextStyle(color: Colors.grey)),
                            Text(
                                overflow: TextOverflow.ellipsis,
                                "Lim3 :${base.telimite}",
                                style: const TextStyle(color: Colors.grey)),
                            Text(
                                overflow: TextOverflow.ellipsis,
                                "Lim4 :${base.culimite}",
                                style: const TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
