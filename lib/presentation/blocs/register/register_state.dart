part of 'register_cubit.dart';

enum FormStatus{invalid, valid, validating, posting}

class RegisterFormState extends Equatable {

  final FormStatus formStatus;
  final bool isValid;
  final Username username;
  final Password password;

  final Email email;

  const RegisterFormState(
    {
       this.formStatus = FormStatus.invalid, 
       this.isValid = false,
       this.username = const Username.pure(),   // Establecemos con su valor inicial ''
       this.email = const Email.pure(), 
       this.password = const Password.pure()
      }
    );

  RegisterFormState copyWith({
    FormStatus? formStatus,
    Username? username,
    bool? isValid,
    Email? email,
    Password? password
  }) => RegisterFormState(
    formStatus : formStatus ?? this.formStatus, 
    username : username ?? this.username, 
    isValid :  isValid ?? this.isValid, 
    email :  email ?? this.email, 
    password :  password ?? this.password
  );

  // Manejaremos la validacion de estado con estos campos
  @override
  List<Object> get props => [formStatus , username , isValid, email, password];
}

