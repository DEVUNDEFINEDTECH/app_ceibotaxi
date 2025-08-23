import 'package:app_taxis/src/screens/payment/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentsScreen extends GetView<PaymentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mis pagos (Frecuencias)"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }

        if (controller.payments.isEmpty) {
          return Center(child: Text("No hay pagos disponibles."));
        }

        double totalToPay = controller.payments.fold(
          0,
          (sum, p) => sum + ((p.saldo as num?) ?? 0),
        );

        return Column(
          children: [
            // Header
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.green[50],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Por pagar', style: TextStyle(color: Colors.green)),
                      Text(
                        '\$${totalToPay.toStringAsFixed(2)} USD',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Mis pagos'),
                  )
                ],
              ),
            ),

            // Lista de pagos
            Expanded(
              child: ListView.builder(
                itemCount: controller.payments.length,
                itemBuilder: (context, index) {
                  final payment = controller.payments[index];
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      leading: Checkbox(
                        value: true,
                        onChanged: (val) {},
                        activeColor: Colors.green,
                      ),
                      title:
                          Text("${payment.fechaDeuda} ${payment.fechaDeuda}"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${payment.fechaDeuda} - ${payment.fechaDeuda}",
                              style: TextStyle(color: Colors.red)),
                          SizedBox(height: 4),
                          Text(
                              "\$${payment.deuda != null ? payment.deuda : '0.00'}"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Footer
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.green[50],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${totalToPay.toStringAsFixed(2)} USD',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Pagar'),
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
