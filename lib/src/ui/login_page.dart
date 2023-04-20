// import 'dart:async';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool loginError = false;
//   bool passwordVisible = true;
//   String loginErrorMessage = '';
//   bool showSnackBar = false;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<void> _signInWithEmailAndPassword() async {
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: _usernameController.text,
//         password: _passwordController.text,
//       );
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => Sing(),
//         ),
//       );
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found' || e.code == 'wrong-password') {
//         setState(() {
//           loginError = true;
//           loginErrorMessage = "E-mail o contraseña incorrectos";
//         });
//       }
//       // Si hay error en el login, muestra un SnackBar después de 3 segundos
//       await Future.delayed(const Duration(seconds: 3), () {
//         if (showSnackBar) {
//           ScaffoldMessenger.of(context).removeCurrentSnackBar();
//         }
//         showSnackBar = true;
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(loginErrorMessage),
//             duration: const Duration(seconds: 2),
//             action: SnackBarAction(
//               label: 'Reintentar',
//               onPressed: () {
//                 setState(() {
//                   loginError = false;
//                   showSnackBar = false;
//                 });
//               },
//             ),
//           ),
//         );
//       });
//     } catch (e) {
//       print('ERROR......' + e.toString());
//     }
//   }

//   void singIn() {
//     Get.showOverlay(asyncFunction: () async {
//       try {
//         await const AuthFirebase().singInWithEmail(
//           _usernameController.text.trim(),
//           _passwordController.text,
//         );
//         Get.offNamed('/Sing');
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'user-not-found' || e.code == 'wrong-password') {
//           setState(() {
//             loginError = true;
//             loginErrorMessage = "E-mail o contraseña incorrectos";
//           });
//         }
//       }
//     });
//   }

//   Future<void> validarDatos() async {
//     try {
//       CollectionReference vali =
//           FirebaseFirestore.instance.collection('usuarios');
//       QuerySnapshot usuario = await vali.get();
//       bool foundUser = false;
//       for (var cursor in usuario.docs) {
//         if (cursor.get('name') == _usernameController.text) {
//           foundUser = true;
//           if (cursor.get('password') == _passwordController.text) {
//             print('Acceso encontrado');
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Sing(),
//               ),
//             );
//           } else {
//             setState(() {
//               loginError = true;
//               loginErrorMessage = "La contraseña es incorrecta.";
//             });
//           }
//           break;
//         }
//       }
//       if (!foundUser) {
//         setState(() {
//           loginError = true;
//           loginErrorMessage = "Verifique sus campos";
//         });
//       }
//       // Si hay error en el login, muestra un SnackBar después de 3 segundos
//       if (loginError) {
//         await Future.delayed(const Duration(seconds: 3), () {
//           if (showSnackBar) {
//             ScaffoldMessenger.of(context).removeCurrentSnackBar();
//           }
//           showSnackBar = true;
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(loginErrorMessage),
//               duration: const Duration(seconds: 2),
//               action: SnackBarAction(
//                 label: 'Reintentar',
//                 onPressed: () {
//                   setState(() {
//                     loginError = false;
//                     showSnackBar = false;
//                   });
//                 },
//               ),
//             ),
//           );
//         });
//       }
//     } catch (e) {
//       print('ERROR......' + e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.purple,
//         centerTitle: false,
//         title: Text('Iniciar Sesión'),
//       ),
//       body: Column(
//         children: [
//           const CircleAvatar(
//             backgroundImage: AssetImage('assets/img/logo.png'),
//             radius: 120,
//           ),
//           // ajusta la altura de la imagen según tus necesidades
//           // child: Image.asset(pathimage :'assets/img/logo.jpeg',
//           // fit: BoxFit.cover,
//           Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextField(
//                   controller: _usernameController,
//                   decoration: const InputDecoration(
//                     hintText: 'E-mail',
//                     suffixIcon: Icon(Icons.email_outlined),
//                   ),
//                 ),
//                 SizedBox(height: 16.0),
//                 TextField(
//                   controller: _passwordController,
//                   obscureText: passwordVisible,
//                   decoration: InputDecoration(
//                       hintText: 'Contraseña',
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           passwordVisible
//                               ? Icons.visibility
//                               : Icons.visibility_off,
//                           color: Theme.of(context).primaryColor,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             passwordVisible = !passwordVisible;
//                           });
//                         },
//                       )),
//                 ),
//                 SizedBox(height: 34.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     validarDatos();
//                     singIn();
//                     _signInWithEmailAndPassword();
//                   },
//                   child: const Text('Iniciar Sesión'),
//                   style: ButtonStyle(
//                       backgroundColor:
//                           MaterialStateProperty.all(Colors.purple)),
//                 ),
//                 const SizedBox(height: 16.0),
//                 if (loginError)
//                   Text('E-mail o contraseña incorrectos',
//                       style: TextStyle(color: Colors.red)),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => RegistrationPage(),
//                       ),
//                     );
//                   },
//                   child: const Text(
//                     'Crear una cuenta',
//                     style: TextStyle(
//                       decoration: TextDecoration.underline,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
