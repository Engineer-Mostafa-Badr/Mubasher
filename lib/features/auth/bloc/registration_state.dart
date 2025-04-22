part of 'registration_cubit.dart';

class RegistrationState extends Equatable {
  const RegistrationState({
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.whatsAppController,
    required this.passwordController,
    required this.formKey,
    this.isShowPasswrd = true,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController whatsAppController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final bool isShowPasswrd;

  RegistrationState copyWith({
    TextEditingController? nameController,
    TextEditingController? emailController,
    TextEditingController? phoneController,
    TextEditingController? whatsAppController,
    TextEditingController? passwordController,
    bool? isShowPasswrd,
    GlobalKey<FormState>? formKey,
  }) => RegistrationState(
    nameController: nameController ?? this.nameController,
    emailController: emailController ?? this.emailController,
    phoneController: phoneController ?? this.phoneController,
    whatsAppController: whatsAppController ?? this.whatsAppController,
    passwordController: passwordController ?? this.passwordController,
    isShowPasswrd: isShowPasswrd ?? this.isShowPasswrd,
    formKey: formKey ?? this.formKey,
  );

  @override
  List<Object> get props => [
    nameController,
    emailController,
    phoneController,
    whatsAppController,
    passwordController,
    isShowPasswrd,
    formKey,
  ];
}
