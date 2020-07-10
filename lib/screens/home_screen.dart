import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget _widgetSearchView() {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Icon(
                FontAwesomeIcons.search,
                color: Colors.yellow[600],
              ),
              onTap: () {},
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
                child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: "Buscar..."),
              onSubmitted: (String search) {},
            ))
          ],
        ),
      ),
    );
  }

  final List<String> _listItem = [
    'assets/coffe.png',
    'assets/desserts.png',
    'assets/drinks.png',
    'assets/others.png',
    'assets/logo.png'
  ];

  Widget _widgetDrawe() {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            color: Colors.yellow[600],
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(top: 30.0, bottom: 10.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
                          fit: BoxFit.cover)),
                ),
                Text('Nombre de usuario',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontFamily: 'Lobster Regular',
                    )),
                Text('Correo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ))
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Ubcacion',
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 20.0,
                )),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.phone),
            title: Text('Telefono',
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 20.0,
                )),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Pedidos',
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 20.0,
                )),
          ),
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text('Cerrar Sesion',
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 20.0,
                )),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.grey,
                size: 30.0,
              ),
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              }),
          actions: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                FontAwesomeIcons.shoppingCart,
                color: Colors.grey,
              ),
            )
          ],
          centerTitle: true,
          elevation: 0.5,
          title: Text(
            'Menu',
            style: TextStyle(color: Colors.yellow[600]),
          ),
          backgroundColor: Colors.white),
      drawer: _widgetDrawe(),
      body: SafeArea(
        child: Column(children: [
          _widgetSearchView(),
          Container(
            child: Expanded(
              child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: _listItem
                      .map((e) => Card(
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            color: Colors.white,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                      image: AssetImage(e), fit: BoxFit.cover)),
                            ),
                          ))
                      .toList()),
            ),
          )
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        selectedItemColor: Colors.yellow[600],
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.restaurant,
                color: Colors.grey,
              ),
              title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.search,
                color: Colors.grey,
              ),
              title: Text('Menu')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.grey,
              ),
              title: Text('Favorites')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_basket,
                color: Colors.grey,
              ),
              title: Text('Orders'))
        ],
      ),
    );
  }
}
