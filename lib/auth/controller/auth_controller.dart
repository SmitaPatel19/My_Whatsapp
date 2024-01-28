import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_whatsapp/auth/repository/auth_repository.dart';

final authControllerProvider = Provider((ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return AuthController(authRepository: authRepository, ref: ref);
  }
);


class AuthController{
  final AuthRepository authRepository;
  final ProviderRef ref;

  AuthController({required this.authRepository, required this.ref});

  void saveUserInfoFirstore({
    required String username,
    required var profileImage,
    required BuildContext context,
    required bool mounted,
  }){
    authRepository.saveUserInfoFirstore(
        username: username,
        profileImage: profileImage,
        ref: ref,
        context: context,
        mounted: mounted,
    );
  }

  void verifySmsCode({
    required BuildContext context,
    required String smsCodeId,
    required String smsCode,
    required bool mounted,
  }){
    authRepository.verifySmsCode(
        context: context,
        smsCodeId: smsCodeId,
        smsCode: smsCode,
        mounted: mounted
    );
  }

  void sendSmsCode({
    required BuildContext context,
    required String phoneNumber,
  }){
    authRepository.sendSmsCode(
        context: context,
        phoneNumber: phoneNumber
    );
  }
}