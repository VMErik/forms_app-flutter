import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Usuario'),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    // El textForm field, se relaciona con un formulario
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        // Se recomienda envolver los inputs en este control para que al desplazarse no exista overflow
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const FlutterLogo(
                size: 200,
              ),
              const _RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {

  // Lo utilizamos para tener el contrl del forumlario en el contexto
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String username ='';
  String email ='';
  String password ='';


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de usuario',
            onChanged: (value) => username = value,
            validator: (value){
              if(value == null || value.isEmpty) return 'Campo Requerido';
              if(value.trim().isEmpty) return 'Campo Requerido';
              if(value.length < 6) return 'Longitud minima de 6 caracteres';
              return null;
            }
          ),
          const SizedBox(height: 10,),
          CustomTextFormField(
            label: 'Correo electronico',
            onChanged: (value) => email = value,
            validator: (value){
              if(value == null || value.isEmpty) return 'Campo Requerido';
              if(value.trim().isEmpty) return 'Campo Requerido';
              final emailRegExp = RegExp(
                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                  );
              if(!emailRegExp.hasMatch(value)) return 'Correo no tiene formato correcto';
              return null;
            }
          ),
          const SizedBox(height: 10,),

          CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            onChanged: (value) => password = value,
              validator: (value){
              if(value == null || value.isEmpty) return 'Campo Requerido';
              if(value.trim().isEmpty) return 'Campo Requerido';
              if(value.length < 6) return 'Longitud minima de 6 caracteres';
              return null;
            }
          ),
          const SizedBox(
            height: 20,
          ),
          FilledButton.tonalIcon(
              onPressed: () {
                final isValid = _formKey.currentState!.validate();
                if(!isValid) return;
                print('$username , $email , $password');
              },
              
              icon: const Icon(Icons.save),
              label: const Text('Crear Usuario'))
        ],
      ),
    );
  }
}
