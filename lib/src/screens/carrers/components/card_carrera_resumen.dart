import 'package:flutter/material.dart';

class cardCarrerResumen extends StatelessWidget {
  const cardCarrerResumen({
    super.key,
    required this.status,
    required this.width,
    required this.height,
    required this.cliente,
    required this.cod_cliente,
  });

  final double width;
  final double height;
  final bool status;
  final String cliente;
  final String cod_cliente;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 25),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          //set border radius more than 50% of height and width to make circle
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            //border: Border.all(color: Colors.grey, width: 1.0),
          ),
          width: width,
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cod_cliente,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: status ? Colors.green : Colors.red),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          color: status
                              ? Colors.green.withOpacity(0.1)
                              : Colors.red.withOpacity(0.1)),
                      height: height * 0.3,
                      width: width * 0.12,
                      child: status
                          ? const Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.close,
                              color: Colors.red,
                            ))
                ],
              ),
              Text(
                cliente,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              SizedBox(
                height: height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
