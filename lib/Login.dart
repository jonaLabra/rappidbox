import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rappidbox/screens/home_screen.dart';

import 'Registro.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email;
  String _password;
  ProgressDialog progressDialog;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _widgetEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: Colors.white60),
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.yellow[600],
                ),
                hintText: 'Ingrese su email',
                hintStyle: TextStyle(
                    color: Colors.grey, letterSpacing: 1.5, fontSize: 18.0),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0)),
            validator: (String value) {
              if (value.isEmpty) {
                return '  Requiere email!';
              }
              if (!RegExp(
                      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                  .hasMatch(value)) {
                return '  Ingrese email valido!';
              }

              return null;
            },
            onSaved: (String value) {
              _email = value;
            },
          ),
        )
      ],
    );
  }

  Widget _widgetPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: Colors.white60),
          height: 60.0,
          child: TextFormField(
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.yellow[600],
                ),
                hintText: 'Contraseña',
                hintStyle: TextStyle(
                    color: Colors.grey, letterSpacing: 1.5, fontSize: 18.0),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0)),
            validator: (String value) {
              if (value.isEmpty) {
                return '  Requiere contraseña!';
              }
            },
            onSaved: (String value) {
              _password = value;
            },
          ),
        )
      ],
    );
  }

  Widget _widgetForgot() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => CupertinoAlertDialog(
          title: Text('Recuperar Contraseña'),
          content: Icon(Icons.lock_open),
        ),
        child: Text(
          'Olvido su contraseña?',
          style: TextStyle(
              fontSize: 15.0, color: Colors.white, fontStyle: FontStyle.italic),
        ),
        padding: EdgeInsets.only(right: 0.0),
      ),
    );
  }

  Widget _widgetButton() {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          if (!_formKey.currentState.validate()) {
            progressDialog = ProgressDialog(context,
                type: ProgressDialogType.Normal,
                isDismissible: false,
                showLogs: false);
            progressDialog.style(
                message: 'Iniciando Sesion...',
                borderRadius: 10.0,
                backgroundColor: Colors.white,
                progressWidget: CircularProgressIndicator(),
                elevation: 10.0,
                insetAnimCurve: Curves.easeInOut,
                progress: 0.0,
                textAlign: TextAlign.justify,
                maxProgress: 100.0,
                progressTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400),
                messageTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 19.0,
                    fontWeight: FontWeight.w600));
            progressDialog.show();
            return Future.delayed(Duration(seconds: 3)).then((value) => {
                  progressDialog.hide(),
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()))
                });
          }
          _formKey.currentState.save();
        },
        elevation: 8.0,
        padding: EdgeInsets.all(15.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: Colors.blue[500],
        child: Text('Log in',
            style: TextStyle(
                color: Colors.white, fontSize: 20.0, letterSpacing: 1.5)),
      ),
    );
  }

  Widget _widgetButtonFacebook() {
    return GestureDetector(
      onTap: () => print('Inicico con facebook'),
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, 2.0),
                  blurRadius: 6.0)
            ],
            image: DecorationImage(
                image: AssetImage('assets/facebook_logo.jpeg'))),
      ),
    );
  }

  Widget _widgetButtonGoogle() {
    return GestureDetector(
      onTap: () => print('Inicio con google'),
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, 2.0),
                  blurRadius: 6.0)
            ],
            image: DecorationImage(
                image: AssetImage('assets/gmail.jpg'), fit: BoxFit.cover)),
      ),
    );
  }

  Widget _widgetRegister() {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Registro())),
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: 'No tienes Cuenta?',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400)),
        TextSpan(
            text: 'Registrate',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold))
      ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        elevation: 0.5,
        title: Text('Login'),
        backgroundColor: Colors.yellow[600],
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.yellow[600],
          ),
          Form(
            key: _formKey,
            child: Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('assets/logo.png'),
                    ),
                    Text(
                      'Iniciar Sesion',
                      style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    _widgetEmail(),
                    SizedBox(
                      height: 30.0,
                    ),
                    _widgetPassword(),
                    _widgetForgot(),
                    _widgetButton(),
                    SizedBox(
                      width: 200.0,
                      height: 30.0,
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _widgetButtonFacebook(),
                          _widgetButtonGoogle(),
                        ],
                      ),
                    ),
                    _widgetRegister()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
