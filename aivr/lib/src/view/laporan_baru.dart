import 'package:aivr/src/helper/helpers.dart';
import 'package:aivr/src/view/laporan_baru/informasi_perusahaan.dart';
import 'package:flutter/material.dart';

class LaporanBaru extends StatefulWidget {
  const LaporanBaru({Key? key}) : super(key: key);

  @override
  _LaporanBaruState createState() => _LaporanBaruState();
}

class _LaporanBaruState extends State<LaporanBaru> {
  final Map<String, GlobalKey<FormState>> _formkeys = {
    'Detail Karyawan': GlobalKey(debugLabel: 'detail_karyawan'),
    'Informasi Perusahaan': GlobalKey(debugLabel: 'informasi_perusahaan'),
    'Isi Pertemuan': GlobalKey(debugLabel: 'isi_pertemuan'),
    'Autorisasi & Submit': GlobalKey(debugLabel: 'autorisasi_and_submit')
  };
  @override
  Widget build(BuildContext context) {
    return AppBarWithTabs(title: 'Laporan Baru', formkeys: _formkeys);
  }
}

class AppBarWithTabs extends StatelessWidget {
  final String title;
  final Map<String, GlobalKey<FormState>> formkeys;
  const AppBarWithTabs(
      {super.key, required this.title, required this.formkeys});

  @override
  Widget build(BuildContext context) {
    final List<String> tabNames = formkeys.keys.toList();
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    final int tabsCount = formkeys.length;
    return DefaultTabController(
      initialIndex: 1,
      length: tabsCount,
      child: Scaffold(
        appBar: AppBar(
          // Leading widget: Back button
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () async {
              await delayedNavigationTo(context, 0, 50, 'home');
            },
          ),
          // Title: Centered text
          centerTitle: true,
          title: Text(title),
          // This check specifies which nested Scrollable's scroll notification
          // should be listened to.
          //
          // When `ThemeData.useMaterial3` is true and scroll view has
          // scrolled underneath the app bar, this updates the app bar
          // background color and elevation.
          //
          // This sets `notification.depth == 1` to listen to the scroll
          // notification from the nested `ListView.builder`.
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          // The elevation value of the app bar when scroll view has
          // scrolled underneath the app bar.
          scrolledUnderElevation: 4.0,
          shadowColor: Theme.of(context).shadowColor,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: const Icon(Icons.cloud_outlined),
                text: tabNames[0],
              ),
              Tab(
                icon: const Icon(Icons.cloud_outlined),
                text: tabNames[1],
              ),
              Tab(
                icon: const Icon(Icons.beach_access_sharp),
                text: tabNames[2],
              ),
              Tab(
                icon: const Icon(Icons.brightness_5_sharp),
                text: tabNames[3],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            InformasiPerusahaan(
              formkey: formkeys['Informasi Perusahaan']!,
            ),
            ListView.builder(
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  tileColor: index.isOdd ? oddItemColor : evenItemColor,
                  title: Text('${tabNames[0]} $index'),
                );
              },
            ),
            ListView.builder(
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  tileColor: index.isOdd ? oddItemColor : evenItemColor,
                  title: Text('${tabNames[1]} $index'),
                );
              },
            ),
            ListView.builder(
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  tileColor: index.isOdd ? oddItemColor : evenItemColor,
                  title: Text('${tabNames[2]} $index'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
