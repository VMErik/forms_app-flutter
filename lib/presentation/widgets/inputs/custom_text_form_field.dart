import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final String? label ;
  final String? hint ;
  final String? errorMessage ;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;


  const CustomTextFormField({super.key, this.label, this.hint, this.errorMessage,this.onChanged, this.validator, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15)
    );

    return TextFormField(
      // Que pasa cuando tecleamos, hacemos referencia anuestras funciones
      onChanged: onChanged,
      // Que es lo que validaremos , hacemos referencia anuestras funciones
      validator: validator,
      obscureText: obscureText,
      // Apariencia
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: BorderSide(color:colors.primary)),
        errorBorder:  border.copyWith(borderSide: BorderSide(color:Colors.red.shade800)),
        focusedErrorBorder:  border.copyWith(borderSide: BorderSide(color:Colors.red.shade400)),

        // Para que no sea tan grande
        isDense:  true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        focusColor:  colors.primary,
        prefixIcon: Icon(Icons.supervised_user_circle_outlined , color: colors.primary,),
        errorText:errorMessage
      ),
    );
  }
}