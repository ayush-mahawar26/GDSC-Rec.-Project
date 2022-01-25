import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_project/MainScreens/home.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScr extends StatelessWidget {
  const LoginScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 242, 240),
      body: SafeArea(child: LoginPagePreview()),
    );
  }
}

class LoginPagePreview extends StatefulWidget {
  LoginPagePreview({Key? key}) : super(key: key);

  @override
  State<LoginPagePreview> createState() => _LoginPagePreviewState();
}

class _LoginPagePreviewState extends State<LoginPagePreview> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool isPasswordHidden = true;
  var currentIcon = CupertinoIcons.eye_fill;
  _changePasswordVis() {
    setState(() {
      if (isPasswordHidden) {
        isPasswordHidden = false;
        currentIcon = CupertinoIcons.eye_slash_fill;
      } else {
        isPasswordHidden = true;
        currentIcon = CupertinoIcons.eye_fill;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: mq.height * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: mq.width * 0.05),
              child: Text(
                "Hello,",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 60,
                    color: Colors.black,
                    fontFamily: GoogleFonts.pacifico().fontFamily),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: mq.width * 0.05),
              child: Text(
                "Login to your account ",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontFamily: GoogleFonts.pacifico().fontFamily),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: mq.width * 0.06, vertical: mq.height * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Text("Email Address :"),

                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (email) {
                              if (email!.isEmpty) {
                                return "Enter your email";
                              } else if (email != "test@admin.com") {
                                return "Enter valid email";
                              }
                            },
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Email",
                                prefixIcon: Icon(
                                  Icons.mail,
                                  color: Colors.black,
                                ),
                                hintText: "Enter Email Address"),
                          ),
                          SizedBox(height: mq.height * 0.04),
                          TextFormField(
                            validator: (password) {
                              if (password!.isEmpty) {
                                return "Enter Your Password";
                              } else if (password != "12345678") {
                                return "Invalid Password";
                              }
                            },
                            controller: pass,
                            obscureText: isPasswordHidden,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: "Password",
                                suffixIcon: InkWell(
                                  child:
                                      Icon(currentIcon, size: mq.width * 0.05),
                                  onTap: () {
                                    _changePasswordVis();
                                  },
                                ),
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                                hintText: "Enter Password"),
                          ),
                        ],
                      )),

                  SizedBox(
                    height: mq.height * 0.05,
                  ),

                  SizedBox(
                    width: mq.width,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const HomeScr()),
                                (route) => false);
                          }
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: mq.height * 0.02),
                          child: Text(
                            "Login",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                          ),
                        )),
                  ),

                  SizedBox(
                    height: mq.height * 0.030,
                  ),

                  Row(
                    children: [
                      Text(
                        "Don't have account ? ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 13),
                      ),
                      Text(
                        "create account",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
