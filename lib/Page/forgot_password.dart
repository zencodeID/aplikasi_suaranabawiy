import 'package:flutter/material.dart';
import 'package:suaranabawiy/theme.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPassPage extends StatefulWidget {
  const ForgotPassPage({super.key});

  @override
  State<ForgotPassPage> createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
  late FToast fToast;
  final emailController = TextEditingController(text: "");
  final passwordController = TextEditingController(text: "");
  bool isShowPasswordError = false;
  bool isRememberMe = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          title(),
          emailInput(),
          resetButton(),
          Center(
            child: Container(
              margin: EdgeInsets.only(
                top: 24,
                bottom: 21,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget title() {
    return Container(
      margin: EdgeInsets.only(top: 84),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Forgot your\naccount',
            style: darkTextStyle.copyWith(
                fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                width: 87,
                height: 8,
                margin: EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: darkColor,
                ),
              ),
              Container(
                width: 14,
                height: 8,
                margin: EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: darkColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget emailInput() {
    return Container(
      margin: EdgeInsets.only(top: 48),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextFormField(
        controller: emailController,
        decoration: InputDecoration.collapsed(
          hintText: 'Email',
          hintStyle: darkTextStyle.copyWith(fontSize: 16),
        ),
      ),
    );
  }

  Widget resetButton() {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.only(top: 32),
      child: TextButton(
        onPressed: () {
          setState(() {
            isLoading = true;
          });

          Future.delayed(Duration(seconds: 2), () {
            setState(() {
              isLoading = false;
            });
            if (passwordController.text != "123456") {
              setState(() {
                isShowPasswordError = true;
              });
              fToast.showToast(
                child: errorToast(),
                gravity: ToastGravity.BOTTOM,
                toastDuration: Duration(seconds: 2),
              );
            }
          });
        },
        style: TextButton.styleFrom(
          backgroundColor: darkColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: isLoading
            ? CircularProgressIndicator(
                color: whiteColor,
                backgroundColor: greyColor,
              )
            : Text(
                'Submit',
                style: whiteTextStyle.copyWith(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }

  Widget errorToast() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: redColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'passowrd kamu salah',
        style: whiteTextStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
