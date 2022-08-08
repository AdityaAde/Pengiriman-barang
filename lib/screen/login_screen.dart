import 'package:big/models/login_models.dart';
import 'package:big/screen/progress_login.dart';
import 'package:flutter/material.dart';

import '../provider/authentication.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool hidePassword = true;

  LoginRequestModel? requestModel;
  bool isApiCallProcess = false;
  @override
  void initState() {
    super.initState();
    requestModel = LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
      child: _uiSetup(context),
    );
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Form(
          key: globalFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                validator: (input) => input!.isEmpty ? "Email/username tidak boleh kosong" : null,
                decoration: InputDecoration(
                  hintText: "Username",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                    ),
                  ),
                  focusedBorder:
                      UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary)),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                onSaved: (input) => requestModel!.password = int.parse(input!),
              ),
              const SizedBox(height: 20),
              TextFormField(
                style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                keyboardType: TextInputType.text,
                validator: (input) => input!.length < 3 ? "Password should be more than 3 characters" : null,
                obscureText: hidePassword,
                decoration: InputDecoration(
                  hintText: "Password",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                    ),
                  ),
                  focusedBorder:
                      UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary)),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                    icon: Icon(hidePassword ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
                onSaved: (input) => requestModel!.kodeDriver = input,
              ),
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Lupa Kata Sandi?',
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(fixedSize: const Size(150, 40)),
                  onPressed: () {
                    if (validateAndSave()) {
                      setState(() {
                        isApiCallProcess = true;
                      });

                      Authentication authentication = Authentication();
                      authentication.loginAuth(requestModel!).then((value) {
                        setState(() {
                          isApiCallProcess = false;
                        });
                        if (value.token!.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Login Berhasil')),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(token: value.token!),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Login Gagal, Periksa username dan password anda')),
                          );
                        }
                      });
                    }
                  },
                  child: const Text('Masuk'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          height: 75,
          color: Colors.transparent,
          child: Center(
            child: RichText(
              text: TextSpan(
                text: 'Belum Punya Akun? ',
                style: TextStyle(color: Colors.black.withOpacity(0.5)),
                children: const <TextSpan>[
                  TextSpan(
                    text: 'Daftar Sekarang',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
