import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final Rx<TextEditingController> phoneController = TextEditingController().obs;
  final Rx<TextEditingController> otpController = TextEditingController().obs;
  RxString selectedOption = 'mobile'.obs;
  RxString verificationID = "".obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  void verifyPhoneNumber() async {
    final phoneNumber = '+91 ${phoneController.value.text}';
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-retrieval or instant verification
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        print("CODE SENT $verificationId");
        // String smsCode = 'xxxx';
        // PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
        verificationID.value = verificationId;
        update();
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationID.value = verificationId;
        update();
      },
    );
  }

  void signInWithPhoneNumber() async {

    // print("phoneNumber : $phoneNumber");
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationID.value,
      smsCode: otpController.value.text,
    );
    try {
      await FirebaseAuth.instance.signInWithCredential(credential,);
      // Successfully signed in
      // Navigate to home screen
    } catch (e) {
      // Handle error
      print("ERROR :$e");
    }
  }
}
