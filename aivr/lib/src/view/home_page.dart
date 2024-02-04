import 'package:aivr/src/helper/helpers.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: homeDrawer(),
        backgroundColor: Colors.amber,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            homeButton(
                "Bikin Laporan Baru",
                () async =>
                    {await delayedNavigationTo(context, 1, 0, 'laporan_baru')}),
            homeButton(
                "Baca Laporan Sebelumnya",
                () async =>
                    {await delayedNavigationTo(context, 1, 0, 'laporan_baru')}),
          ],
        )));
  }

  Widget homeDrawer() {
    return Drawer(
        child: ListView(
      children: const [
        DrawerHeader(
          child: Text('drawerheader'),
        ),
        ListTile(
          title: Text(''),
        ),
        ListTile(
          title: Text('Logout'),
        ),
      ],
    ));
  }

  Widget homeButton(String buttonText, Function onPressed) {
    return Container(
      height: 50,
      width: 180,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(2)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
        ),
        // Check if onPressed is null and provide a default behavior if it is
        onPressed: () async => await onPressed(),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }
}
