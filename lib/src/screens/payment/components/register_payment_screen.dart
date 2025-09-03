import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPaymentScreen extends StatefulWidget {
  const RegisterPaymentScreen({super.key});

  @override
  State<RegisterPaymentScreen> createState() => _RegisterPaymentScreenState();
}

class _RegisterPaymentScreenState extends State<RegisterPaymentScreen> {
  String? tipoPago;
  String? institucion;
  final TextEditingController comprobanteCtrl = TextEditingController();
  final TextEditingController fechaCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text("Registrar pago"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total a pagar
            Center(
              child: Column(
                children: [
                  const Text("Total a pagar"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "\$27.60",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.info_outline, size: 18),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Tipo de pago
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "Tipo de pago",
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                    value: "transferencia", child: Text("Transferencia")),
                DropdownMenuItem(value: "deposito", child: Text("Depósito")),
              ],
              onChanged: (value) => setState(() => tipoPago = value),
            ),
            const SizedBox(height: 12),

            // Institución financiera
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "Institución financiera",
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                    value: "pichincha", child: Text("Banco Pichincha")),
                DropdownMenuItem(
                    value: "guayaquil", child: Text("Banco Guayaquil")),
              ],
              onChanged: (value) => setState(() => institucion = value),
            ),
            const SizedBox(height: 12),

            // Número de comprobante
            TextFormField(
              controller: comprobanteCtrl,
              decoration: const InputDecoration(
                labelText: "Número de comprobante",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // Fecha del pago
            TextFormField(
              controller: fechaCtrl,
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Fecha del pago",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2100),
                      initialDate: DateTime.now(),
                    );
                    if (picked != null) {
                      fechaCtrl.text =
                          "${picked.day}/${picked.month}/${picked.year}";
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Subir comprobante
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    decoration: const InputDecoration(
                      hintText: "24_02_2024_pago.jpg",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.add_circle, color: Colors.green),
                  onPressed: () {
                    // TODO: lógica para subir archivo
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Vista previa del comprobante
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                "assets/images/pago.png", // tu comprobante aquí
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 24),

            // Botón enviar
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // lógica para enviar
                },
                child: const Text(
                  "Enviar",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
