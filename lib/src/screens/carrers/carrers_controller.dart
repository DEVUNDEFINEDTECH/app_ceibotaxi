import 'package:app_taxis/src/data/models/carrera_model.dart';
import 'package:app_taxis/src/data/services/carrers_service.dart';
import 'package:app_taxis/src/global_memory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarrersController extends GetxController {
  GlobalMemory gm = Get.find<GlobalMemory>();

  @override
  void onReady() async {
    getCarreras();
    super.onReady();
  }

  Future<void> getCarreras() async {
    print("");
    final carreras = await CarrersService.getCarrersPending(gm.getUnity()!.id);
    if (carreras!.isNotEmpty) {
      print(
          'Cargando.... ${carreras[0].direccion}  vienen ${carreras.length} datos');
    }

    gm.carreraActiva.value = carreras;
  }

  Future<void> refreshData() async {
    await getCarreras();
    List<Carrera>? carrersList =
        await CarrersService.getCarrers(gm.getUnity()!.id);
    gm.carreras.value = carrersList!;
  }

  Future<void> finishCarrera(int idcarrera, int index) async {
    final id_user = gm.user!.idusuario;
    final id_unidad = gm.unity!.id;

    final confirmed = await Get.defaultDialog<bool>(
      title: 'Confirmación',
      content:
          const Text('¿Estás seguro de que deseas finalizar esta carrera?'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.back(result: true); // Confirma la eliminación
          },
          child: const Text('Finalizar'),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back(result: false); // Cancela la eliminación
          },
          child: const Text('Cancelar'),
        ),
      ],
    );

    if (confirmed == true) {
      // El usuario confirmó la eliminación, procede con el proceso.
      await Future.delayed(const Duration(seconds: 2));

      CarrersService.finalizarCarrera(idcarrera, id_unidad.toString());
      gm.carreraActiva.removeAt(index);

      print(
          "Eliminar carrera $idcarrera Usuario que elimina: $id_user idunidad $id_unidad");
    } else {
      // El usuario canceló la eliminación, no hagas nada.
      print("Cancelada eliminación de carrera $idcarrera");
    }
  }
}
