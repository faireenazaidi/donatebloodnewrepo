import 'dart:async';
import 'dart:convert';
import 'package:donationdiversity/signUp/signUpController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../Routes/app_routes.dart';
import '../Widgets/app_color.dart';
import '../Widgets/myButton.dart';
import '../Widgets/text_theme.dart';
import 'package:http/http.dart' as http;

class SignUpView extends GetView<SignUpController>{
  SignUpView({super.key});
  final String verificationId="";
  bool isEmail=false;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GetBuilder(
            init: controller,
            builder: (_) {
              return Stack(
                  children:[
                    Container(
                      height: Get.height, width: Get.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/bg.png'),
                            fit: BoxFit.fitHeight,
                          )
                      ),
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.4),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0, left: 8.0, right: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 20),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: HexColor('DDB887')),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset("assets/ddlogo.png", height: 135,),
                              ),
                            ),
                            const SizedBox(height: 40),
                            Text("Signup", style: MyTextTheme.veryLargeWCN,),
                            const SizedBox(height: 40),
                            Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio<String>(
                                    value: "email",
                                    groupValue: controller.selectedOption.value,
                                    activeColor: AppColor.buttonColor,
                                    onChanged: (String? value) {
                                      controller.selectedOption.value = value!;
                                      controller.update();
                                    }
                                ),
                                Text("E-mail", style: MyTextTheme.mediumWCN,),
                                Radio<String>(
                                    value: "mobile",
                                    activeColor: AppColor.buttonColor,
                                    groupValue: controller.selectedOption.value,
                                    onChanged: (String? value) {
                                      controller.selectedOption.value = value!;
                                      controller.update();
                                    }
                                ),
                                Text("Mobile Number", style: MyTextTheme.mediumWCN,),
                              ],
                            )),
                            const SizedBox(height: 20),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Visibility(
                                    visible: controller.selectedOption.value == "mobile",
                                    child: IntlPhoneField(
                                        controller: controller.phoneController.value,
                                        decoration: const InputDecoration(
                                          hintText: "Enter Phone Number",
                                          filled: true,
                                          fillColor: Colors.white,
                                          counterText: "",
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                        initialCountryCode: 'IN',
                                        onChanged: (phone) {
                                          print(phone.completeNumber);
                                        }
                                    ),
                                  ),
                                  Visibility(
                                    visible: controller.selectedOption.value == "email",
                                    child: TextFormField(
                                      controller: _emailController,
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.email_outlined, color: AppColor.buttonColor,),
                                          hintText: "Enter Your Email ",
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                            borderSide: BorderSide.none,
                                          ),
                                          counterText: ""
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return '*Please enter an email';
                                        }
                                        final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                                        if (!regex.hasMatch(value)) {
                                          return '*Enter a valid email address';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            MyButton(
                              borderRadius: 10,
                              elevation: 2,
                              width: 353,
                              onPressed: () {
                                if (controller.selectedOption.value == "email" && _formKey.currentState!.validate()) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) => OTPDialog(),
                                  );
                                } else if (controller.selectedOption.value == "mobile") {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) => OTPDialog(),
                                  );
                                // } else {
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //     SnackBar(content: Text('Please enter a valid email address.')),
                                //   );
                                }
                              },
                              title: "Send OTP",
                              color: AppColor.buttonColor,
                              suffixIcon: const Icon(Icons.arrow_forward, color: Colors.white,),
                            ),
                            const SizedBox(height: 20),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text("Have an account,", style: MyTextTheme.mediumWCN,),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Text('Login here!', style: MyTextTheme.largeBCB,),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]
              );
            }
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}

class OTPDialog extends StatefulWidget {
  const OTPDialog({super.key});

  @override
  _OTPDialogState createState() => _OTPDialogState();
}

class _OTPDialogState extends State<OTPDialog> {
  final int otpLength = 4;
  List<TextEditingController> otpControllers = [];
  List<FocusNode> focusNodes = [];
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  Timer? _timer;
  int _start = 60;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < otpLength; i++) {
      otpControllers.add(TextEditingController());
      focusNodes.add(FocusNode());
    }
    startTimer();
    fetchOtp(); // Fetch OTP from API
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  Future<void> fetchOtp() async {
    // Simulate API call to get OTP
    final response = await http.post(
      Uri.parse('https://your-api-endpoint.com/request-otp'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      String otp = data['otp'];

      // Store OTP securely
      await _secureStorage.write(key: 'otp', value: otp);
    } else {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to request OTP.')),
      );
    }
  }

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

  void handleOtpChange(String value, int index) {
    if (value.isNotEmpty && index < otpLength - 1) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
  }

  String getOtp() {
    return otpControllers.map((controller) => controller.text).join();
  }

  Future<void> verifyOtp(String otp) async {
    final storedOtp = await _secureStorage.read(key: 'otp');

    if (storedOtp == otp) {
      // OTP is valid
      Get.toNamed(AppRoutes.passwordRoute);
    } else {
      // OTP is invalid
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid OTP. Please try again.')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.close, size: 25),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
        const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'OTP',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Please enter the 4-digit verification code sent to ',
                    style: MyTextTheme.mediumBCG,
                  ),
                  TextSpan(
                    text: "+918318215534",
                    style: MyTextTheme.smallBCN,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(otpLength, (index) {
                return SizedBox(
                  width: 50,
                  child: TextField(
                    controller: otpControllers[index],
                    focusNode: focusNodes[index],
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      counterText: "",
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    cursorColor: AppColor.buttonColor,
                    style: const TextStyle(fontSize: 18),
                    onChanged: (value) {
                      handleOtpChange(value, index);
                    },
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            MyButton(
              borderRadius: 10,
              elevation: 2,
              onPressed: () {
                String otp = getOtp();
                if (otp.length == otpLength) {
                  verifyOtp(otp);
                  print('Entered OTP: $otp');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a complete OTP.')),
                  );
                }
              },
              title: "Submit",
              color: AppColor.buttonColor,
              suffixIcon: const Icon(
                Icons.arrow_forward, color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
        Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Didn't receive an OTP?", style: MyTextTheme.mediumBCb),
              ],
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: RichText(
            text: TextSpan(
            children: [
            TextSpan(text: "Resend OTP  ", style: MyTextTheme.mediumBCb),
            TextSpan(text: "in  ", style: MyTextTheme.smallBCN),
            WidgetSpan(
              child: Icon(
                Icons.timer_outlined,
                size: 15,
                color: AppColor.buttonColor,
              ),
            ),
            TextSpan(
              text: _start > 0 ? '$_start seconds' : 'Resend',
              style: MyTextTheme.smallBCN,
            ),
          ],
        ),
      ),
    ),
          ],
        ),
      ),
    );
  }
}


