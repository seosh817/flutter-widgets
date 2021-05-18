import 'package:flutter/material.dart';

class FormValidationScreen extends StatefulWidget {
  _FormValidationState createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidationScreen> {
  final _formKey = GlobalKey<
      FormState>(); //  GlobalKey는 위젯에 하나밖에 없는 키, Form 클래스 안에 들어있는 FormState를 제네릭에 넣어줌
  FocusNode nameFocusNode; // 포커스 노드는 다 사용하고 나면 해제를 해주어야함

  final nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameFocusNode = FocusNode();
  }

  @override
  void dispose() {
    nameFocusNode.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FormValidation'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey, // formKey를 통해서 formState를 알 수 있게 됨
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return '공백은 허용되지 않습니다.'; // validation 규칙을 작성해
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          // formkey가 Valid 한지 체크 가능
                          Scaffold.of(_formKey.currentContext)
                              .showSnackBar(SnackBar(
                            content: Text('처리중'),
                          )); // Scaffold의 Context를 사용하면 안 됨. 이건 Builder 말고도 formKey를 이용하는 방법임.
                        }
                      },
                      child: Text('Submit')),
                ),
                TextField(
                  controller: nameController,
                  onChanged: (text) {
                    print(text);
                  },
                  focusNode: nameFocusNode,
                  decoration: InputDecoration(
                      hintText: '이름을 입력해 주세요',
                      border: InputBorder.none,
                      labelText: '이름'),
                  autofocus: true,
                ),
                ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).requestFocus(nameFocusNode);
                    },
                    child: Text('포커스')),
                ElevatedButton(
                    onPressed: () {
                      print(nameController.text);
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                            content: Text(nameController.text)
                        );
                      });
                    },
                    child: Text('TextField 값 확인')),
              ],
            ),
          ),
        ));
  }
}
