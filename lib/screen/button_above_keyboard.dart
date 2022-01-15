import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/colors.dart';

import '../text_style.dart';

class ButtonAboveKeyboardScreen extends StatefulWidget {
  static String routeName = '/button_above_keyboard_page';

  @override
  _ButtonAboveKeyboardPageState createState() => _ButtonAboveKeyboardPageState();
}

class _ButtonAboveKeyboardPageState extends State<ButtonAboveKeyboardScreen> {
  TextEditingController _idController = TextEditingController();
  TextEditingController _passWordController = TextEditingController();

  bool _isValid = false;
  bool _isNewObscure = false;

  bool _isPasswordValid = false;
  bool _isPasswordObscure = false;

  @override
  void initState() {
    super.initState();
    _idController.addListener(() {});
    _passWordController.addListener(() {});
  }

  @override
  void dispose() {
    _idController.dispose();
    _passWordController.dispose();
    super.dispose();
  }

  void _passwordObscureToggle() {
    setState(() {
      _isPasswordObscure = !_isPasswordObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return GestureDetector(
      onTap: () {
        node.requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'Login Screen',
            style: kNotoSansMedium16.copyWith(color: AppColors.dark),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset('images/ic_back.png')),
        ),
        bottomSheet: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  primary: AppColors.azul,
                  onSurface: AppColors.blueGrey,
                ),
                onPressed: () {  },
                child: Text('Login'),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(text: 'ButtonAboveKeyboard Example', style: kNotoSansBold24.copyWith(color: AppColors.dark)),
                        ]),
                      ),
                      SizedBox(
                        height: 36.0,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _idController,
                        keyboardType: TextInputType.name,
                        obscureText: _isNewObscure,
                        style: kNotoSansMedium16.copyWith(color: AppColors.dark),
                        textInputAction: TextInputAction.next,
                        onEditingComplete: _isValid
                            ? () {
                                node.nextFocus();
                              }
                            : null,
                        autofocus: false,
                        cursorColor: AppColors.azul,
                        decoration: InputDecoration(
                          counterText: ' ',
                          labelText: "ID",
                          labelStyle: kNotoSansMedium12.copyWith(
                            color: AppColors.lightBlueGrey,
                          ),
                          hintText: 'ID',
                          hintStyle: kNotoSansMedium16.copyWith(
                            color: AppColors.lightBlueGrey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.azul,
                              width: 1.5,
                            ),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.lightBlueGrey,
                              width: 1.0,
                            ),
                          ),
                          alignLabelWithHint: true,
                          isDense: true,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _passWordController,
                        keyboardType: TextInputType.visiblePassword,
                        // validator: (String value) => passwordConfirmValidator(value, _newPasswordController.text),
                        obscureText: _isPasswordObscure,
                        style: kNotoSansMedium16.copyWith(color: AppColors.dark),
                        textInputAction: TextInputAction.done,
                        onEditingComplete: _isPasswordValid
                            ? () {
                                node.unfocus();
                              }
                            : null,
                        autofocus: false,
                        cursorColor: AppColors.azul,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: kNotoSansMedium12.copyWith(
                            color: AppColors.lightBlueGrey,
                          ),
                          hintText: 'Password',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.azul,
                              width: 1.5,
                            ),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.lightBlueGrey,
                              width: 1.0,
                            ),
                          ),
                          alignLabelWithHint: true,
                          isDense: true,
                          suffixIcon: _isPasswordObscure
                              ? IconButton(
                                  icon: Image.asset('images/invisible_icon.png'),
                                  onPressed: () => _passwordObscureToggle(),
                                )
                              : IconButton(
                                  icon: Image.asset('images/visible_icon.png'),
                                  onPressed: () => _passwordObscureToggle(),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
