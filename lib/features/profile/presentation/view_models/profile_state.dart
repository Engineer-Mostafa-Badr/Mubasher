import 'package:mubasher_app/features/auth/data/models/user_model.dart';
import 'package:mubasher_app/core/error/failure_type.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

/// الحالة الافتراضية أول ما يشتغل الـ Bloc
class ProfileInitial extends ProfileState {}

/// ✅ تحميل بيانات المستخدم
class ProfileLoading extends ProfileState {}

/// ✅ نجاح تحميل بيانات المستخدم
class ProfileLoaded extends ProfileState {
  final UserModel user;

  const ProfileLoaded(this.user);

  @override
  List<Object?> get props => [user];
}

/// ❌ فشل تحميل بيانات المستخدم
class ProfileLoadFailure extends ProfileState {
  final String message;

  const ProfileLoadFailure(this.message);

  @override
  List<Object?> get props => [message];
}

/// 🔄 تغيير كلمة المرور
class ChangePasswordLoading extends ProfileState {}

class ChangePasswordSuccess extends ProfileState {}

class ChangePasswordFailure extends ProfileState {
  final FailureType type;

  const ChangePasswordFailure(this.type);

  @override
  List<Object?> get props => [type];
}
