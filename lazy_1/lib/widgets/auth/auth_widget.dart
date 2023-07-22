import 'package:flutter/material.dart';
import 'package:lazy_1/widgets/main_screen/main_screen_widget.dart';

import '../../Theme/app_button_style.dart';


// class MyScrollBehavior extends ScrollBehavior {
//   const MyScrollBehavior();
//   @override
//   ScrollPhysics getScrollPhysics(BuildContext context) => const BouncingScrollPhysics();
// }


class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("login to your account"),
        centerTitle: true,
      ),
      body: ListView(
        clipBehavior: Clip.hardEdge,
        // physics:  ScrollPhysics(),
        children: const [
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
          ),
          _FormWidget(),
          SizedBox(
            height: 25,
          ),
          Text(
            "First Text OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
            "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
            "OOOOOOOOOO. Click here to get started",
            style: textStyle,
          ),
          TextButton(
            style: AppButtonStyle.buttonStyle,
            onPressed: (){},
            child: Text("Register"),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Second Text OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
              "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
              "OOOOOOOOOO. Click here to verify email.",
            style: textStyle,
          ),
          TextButton(
            style: AppButtonStyle.buttonStyle,
            onPressed: (){},
            child: Text("Verify email"),
          ),
        ],
      ),
    );
  }
}


class _FormWidget extends StatefulWidget {
  const _FormWidget({super.key});

  @override
  State<_FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {

  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;

      final navigator = Navigator.of(context);
      // navigator.push(MaterialPageRoute<void>(builder: (context) => MainScreenWidget() ));
      // navigator.pushNamed('/main_screen');
      navigator.pushReplacementNamed('/main_screen');
      
      print('open app');
    } else {
      errorText = 'error in validation';
    }
    setState(() {

    });
  }

  void _resetPassword() {
    print('reset password');
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Color(0xFF212529),
    );
    const textFieldDecoration = InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF01B4E4))
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      isCollapsed: true,
    );
    final errorText = this.errorText;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(
            '$errorText',
            style: TextStyle(
              color: Colors.red,
              fontSize: 22,
            ),
          ),
          SizedBox(height: 25,),
        ],
        Text("username", style: textStyle,),
        TextField(
          controller: _loginTextController,
          decoration: textFieldDecoration,
        ),
        SizedBox(height: 20,),
        Text("password", style: textStyle,),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDecoration,
          obscureText: true,
        ),
        SizedBox(height: 25,),
        Row(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF01B4E4)),
                foregroundColor: MaterialStatePropertyAll(Colors.white),
                textStyle: MaterialStateProperty.all(
                    TextStyle(
                      fontSize: 16,
                    ),
                ),
              ),
              onPressed: _auth,
              child: Text("Login"),
            ),
            SizedBox(width: 20,),
            TextButton(
              style: AppButtonStyle.buttonStyle,
              onPressed: _resetPassword,
              child: Text("reset password"),
            ),
          ],
        ),
      ],
    );
  }
}
