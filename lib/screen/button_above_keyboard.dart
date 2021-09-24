

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
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _newConfirmPasswordController = TextEditingController();

  bool _isNewValid;
  bool _isNewObscure;

  bool _isNewConfirmValid;
  bool _isNewConfirmObscure;


  void _newObscureToggle() {
    setState(() {
      _isNewObscure = !_isNewObscure;
    });
  }

  void _newConfirmObscureToggle() {
    setState(() {
      _isNewConfirmObscure = !_isNewConfirmObscure;
    });
  }

  @override
  void initState() {
    super.initState();
    _isNewValid = false;
    _isNewObscure = true;
    _isNewConfirmValid = false;
    _isNewConfirmObscure = true;
    _newPasswordController.addListener(() {
    });
    _newConfirmPasswordController.addListener(() {
    });
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _newConfirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    var appBar = AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      title: Text(
        '로그인',
        style: kNotoSansMedium16.copyWith(color: AppColors.dark),
      ),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset('images/ic_back.png')),
    );
    return GestureDetector(
      onTap: () {
        node.requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: appBar,
        bottomSheet: Padding(
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
              child: Text('확인'),
            ),
          ),
        ),
        body: SingleChildScrollView(
          reverse: true,
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height - appBar.preferredSize.height,
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
                          TextSpan(text: 'ButtonAboveKeybaord', style: kNotoSansBold24.copyWith(color: AppColors.dark)),
                          TextSpan(text: ' 테스트', style: kNotoSansMedium24.copyWith(color: AppColors.dark)),
                        ]),
                      ),
                      SizedBox(
                        height: 36.0,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.number,
                        style: kNotoSansMedium16.copyWith(color: AppColors.dark),
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () {
                          node.nextFocus();
                        },
                        autofocus: false,
                        cursorColor: AppColors.azul,
                        decoration: InputDecoration(
                          counterText: ' ',
                          labelText: "확인코드",
                          labelStyle: kNotoSansMedium12.copyWith(
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
                        controller: _newPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        // validator: passwordValidator,
                        obscureText: _isNewObscure,
                        style: kNotoSansMedium16.copyWith(color: AppColors.dark),
                        textInputAction: TextInputAction.next,
                        onEditingComplete: _isNewValid
                            ? () {
                          node.nextFocus();
                        }
                            : null,
                        autofocus: false,
                        cursorColor: AppColors.azul,
                        decoration: InputDecoration(
                          counterText: ' ',
                          labelText: "새 비밀번호",
                          labelStyle: kNotoSansMedium12.copyWith(
                            color: AppColors.lightBlueGrey,
                          ),
                          hintText: '새 비밀번호(영문 숫자 8자리 이상)',
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
                        controller: _newConfirmPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        // validator: (String value) => passwordConfirmValidator(value, _newPasswordController.text),
                        obscureText: _isNewConfirmObscure,
                        style: kNotoSansMedium16.copyWith(color: AppColors.dark),
                        textInputAction: TextInputAction.done,
                        onEditingComplete: _isNewConfirmValid
                            ? () {
                          node.unfocus();
                        }
                            : null,
                        autofocus: false,
                        cursorColor: AppColors.azul,
                        decoration: InputDecoration(
                          counterText: ' ',
                          labelText: "새 비밀번호 재입력",
                          labelStyle: kNotoSansMedium12.copyWith(
                            color: AppColors.lightBlueGrey,
                          ),
                          hintText: '새 비밀번호 재입력(영문 숫자 8자리 이상)',
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
