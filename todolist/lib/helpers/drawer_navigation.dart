import 'package:flutter/material.dart';
import 'package:todolist/screens/categories_screen.dart';
import 'package:todolist/screens/home_screen.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({Key? key}) : super(key: key);

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://images.alphacoders.com/681/thumb-1920-681587.png'),
              ),
                accountName: Text('Berat Akay'),
                accountEmail: Text('beratakay.98@hotmail.com'),
            decoration: BoxDecoration(color: Colors.blue) ,),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen())),
            ),
            ListTile(
              leading: Icon(Icons.view_list),
              title: Text('Categories'),
              onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoriesScreen())),
            ),
          ],
        ),
      ),
    );
  }
}
