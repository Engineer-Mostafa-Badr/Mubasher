part of 'registration_cubit.dart';

class RegistrationState extends Equatable {
  const RegistrationState({
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.whatsAppController,
    required this.passwordController,
    required this.formKey,
    this.isShowPassword = true,
    this.selectedPhoneCode = '+20',
    this.selectedWhatsAppCode = '+20',
    this.selectedPhoneFlag = '🇪🇬',
    this.selectedWhatsAppFlag = '🇪🇬',
    this.isSeller = false,
    this.isUser = false,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController whatsAppController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final bool isShowPassword;
  final String selectedPhoneCode;
  final String selectedWhatsAppCode;
  final String selectedPhoneFlag;
  final String selectedWhatsAppFlag;
  final bool isSeller;
  final bool isUser;

  RegistrationState copyWith({
    TextEditingController? nameController,
    TextEditingController? emailController,
    TextEditingController? phoneController,
    TextEditingController? whatsAppController,
    TextEditingController? passwordController,
    bool? isShowPassword,
    GlobalKey<FormState>? formKey,
    String? selectedPhoneCode,
    String? selectedWhatsAppCode,
    String? selectedPhoneFlag,
    String? selectedWhatsAppFlag,
    bool? isUser,
    bool? isSeller,
  }) => RegistrationState(
    nameController: nameController ?? this.nameController,
    emailController: emailController ?? this.emailController,
    phoneController: phoneController ?? this.phoneController,
    whatsAppController: whatsAppController ?? this.whatsAppController,
    passwordController: passwordController ?? this.passwordController,
    isShowPassword: isShowPassword ?? this.isShowPassword,
    formKey: formKey ?? this.formKey,
    selectedPhoneCode: selectedPhoneCode ?? this.selectedPhoneCode,
    selectedWhatsAppCode: selectedWhatsAppCode ?? this.selectedWhatsAppCode,
    selectedPhoneFlag: selectedPhoneFlag ?? this.selectedPhoneFlag,
    selectedWhatsAppFlag: selectedWhatsAppFlag ?? this.selectedWhatsAppFlag,
    isUser: isUser ?? this.isUser,
    isSeller: isSeller ?? this.isSeller,
  );

  @override
  List<Object> get props => [
    nameController,
    emailController,
    phoneController,
    whatsAppController,
    passwordController,
    isShowPassword,
    formKey,
    selectedPhoneCode,
    selectedWhatsAppCode,
    selectedPhoneFlag,
    selectedWhatsAppFlag,
    isUser,
    isSeller,
  ];
}
