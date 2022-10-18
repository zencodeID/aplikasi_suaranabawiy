import 'package:flutter/material.dart';
import 'package:suaranabawiy/theme.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
          passwordInput(),
          checkBoxRem(),
          loginButton(),
          resetText(),
          Center(
            child: Container(
              margin: EdgeInsets.only(
                top: 24,
                bottom: 21,
              ),
              child: Text(
                'OR',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          loginWithGoogle(),
          registerText(),
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
            'Login to your\naccount',
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

  Widget passwordInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 32),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: greyColor,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Password',
                    hintStyle: darkTextStyle.copyWith(fontSize: 16),
                  ),
                ),
              ),
              Icon(
                Icons.visibility_outlined,
              ),
            ],
          ),
        ),
        if (isShowPasswordError)
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(
              'Password Kamu Salah',
              style: redTextstyle,
            ),
          )
      ],
    );
  }

  Widget checkBoxRem() {
    return Container(
      margin: EdgeInsets.only(top: 32),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Checkbox(
              value: isRememberMe,
              onChanged: (value) {
                setState(() {
                  isRememberMe = value!;
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            'Remember Me',
          ),
        ],
      ),
    );
  }

  Widget loginButton() {
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
            } else {
              Navigator.pushNamed(context, '/navbar');
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
                'Login',
                style: whiteTextStyle.copyWith(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }

  Widget loginWithGoogle() {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.only(top: 21),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          // backgroundColor: darkColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          'Login With Google',
          style:
              darkTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget registerText() {
    return Container(
      margin: EdgeInsets.only(
        top: 48,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account ?",
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 2,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/sign-up');
            },
            child: Text(
              'Register',
              style: blueTextstyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget resetText() {
    return Container(
      margin: EdgeInsets.only(
        top: 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Forgot your account?",
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 2,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/resetpass');
            },
            child: Text(
              'Reset',
              style: blueTextstyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
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
