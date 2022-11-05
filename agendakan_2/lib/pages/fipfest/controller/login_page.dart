import 'package:agendakan_2/pages/fipfest/controller/register_page.dart';
import 'package:agendakan_2/pages/fipfest/repository/gkm_api.dart';
import 'package:agendakan_2/pages/register/register_page.dart';
import 'package:agendakan_2/plugins/ApiPlugin.dart';
import 'package:agendakan_2/test.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FipFesLoginPage extends StatefulWidget {
  const FipFesLoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<FipFesLoginPage> createState() => _FipFesLoginPageState();
}

class _FipFesLoginPageState extends State<FipFesLoginPage> {
  final _formKey = GlobalKey<FormState>();
  FipFest_API _provider = FipFest_API();
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
                            Get.toNamed('/fipfest/ticket_list',
                                arguments: data['token']);
                          } else {
                            Get.toNamed('/fipfest', arguments: data['token']);
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FipfestRegisterPage(
                                  title: 'Register UI'),
                            ),
                          );
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
