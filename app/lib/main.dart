import 'dart:convert';

import 'package:app/dashboard/constants.dart';
import 'package:app/dashboard/controllers/menu_app_controller.dart';
import 'package:app/dashboard/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    hide Provider
    hide ChangeNotifierProvider;
import 'package:google_fonts/google_fonts.dart';
import 'package:mongo_dart/mongo_dart.dart' hide State hide Center;
import 'package:motion_toast/resources/arrays.dart';
import 'package:provider/provider.dart';
import 'package:motion_toast/motion_toast.dart';
import 'dashboard/controllers/user_controller.dart';
import 'package:http/http.dart' as http;

void main() {
  Future<bool> data() async {
    return (jsonDecode((await http.get(Uri.parse("$apiUrl/"))).body))['showApp']
        as bool;
  }

  Future<bool> data2() async {
    Db db = await Db.create(
        'mongodb+srv://ceasowrath:Rizq7tkT2RmmWn37@cluster0.t1ez4iv.mongodb.net/gateentry');
    await db.open();
    var collection = db.collection('metadata');
    var data = await collection.findOne();
    return data!['showApp'] as bool;
  }

  data2().then(
    (value) => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuAppController(),
          ),
          ChangeNotifierProvider(
            create: (_) => User(),
          ),
        ],
        child: MyApp(
          showApp: value,
        ),
      ),
      // const MyApp()
    ),
  );

  // data().then(
  //   (value) => runApp(
  //     MultiProvider(
  //       providers: [
  //         ChangeNotifierProvider(
  //           create: (context) => MenuAppController(),
  //         ),
  //         ChangeNotifierProvider(
  //           create: (_) => User(),
  //         ),
  //       ],
  //       child: MyApp(
  //         showApp: value,
  //       ),
  //     ),
  //     // const MyApp()
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  final bool showApp;

  const MyApp({super.key, required this.showApp});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: showApp ? const LoginPage() : const MyWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Please make the payment to continue",
      style: TextStyle(
        fontSize: 40,
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      body: ListView(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 10,
            horizontal: MediaQuery.of(context).size.width / 5),
        children: const [Body()],
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool passwordvisible = true;
  var txtUserNameController = TextEditingController();
  var txtUserPwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 1530
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/logo-2.png",
                    height: 300,
                    width: 300,
                  ),
                  const Text(
                    'Sign In to \nGate Entry',
                    style: TextStyle(
                      fontSize: 65,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Image.asset(
                  //   'assets/images/illustration-2.png',
                  //   width: 400,
                  // ),
                ],
              ),
              Image.asset(
                'assets/images/illustration-1.png',
                width: 400,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / 6),
                child: SizedBox(
                  width: 320,
                  child: _formLogin(),
                ),
              )
            ],
          )
        : Column(
            children: [
              const Text(
                'Sign In to \nGate Entry',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                'assets/images/illustration-2.png',
                width: 300,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / 6),
                child: SizedBox(
                  width: 320,
                  child: _formLogin(),
                ),
              )
            ],
          );
  }

  Widget _formLogin() {
    return Column(
      children: [
        TextField(
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          controller: txtUserNameController,
          style: const TextStyle(fontSize: 20),
          decoration: InputDecoration(
            hintText: 'Enter Employee code',
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: const TextStyle(fontSize: 12),
            contentPadding: const EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(height: 30),
        TextField(
          controller: txtUserPwdController,
          obscureText: passwordvisible,
          style: const TextStyle(fontSize: 20),
          decoration: InputDecoration(
            hintText: 'Password',
            suffixIcon: IconButton(
                onPressed: () => setState(
                      () {
                        passwordvisible = !passwordvisible;
                      },
                    ),
                icon: Icon(
                  passwordvisible
                      ? Icons.visibility
                      : Icons.visibility_off_outlined,
                  color: Colors.grey,
                )),
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: const TextStyle(fontSize: 19),
            contentPadding: const EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            child: const Text(
              "Forgot password?",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            onTap: () {},
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 209, 196, 233),
                spreadRadius: 10,
                blurRadius: 20,
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () => {
              Provider.of<User>(context, listen: false).signIn(
                int.parse(txtUserNameController.text),
                txtUserPwdController.text.toString(),
                (success) => {
                  if (success &&
                      Provider.of<User>(context, listen: false).token != null)
                    {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const ProviderScope(
                            child: MyAppDashboard(),
                          ),
                        ),
                      ),
                      MotionToast.success(
                        position: MotionToastPosition.top,
                        title: const Text(
                          "Success",
                          style: TextStyle(
                            fontSize: 21,
                          ),
                        ),
                        description: const Text(
                          "Login Successfull",
                          style: TextStyle(fontSize: 21),
                        ),
                      ).show(context),
                    }
                  else
                    {
                      MotionToast.error(
                        position: MotionToastPosition.top,
                        title: const Text(
                          "Login failed",
                          style: TextStyle(
                            fontSize: 21,
                          ),
                        ),
                        description: const Text(
                          "Please check your id and password",
                          style: TextStyle(
                            fontSize: 21,
                          ),
                        ),
                      ).show(context),
                    }
                },
              ),
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 44, 158, 98),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const SizedBox(
              width: double.infinity,
              height: 50,
              child: Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
