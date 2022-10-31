import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_clean_architecture/presentation/constants/string_constants.dart';
import 'package:riverpod_clean_architecture/presentation/views/home_page.dart';
import 'package:riverpod_clean_architecture/presentation/widgets/custom_textfield_widget.dart';

import '../controller/login_controller.dart';


class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _clientCodeController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _clientCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _loginController = ref.watch(
      loginController,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          StringConstants.applicationHeading,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: ListView(
                  children: <Widget>[
                    CustomTextField(controller: _clientCodeController, hintText: StringConstants.clientCode),
                    CustomTextField(controller: _emailController, hintText: StringConstants.emailAddress),
                    CustomTextField(controller: _passwordController, hintText: StringConstants.password),
                    const SizedBox(height: 30,),
                    Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          child: const Text(StringConstants.login),
                          onPressed: () async{
                           var result =  await _loginController.login(
                                username: _emailController.text,
                                password: _passwordController.text,
                                clientCode: _clientCodeController.text);
                         if(result != null && _loginController.isLoggedIn){
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => const HomeScreen()),
                             );
                          }
                            },
                        )),
                    ],
                ),
              )),
          _loginController.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.orange,
                ))
              : Container(),
        ],
      ),
    );
  }
}
