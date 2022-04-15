import 'package:flutter/material.dart';
import 'package:myapp/pageroutes.dart';

// ignore: camel_case_types
class navigationdrawer extends StatefulWidget {
  const navigationdrawer({Key? key}) : super(key: key);

  @override
  State<navigationdrawer> createState() => _navigationdrawerState();
}

// ignore: camel_case_types
class _navigationdrawerState extends State<navigationdrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          createDrawerBodyItem(
            icon: Icons.home,
            text: 'Home',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageroutes.home),
          ),
          createDrawerBodyItem(
            icon: Icons.account_circle,
            text: 'MarkSheet',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageroutes.marksheet),
          ),
          createDrawerBodyItem(icon: Icons.event_note, text: 'Events'),
          const Divider(),
          createDrawerBodyItem(
              icon: Icons.notifications_active, text: 'Notifications'),
          createDrawerBodyItem(icon: Icons.contact_phone, text: 'Contact Info'),
          const ListTile(
            title: Text('App version 1.0.0'),
          ),
          createDrawerBodyItem(
            icon: Icons.account_circle,
            text: 'Profile',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageroutes.marksheet),
          ),
        ],
      ),
    );
  }

  Widget createDrawerHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage('https://picsum.photos/200/300'))),
        child: Stack(children: const <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Welcome to Flutter",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget createDrawerBodyItem(
      {IconData? icon, String? text, GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(text!),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
