import 'package:flutter/material.dart';
import 'package:rappidbox/Registro.dart';

import 'Login.dart';

void main() {
  runApp(
    MaterialApp(home: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/Login': (BuildContext context) => new Login()
      },
      home: Scaffold(
        backgroundColor: Colors.yellow[600],
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/logo.png'),
            ),
            Text(
              'Bienvenido!',
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 45.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5),
            ),
            Text(
              'Cliente',
              style: TextStyle(
                  fontFamily: 'Quicksand Regular',
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            Card(
                color: Colors.white24,
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                child: FlatButton(
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Registro())),
                  child: ListTile(
                    leading: Icon(Icons.add_to_photos, color: Colors.white),
                    title: Text('Registrar una cuenta',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Quicksand Regular',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                  ),
                )),
            Card(
              color: Colors.white24,
              margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: FlatButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Login())),
                child: ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                  ),
                  title: Text('Ya tengo una cuenta',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Quicksand Regular',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            SizedBox(
              width: 200.0,
              height: 30.0,
              child: Divider(
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'RappidBox°',
                  style: TextStyle(
                      fontFamily: 'Lobster Regular',
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Delivery',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
