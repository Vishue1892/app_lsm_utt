import 'package:app_languagesing/src/bloc/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailSignIn extends StatefulWidget {
  const EmailSignIn({Key? key}) : super(key: key);

  static Widget create(BuildContext context) => const EmailSignIn();

  @override
  EmailSignInState createState() => EmailSignInState();
}

class EmailSignInState extends State<EmailSignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? emptyValidator(String? value) {
    return (value == null || value.isEmpty)
        ? 'E-mail y Contraseña requerida'
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.purple,
            title: const Text('Iniciar Sesion con E-mail')),
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
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: emptyValidator,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _passwordController,
                      decoration:
                          const InputDecoration(labelText: 'Contraseña'),
                      validator: emptyValidator,
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: ElevatedButton(
                        child: const Text('Inicirar Sesion'),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.purple)),
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            context
                                .read<AuthCubit>()
                                .signInWithEmailAndPassword(
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
