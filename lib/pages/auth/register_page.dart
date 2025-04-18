import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth.vm.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> _formRegisterKey = GlobalKey<FormState>();
  bool pwdShow = false;
  bool pwdShowTwo = false;
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerPasswordTwo = TextEditingController();
  AuthViewModel viewModel = AuthViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthViewModel>(
      create: (_) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Register'),
        ),
        backgroundColor: Colors.teal,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _formList(),
          ],
        ),
      ),
    );
  }

  Widget _formList() {
    return Consumer<AuthViewModel>(builder: (context, vm, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: _formRegisterKey,
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
                onChanged: (value) {
                  vm.registerInfo.name = value.trim();
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '请输入您的密码',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                          pwdShow ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          pwdShow = !pwdShow;
                        });
                      },
                    )),
                obscureText: !pwdShow,
                controller: controllerPassword,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return '密码不能为空';
                  } else if ((value.trim() ?? '').length < 6) {
                    return '密码长度不能小于6';
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  vm.registerInfo.password = value.trim();
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '请再次输入您的密码',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                          pwdShowTwo ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          pwdShowTwo = !pwdShowTwo;
                        });
                      },
                    )),
                obscureText: !pwdShowTwo,
                controller: controllerPasswordTwo,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return '密码不能为空';
                  } else if ((value.trim() ?? '').length < 6) {
                    return '密码长度不能小于6';
                  } else if (controllerPassword.text != value.trim()) {
                    return '密码不一致';
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  vm.registerInfo.repassword = value.trim();
                },
              ),
              SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  if ((_formRegisterKey.currentState)?.validate() == true) {
                    viewModel.fetchRegister();
                  }
                },
                child: Text('Click Register'),
              ),
            ],
          ),
        ),
      );
    });
  }
}
