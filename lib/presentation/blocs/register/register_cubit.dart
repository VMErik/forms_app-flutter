import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/infraestructure/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit(){

    emit(
      state.copyWith(
        formStatus:  FormStatus.validating,
        username: Username.dirty(state.username.value), // Forzamos que para que cuando este en su estad pure, se ensucie con ese valr
        password: Password.dirty(state.password.value), // Forzamos que para que cuando este en su estad pure, se ensucie con ese valr
        email: Email.dirty(state.email.value), // Forzamos que para que cuando este en su estad pure, se ensucie con ese valr
        isValid: Formz.validate(
          [state.username, state.password]
        )
      )
    );

    print('Submit : $state');
  }

  void usernameChanged(String value){
    final username = Username.dirty(value);
    emit(
      state.copyWith(
        username: username, // Establecemos el cambio
        isValid: Formz.validate([username, state.password , state.email]) // Validaremos co Formz nuestro campo del formulario
      )
    );
  }
  void emailChanged(String value){
    final email = Email.dirty(value);

    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.username ,state.password]) // Validaremos co Formz nuestro campo del formulario
      )
    );
  }
  void passwordChanged(String value){
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password , 
        isValid: Formz.validate([ password ,  state.username , state.email ]) // Validaremos co Formz nuestro campo del formulario
      )
    );
  }


}
