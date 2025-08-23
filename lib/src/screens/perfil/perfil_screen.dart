import 'package:app_taxis/src/data/services/socket_servicer.dart';
import 'package:app_taxis/src/global_memory.dart';
import 'package:app_taxis/src/routes/app_pages.dart';
import 'package:app_taxis/src/screens/dashboard/driver/dashboard_controller.dart';
import 'package:app_taxis/src/screens/home/components/total_card.dart';
import 'package:app_taxis/src/screens/perfil/perfil_controller.dart';
import 'package:app_taxis/src/config/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PerfilScreen extends GetView<PerfilController> {
  final DashboardDriverController dashboardController =
      Get.put(DashboardDriverController());
  List<String> listGenderText = ["10-8", "10-7"];
  RxBool tabTextIconIndexSelected = true.obs;
  SocketsService socketService = SocketsService();
  PerfilScreen({super.key});
  void toggleTracking() {
    dashboardController.isTracking.value =
        !dashboardController.isTracking.value;
    socketService.startLocationTracking(
        tracking: dashboardController.isTracking.value);
  }

  void confirmTrackingToggle() {
    final enable = !dashboardController.isTracking.value;

    Get.dialog(
      AlertDialog(
        title: Text(
            enable ? 'Activar seguimiento 501' : 'Desactivar seguimiento 501'),
        content: Text(enable
            ? '¿Estás seguro que quieres activar el seguimiento detallado? Esto consumirá más batería y datos.'
            : '¿Deseas detener el seguimiento detallado?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(), // Cierra el diálogo sin hacer nada
            child: Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back(); // Cierra el diálogo
              toggleTracking(); // Cambia el estado
            },
            child: Text('Confirmar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> nombres = GlobalMemory.to.user!.nombresUsuario.split(' ');
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Center(
          child: Text(
            'Mi Perfil',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              // color: ColorsApp.kPrimaryColor,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: height * 0.07,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: Row(
                    children: [
                      const CircleAvatar(
                          backgroundColor: ColorsApp.lightGreen,
                          child: Icon(
                            Icons.notifications,
                            color: Colors.white,
                          )),
                      const Expanded(child: Text("")),
                      const Text(
                        "10-7",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Obx(() => CupertinoSwitch(
                            // This bool value toggles the switch.
                            value: tabTextIconIndexSelected.value,
                            activeColor: ColorsApp.lightGreen,
                            onChanged: (bool value) {
                              if (value) {
                                socketService.connectSocket();
                                socketService.startLocationTracking();
                                dashboardController.enableNotifications();
                                notificationService.showNotification(
                                    '10-8', 'Bienvenido al martillo');
                              } else {
                                socketService.disconnectSocket();
                                dashboardController.enableNotifications();
                              }
                              tabTextIconIndexSelected.value =
                                  !tabTextIconIndexSelected.value;
                            },
                          )),
                      const Text(
                        "10-8",
                        style: TextStyle(
                            color: ColorsApp.lightGreen,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              Card(
                  elevation: 2,
                  shadowColor: Colors.grey[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: height * 0.14,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: height * 0.04,
                          backgroundImage: const AssetImage(
                              "assets/images/avatar_driver.png"),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                //softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                '${nombres[2]} ${nombres[0]} ${nombres[1]}',
                                style: TextStyle(
                                    fontSize: Get.width < 370 ? 12 : 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  overflow: TextOverflow.ellipsis,
                                  GlobalMemory.to.user!.usuario,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 14)),
                              Text(GlobalMemory.to.user!.cedula.toString(),
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.grey)),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.phone_outlined,
                                    size: 16,
                                  ),
                                  Text(
                                      GlobalMemory.to.user!.celular ??
                                          "Sin Celular",
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 14)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                            backgroundColor: ColorsApp.lightGreen,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                onPressed: () {
                                  //Get.toNamed(Routes.USER);
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: ColorsApp.lightGreen,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 13,
              ),
              Card(
                  elevation: 2,
                  shadowColor: Colors.grey[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: height * 0.15,
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Text(
                              "  Mi unidad",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Expanded(child: Text("")),
                            CircleAvatar(
                              backgroundColor: ColorsApp.lightGreen,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.edit,
                                  color: ColorsApp.lightGreen,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: height * 0.07,
                              width: width * 0.25,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15))),
                              child: const Icon(
                                Icons.local_taxi,
                                size: 35,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    overflow: TextOverflow.ellipsis,
                                    'Disco # ${GlobalMemory.to.unity!.numerounidad.toString()}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    overflow: TextOverflow.ellipsis,
                                    '${GlobalMemory.to.unity!.marca} ${GlobalMemory.to.unity!.modelo} - ${GlobalMemory.to.unity!.anovehiculo}',
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                  Text(GlobalMemory.to.unity!.placa,
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 14)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              const SizedBox(height: 20),
              const Text(
                "  ENLACES RÁPIDOS",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              TotalCard(
                  title: "Analítica",
                  backgroundColor: Colors.white,
                  width: width,
                  height: height * 0.07,
                  onClick: () {
                    Get.toNamed(Routes.ANALITYCDETAIL);
                  }),
              TotalCard(
                icon: Icons.add_location_alt_outlined,
                title: "Bases",
                backgroundColor: Colors.white,
                width: width,
                height: height * 0.07,
                onClick: () {
                  Get.toNamed(Routes.BASESDETAIL);
                },
              ),
              Obx(() {
                final trackingActive = dashboardController.isTracking.value;

                return TotalCard(
                  icon: trackingActive ? Icons.gps_fixed : Icons.gps_not_fixed,
                  title: trackingActive ? "501 activo" : "Solicitar 501",
                  backgroundColor: Colors.white,
                  width: width,
                  height: height * 0.07,
                  onClick: confirmTrackingToggle,
                  textColor: trackingActive
                      ? Colors.red
                      : Colors.black, // Color del icono
                );
              }),
              TotalCard(
                icon: Icons.wallet_outlined,
                title: "Mis Pagos (Frecuencias)",
                backgroundColor: Colors.white,
                width: width,
                height: height * 0.07,
                onClick: () {
                  Get.toNamed(Routes.PAYMENT);
                },
              ),
              SizedBox(
                width: width,
                child: TextButton(
                  onPressed: () {
                    GlobalMemory.to.logout();
                  },
                  child: const Row(
                    children: [
                      Expanded(child: Text("")),
                      Icon(
                        Icons.logout_outlined,
                        color: Colors.red,
                      ),
                      Text(
                        'Cerrar Sesión',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      ),
                      Expanded(child: Text("")),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
