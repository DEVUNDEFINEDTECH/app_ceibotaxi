import 'package:app_taxis/src/screens/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image(
                  image: const AssetImage('assets/images/logo_rtsg.png'),
                  height: height * 0.2,
                  width: height * 0.6,
                ),
                const Center(
                  child: Text(
                    'RTSG',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.black,
                        fontFamily: 'Roboto'),
                  ),
                ),
                SizedBox(height: height * 0.03),
                const Center(
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                SizedBox(height: height * 0.03),
                const Center(
                  child: Text(
                    "Inicia Sesión con tu correo electrónico",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(height: height * 0.03),
                TextFormField(
                  controller: controller.userNameController,
                  decoration: InputDecoration(
                    labelText: 'Correo Electrónico',
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  style: const TextStyle(fontSize: 15),
                  cursorColor: Colors.grey,
                ),
                SizedBox(height: height * 0.03),
                TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  obscureText: true,
                  style: const TextStyle(fontSize: 15),
                  cursorColor: Colors.grey,
                ),
                SizedBox(height: height * 0.06),
                Obx(() {
                  return ElevatedButton(
                    onPressed: () => {controller.login()},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : const Text(
                            'Iniciar Sesión',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                  );
                }),
                const SizedBox(height: 16),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Desarrollado por UndefinedTech",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
