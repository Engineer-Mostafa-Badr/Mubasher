part of 'registration_cubit.dart';

class RegistrationState extends Equatable {
  const RegistrationState({
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.whatsAppController,
    required this.passwordController,
    required this.facebookController,
    required this.profilePictureController,
    required this.documentsController,
    required this.countryController,
    required this.cityController,
    required this.formKey,
    required this.profileImage,
    this.isShowPassword = true,
    this.selectedPhoneCode = '+20',
    this.selectedWhatsAppCode = '+20',
    this.selectedPhoneFlag = '🇪🇬',
    this.selectedWhatsAppFlag = '🇪🇬',
    this.isSeller = false,
    this.isUser = false,
    this.isProfileImageValid = true,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController whatsAppController;
  final TextEditingController passwordController;
  final TextEditingController facebookController;
  final TextEditingController profilePictureController;
  final TextEditingController documentsController;
  final TextEditingController countryController;
  final TextEditingController cityController;
  final GlobalKey<FormState> formKey;
  final bool isShowPassword;
  final String selectedPhoneCode;
  final String selectedWhatsAppCode;
  final String selectedPhoneFlag;
  final String selectedWhatsAppFlag;
  final bool isSeller;
  final bool isUser;
  final File? profileImage;
  final bool isProfileImageValid;

  RegistrationState copyWith({
    TextEditingController? nameController,
    TextEditingController? emailController,
    TextEditingController? phoneController,
    TextEditingController? whatsAppController,
    TextEditingController? passwordController,
    TextEditingController? facebookController,
    TextEditingController? profilePictureController,
    TextEditingController? documentsController,
    TextEditingController? countryController,
    TextEditingController? cityController,
    bool? isShowPassword,
    GlobalKey<FormState>? formKey,
    String? selectedPhoneCode,
    String? selectedWhatsAppCode,
    String? selectedPhoneFlag,
    String? selectedWhatsAppFlag,
    bool? isUser,
    bool? isSeller,
    File? profileImage,
    bool? isProfileImageValid,
  }) => RegistrationState(
    nameController: nameController ?? this.nameController,
    emailController: emailController ?? this.emailController,
    phoneController: phoneController ?? this.phoneController,
    whatsAppController: whatsAppController ?? this.whatsAppController,
    passwordController: passwordController ?? this.passwordController,
    facebookController: facebookController ?? this.facebookController,
    profilePictureController:
        profilePictureController ?? this.profilePictureController,
    documentsController: documentsController ?? this.documentsController,
    countryController: countryController ?? this.countryController,
    cityController: cityController ?? this.cityController,
    isShowPassword: isShowPassword ?? this.isShowPassword,
    formKey: formKey ?? this.formKey,
    selectedPhoneCode: selectedPhoneCode ?? this.selectedPhoneCode,
    selectedWhatsAppCode: selectedWhatsAppCode ?? this.selectedWhatsAppCode,
    selectedPhoneFlag: selectedPhoneFlag ?? this.selectedPhoneFlag,
    selectedWhatsAppFlag: selectedWhatsAppFlag ?? this.selectedWhatsAppFlag,
    isUser: isUser ?? this.isUser,
    isSeller: isSeller ?? this.isSeller,
    profileImage: profileImage ?? this.profileImage,
    isProfileImageValid: isProfileImageValid ?? this.isProfileImageValid,
  );

  @override
  List<Object?> get props => [
    nameController,
    emailController,
    phoneController,
    whatsAppController,
    passwordController,
    facebookController,
    profilePictureController,
    documentsController,
    countryController,
    cityController,
    isShowPassword,
    formKey,
    selectedPhoneCode,
    selectedWhatsAppCode,
    selectedPhoneFlag,
    selectedWhatsAppFlag,
    isUser,
    isSeller,
    profileImage,
  ];
}
