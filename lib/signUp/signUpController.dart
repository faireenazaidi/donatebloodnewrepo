import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  final Rx<TextEditingController> phoneController = TextEditingController().obs;
  final Rx<TextEditingController> otpController = TextEditingController().obs;
  RxString selectedOption='mobile'.obs;
  RxString verificationID = "".obs;

  void verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneController.value.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-retrieval or instant verification
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle error
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        print("CODE SENT $verificationId");
        // Save verification ID to use in sign-in
          verificationID.value = verificationId;
          update();
      },
      codeAutoRetrievalTimeout: (String verificationId) {
          verificationID.value = verificationId;
          update();
      },
    );
  }

  void _signInWithPhoneNumber() async {
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationID.value,
      smsCode: otpController.value.text,
    );

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      // Successfully signed in
      // Navigate to home screen
    } catch (e) {
      // Handle error
      print(e);
    }
  }

  void setState(Null Function() param0) {}
}

