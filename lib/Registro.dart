import 'package:flutter/material.dart';

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  int _currentStep = 0;
  Widget _widgetEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: Colors.white60),
          height: 60.0,
          child: TextField(
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
          child: TextField(
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
          ),
        )
      ],
    );
  }

  Widget _widgetName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: Colors.white60),
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person_add,
                  color: Colors.yellow[600],
                ),
                hintText: 'Nombre',
                hintStyle: TextStyle(
                    color: Colors.grey, letterSpacing: 1.5, fontSize: 18.0),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0)),
          ),
        )
      ],
    );
  }

  Widget _widgetPhone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: Colors.white60),
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.phone,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.yellow[600],
                ),
                hintText: 'Numero Telefono',
                hintStyle: TextStyle(
                    color: Colors.grey, letterSpacing: 1.5, fontSize: 18.0),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0)),
          ),
        )
      ],
    );
  }

  Widget _widgetButton() {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(20.0),
                  ),
                  child: Container(
                    height: 200,
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Ejemplo de registro exitoso"),
                          ),
                          SizedBox(
                            width: 320.0,
                            child: RaisedButton(
                              onPressed: null,
                              color: Colors.green,
                              child: Text(
                                'Confirmar',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
        elevation: 8.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: Colors.green,
        child: Text('Registrar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
      ),
    );
  }

  Widget _steperWidget() {
    return Stepper(
      steps: _myStep(),
      //type: StepperType.horizontal,
      currentStep: this._currentStep,
      onStepCancel: () {
        setState(() {
          if (this._currentStep > 0) {
            this._currentStep = this._currentStep - 1;
          } else {
            this._currentStep = 0;
          }
        });
      },
      onStepContinue: () {
        setState(() {
          if (this._currentStep < this._myStep().length - 1) {
            this._currentStep = this._currentStep + 1;
          } else {
            print('Completar o confirmar el texto');
          }
        });
      },
      controlsBuilder: (context, {onStepCancel, onStepContinue}) {
        return Row(children: [
          RaisedButton(
            onPressed: onStepContinue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            color: Colors.blue[500],
            child: Text('Next',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                )),
          ),
          FlatButton(
              onPressed: onStepCancel,
              child: Text(
                'Back',
                style: TextStyle(color: Colors.white),
              ))
        ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        elevation: 0.5,
        title: Text('Registro de usuario'),
        backgroundColor: Colors.yellow[600],
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            color: Colors.yellow[600],
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('assets/logo.png'),
                  ),
                  _steperWidget()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Step> _myStep() {
    List<Step> _steps = [
      Step(
          content: _widgetName(),
          title: Text('Cual es su nombre?',
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          isActive: _currentStep > 0),
      Step(
          content: _widgetPhone(),
          title: Text('Ingrese un telefono',
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          isActive: _currentStep > 1),
      Step(
          content: _widgetEmail(),
          title: Text('Ingrese un email',
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          isActive: _currentStep > 2),
      Step(
          title: Text('Ingrese una contrasña',
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          content: _widgetPassword(),
          isActive: _currentStep > 3),
      Step(
        state: StepState.complete,
        title: Text('Los datos son correctos?',
            style: TextStyle(color: Colors.white, fontSize: 20.0)),
        subtitle:
            Text('Terminar registro', style: TextStyle(color: Colors.white)),
        content: _widgetButton(),
      )
    ];
    return _steps;
  }
}
