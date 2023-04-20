import 'package:app_languagesing/src/bloc/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailCreate extends StatefulWidget {
  const EmailCreate({Key? key}) : super(key: key);

  static Widget create(BuildContext context) => const EmailCreate();

  @override
  EmailCreateState createState() => EmailCreateState();
}

class EmailCreateState extends State<EmailCreate> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  String? emailValidator(String? value) {
    return (value == null || value.isEmpty)
        ? 'E-mail y Contraseña requerida'
        : null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return 'Contraseña requerida';
    if (value.length < 6)
      return 'La contraseña debe tener almenos 6 caracteres';
    if (_passwordController.text != _repeatPasswordController.text)
      return 'La contraseña no coincide';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.purple, title: const Text('Crear Cuenta')),
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (_, state) {
            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state is AuthSigningIn)
                      const Center(child: CircularProgressIndicator()),
                    if (state is AuthError)
                      Text(
                        state.message,
                        style: const TextStyle(color: Colors.red, fontSize: 24),
                      ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'E-mail'),
                      validator: emailValidator,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _passwordController,
                      decoration:
                          const InputDecoration(labelText: 'Contraseña'),
                      validator: passwordValidator,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _repeatPasswordController,
                      decoration:
                          const InputDecoration(labelText: 'Repite Contraseña'),
                      validator: passwordValidator,
                    ),
                    Center(
                      child: ElevatedButton(
                        child: const Text('Crear Cuenta'),
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.purple)),
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            context
                                .read<AuthCubit>()
                                .createUserWithEmailAndPassword(
                                  _emailController.text,
                                  _passwordController.text,
                                );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
