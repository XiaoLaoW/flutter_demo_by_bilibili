import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? controllerUsername = TextEditingController();
  TextEditingController? controllerPassword = TextEditingController();
  bool pwdShow = false;
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      backgroundColor: Colors.teal,
      body: Column(
        children: [
          _formList(),
          ElevatedButton(
            onPressed: () {
              (_formKey.currentState as FormState).validate();
              print('Username: ${controllerUsername?.text}');
              print('Password: ${controllerPassword?.text}');
            },
            child: Text('Login'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register_page');
            },
            child: Text('register',style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }

  Widget _formList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: '名称',
                hintText: '请输入您的名称',
                  border: OutlineInputBorder(),
              ),
              controller: controllerUsername,
              validator: (value) {
                return value!.trim().isEmpty ? '名称不能为空' : null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                  labelText: '密码',
                  hintText: '请输入您的密码',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon:
                        Icon(pwdShow ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        pwdShow = !pwdShow;
                      });
                    },
                  )),
              obscureText: !pwdShow,
              controller: controllerPassword,
              validator: (value) {
                return value!.trim().isEmpty ? '密码不能为空' : null;
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controllerUsername?.dispose();
    controllerPassword?.dispose();
    super.dispose();
  }
}
