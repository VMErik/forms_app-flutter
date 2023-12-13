import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Usuario'),
      ),
      body: BlocProvider(
        create: (context)=> RegisterCubit(),
        child: const _RegisterView(),  
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    // El textForm field, se relaciona con un formulario
    return const SafeArea(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        // Se recomienda envolver los inputs en este control para que al desplazarse no exista overflow
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               FlutterLogo(
                size: 200,
              ),
               _RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {

    final registerCubit = context.watch<RegisterCubit>();
    // Obtenemos los valores de nuestras propuiedades del estado
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;


    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de usuario',
            onChanged:  (value){
              // Notificamos el cambio de estado
              registerCubit.usernameChanged(value);
            },
            errorMessage: username.errorMessage
          ),
          const SizedBox(height: 10,),
          CustomTextFormField(
            label: 'Correo electronico',
            onChanged:(value){
              // Notificamos el cambio de estado
              registerCubit.emailChanged(value);
            },
            errorMessage: email.errorMessage,
          ),
          const SizedBox(height: 10,),

          CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            onChanged:(value){
              // Notificamos el cambio de estado
              registerCubit.passwordChanged(value);
            },
             errorMessage: password.errorMessage,
          ),
          const SizedBox(
            height: 20,
          ),
          FilledButton.tonalIcon(
              onPressed: () {
                // final isValid = _formKey.currentState!.validate();
                // if(!isValid) return;
                // Mandamos el submit en nuestro cubit
                registerCubit.onSubmit();
              },
              
              icon: const Icon(Icons.save),
              label: const Text('Crear Usuario'))
        ],
      ),
    );
  }
}
