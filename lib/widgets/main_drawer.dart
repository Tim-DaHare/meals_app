import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildLink(String text, IconData icon, Function onTap) {
    return ListTile(
      leading: Icon(icon, size: 26),
      onTap: onTap,
      title: Text(
        text,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking up!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20),
          buildLink('Meals', Icons.restaurant,
              () => navigator.pushReplacementNamed('/')),
          buildLink('Filters', Icons.settings,
              () => navigator.pushReplacementNamed('/filters')),
        ],
      ),
    );
  }
}
