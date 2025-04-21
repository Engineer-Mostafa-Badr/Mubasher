part of 'registration_cubit.dart';

class RegistrationState extends Equatable {
  const RegistrationState({
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    this.isShowPasswrd = true,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isShowPasswrd;
  final GlobalKey<FormState> formKey;

  RegistrationState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    bool? isShowPasswrd,
    GlobalKey<FormState>? formKey,
  }) => RegistrationState(
    emailController: emailController ?? this.emailController,
    passwordController: passwordController ?? this.passwordController,
    isShowPasswrd: isShowPasswrd ?? this.isShowPasswrd,
    formKey: formKey ?? this.formKey,
  );

  @override
  List<Object> get props => [
    emailController,
    passwordController,
    isShowPasswrd,
    formKey,
  ];
}
