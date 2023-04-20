// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:lsm_utt_app/services/firebase_services.dart';

// class RegistrationPage extends StatefulWidget {
//   const RegistrationPage({Key? key}) : super(key: key);

//   @override
//   State<RegistrationPage> createState() => _RegistrationPageState();
// }

// class _RegistrationPageState extends State<RegistrationPage> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   bool _isObscured = true;
//   IconData _iconVisibility = Icons.visibility_off;

//   Future<void> _login() async {
//     final String user = _usernameController.text.trim();
//     final String password = _passwordController.text.trim();

//     if (_formKey.currentState!.validate()) {
//       try {} on FirebaseException catch (e) {
//         if (e.code == 'user-not-found') {
//           print('El correo no existe.');
//         } else if (e.code == 'wrong-password') {
//           print('La contraseña tiene que incluir 6 caracteres');
//         } else {
//           print('Error: $e');
//         }
//       }
//     }
//   }

//   void _toggleObscure() {
//     setState(() {
//       _isObscured = !_isObscured;
//       _iconVisibility = _isObscured ? Icons.visibility_off : Icons.visibility;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.purple,
//         title: const Text('Regístrate'),
//       ),
//       body: Column(
//         children: [
//           const CircleAvatar(
//             backgroundImage: AssetImage('assets/img/logo.png'),
//             radius: 120,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextFormField(
//                     controller: _usernameController,
//                     decoration: InputDecoration(
//                       hintText: 'E-mail',
//                       suffixIcon: Icon(Icons.email_outlined),
//                     ),
//                     validator: (String? value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Introduce un Correo válido.';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16.0),
//                   TextFormField(
//                     controller: _passwordController,
//                     obscureText: _isObscured,
//                     decoration: InputDecoration(
//                       hintText: 'Contraseña',
//                       suffixIcon: IconButton(
//                         onPressed: _toggleObscure,
//                         icon: Icon(_iconVisibility),
//                       ),
//                     ),
//                     validator: (String? value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Introduce una contraseña válida.';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 32.0),
//                   ElevatedButton(
//                     onPressed: () async {
//                       await _login(); // Autenticar al usuario primero
//                       if (_usernameController.text.isEmpty ||
//                           _passwordController.text.isEmpty) {
//                         return; // No continuar si falta alguna entrada
//                       }
//                       await addUsers(_usernameController.text,
//                               _passwordController.text)
//                           .then((value) {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) =>
//                                   const RegistrationPage()), // Redirigir al usuario a la página de registro
//                         );
//                       });
//                       _usernameController.clear();
//                       _passwordController.clear();
//                     },
//                     child: const Text('Crear cuenta'),
//                     style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStateProperty.all(Colors.purple)),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// // import 'package:flutter/material.dart';
// // import 'package:lsm_utt_app/services/firebase_services.dart';

// // class RegistrationPage extends StatefulWidget {
// //   @override
// //   _RegistrationPageState createState() => _RegistrationPageState();
// // }

// // class _RegistrationPageState extends State<RegistrationPage> {
// //   final TextEditingController _usernameController =
// //       TextEditingController(text: '');
// //   final TextEditingController _passwordController =
// //       TextEditingController(text: '');

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Registrate'),
// //       ),
// //       body: Center(
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               TextField(
// //                 controller: _usernameController,
// //                 decoration: const InputDecoration(
// //                   labelText: 'Nombre de Usuario',
// //                 ),
// //               ),
// //               const SizedBox(height: 16.0),
// //               TextField(
// //                 controller: _passwordController,
// //                 obscureText: true,
// //                 decoration: const InputDecoration(
// //                   labelText: 'Contraseña',
// //                 ),
// //               ),
// //               const SizedBox(height: 16.0),
// //               ElevatedButton(
// //                 onPressed: () async {
// //                   //TODO: add registration logic here
// //                   await addUsers(
// //                           _usernameController.text, _passwordController.text)
// //                       .then((value) {
// //                     Navigator.pop(context);
// //                   });
// //                   _usernameController.clear();
// //                   _passwordController.clear();
// //                 },
// //                 child: const Text('Crear Cuenta'),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
