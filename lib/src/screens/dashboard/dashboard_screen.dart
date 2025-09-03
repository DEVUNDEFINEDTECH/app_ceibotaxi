import 'package:app_taxis/src/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:app_taxis/src/screens/carrers/carrers_screen.dart';
import 'package:app_taxis/src/screens/dashboard/dashboard_controller.dart';
import 'package:app_taxis/src/screens/home/home_screen.dart';
import 'package:app_taxis/src/screens/perfil/perfil_screen.dart';

class DashboardScreen extends GetView<DashboardController> {
  DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: SafeArea(child: _buildTabContent()),
          bottomNavigationBar: _buildBottomNavigationBar(),
        ));
  }

  Widget _buildTabContent() {
    switch (controller.tabIndex.value) {
      case 0:
        return HomeScreen();
      case 1:
        return CarrersScreen();
      case 2:
        return PerfilScreen();

      case 3:
        return const Center(child: Text("Wallet"));
      default:
        return Container();
    }
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        //color: ColorsApp.lightGreen,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50),
        ),
      ),
      child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(10),
          ),
          child: GNav(
            //rippleColor: Colors.grey[300]!,
            hoverColor: ColorsApp.lightGreen,
            gap: 4,
            //activeColor: ColorsApp.kPrimaryColor,
            iconSize: 30,
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 12),
            duration: const Duration(milliseconds: 400),
            // tabBackgroundColor: Colors.white,
            color: Colors.black54,
            activeColor: ColorsApp.lightGreen,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Inicio",
              ),
              GButton(icon: Icons.local_taxi, text: "Carreras"),
              //GButton(icon: Icons.notifications, text: "Notificaciones"),
              GButton(
                icon: Icons.person_2,
                text: "Mi perfil",
              )
            ],
            selectedIndex: controller.tabIndex.value,
            onTabChange: (index) {
              controller.tabIndex.value = index;
            },
          )),
    );
  }
}
