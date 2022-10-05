import 'package:agendakan_2/pages/mercusuara/controller/ApiMercusuara.dart';
import 'package:agendakan_2/pages/register/register_page.dart';
import 'package:agendakan_2/plugins/ApiPlugin.dart';
import 'package:agendakan_2/test.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageMercusuara extends StatefulWidget {
  const LoginPageMercusuara({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<LoginPageMercusuara> createState() => _LoginPageStateMercusuara();
}

class _LoginPageStateMercusuara extends State<LoginPageMercusuara> {
  final _formKey = GlobalKey<FormState>();
  ApiMercusuara _provider = ApiMercusuara();
  var rememberValue = false;
  final data_store = GetStorage();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //print(Get.arguments);
    return Scaffold(
      //backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.all(20),
        //constraints: BoxConstraints(minWidth: 500),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Sign in',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: email,
                    validator: (value) => EmailValidator.validate(value!)
                        ? null
                        : "Please enter a valid email",
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: pass,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    maxLines: 1,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  // CheckboxListTile(
                  //   title: const Text("Remember me"),
                  //   contentPadding: EdgeInsets.zero,
                  //   value: rememberValue,
                  //   activeColor: Theme.of(context).colorScheme.primary,
                  //   onChanged: (newValue) {
                  //     setState(() {
                  //       rememberValue = newValue!;
                  //     });
                  //   },
                  //   controlAffinity: ListTileControlAffinity.leading,
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        var data = await _provider.post(email.text, pass.text);
                        if (data != null) {
                          data_store.write("token", data['token']);
                          data_store.write("isAdmin", data['isAdmin']);
                          if (data['isAdmin'] == 1) {
                            Get.toNamed('/mercusuara/ticketlistAdmin',
                                arguments: data['token']);
                          } else {
                            Get.toNamed('/mercusuara',
                                arguments: data['token']);
                          }
                        } else {
                          print("Login Failed!");
                        }
                        setState(() {});
                        //print(data['token']);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                    ),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Not registered yet?'),
                      TextButton(
                        onPressed: () {
                          Get.toNamed("/mercusuara/register");
                        },
                        child: const Text('Create an account'),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
