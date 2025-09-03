import 'package:app_taxis/src/config/theme.dart';
import 'package:app_taxis/src/routes/app_pages.dart';
import 'package:app_taxis/src/screens/payment/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverPaymentScreen extends GetView<PaymentController> {
  const DriverPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis pagos (Frecuencias)'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Sección "Por pagar"
            _totalPayment(),

            _buildPaymentItem(
              'Ene 2024 / Semana 3',
              '15 al 21 de Paralume',
              '\$13.80',
              '\$13.80',
            ),
            SizedBox(height: 16),
            _buildPaymentItem(
              'Feb 2024 / Semana 1',
              '23 ante el 04 del Paralume',
              '\$13.80',
              '\$10.00',
            ),
            // Total y botón de pago
            Expanded(child: SizedBox()),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.REGISTERPAYMENT);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: const Color(0xFF4CD080), // Color verde oscuro
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 10),
                    const Text(
                      '\$23.80 USD',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Expanded(child: SizedBox()),
                    const Text(
                      'Pagar',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentItem(
      String title, String date, String amount1, String amount2) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F6F8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Columna de texto
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      date,
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Pendiente',
                      style: TextStyle(fontSize: 12, color: Colors.pinkAccent),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      amount1,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Row(
                        children: [
                          Icon(Icons.photo_camera, size: 16),
                          SizedBox(width: 4),
                          Text(
                            amount2,
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          // Checkbox con GetX
          Checkbox(
            activeColor: ColorsApp.lightGreen,
            checkColor: Colors.white,
            value: true,
            onChanged: (val) {
              //item.isChecked.value = val!;
            },
          )
        ],
      ),
    );
  }
}

class _totalPayment extends StatelessWidget {
  const _totalPayment();

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF84D9A3), // Color verde suave
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Sección izquierda
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Por pagar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 4),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '\$27.60 ',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: 'USD',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Sección derecha
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Frecuencias pagadas',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 6),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF34A853), // verde oscuro
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                child: const Text('Mis pagos'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
