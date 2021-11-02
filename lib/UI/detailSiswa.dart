import 'package:flutter/material.dart';
import 'package:project/Models/siswa.dart';

class DetailSiswa extends StatefulWidget {
  DetailSiswa({required this.siswa});
  final Siswa siswa;

  @override
  _DetailSiswaState createState() => _DetailSiswaState();
}

class _DetailSiswaState extends State<DetailSiswa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.siswa.nama),
      ),
      body: Container(
        width: double.infinity,
        child: ListView(
          children: [
            Icon(Icons.account_circle),
            Container(
              padding: EdgeInsets.all(5),
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [const Color(0xff3164bd), const Color(0xff295cb5)],
                ),
              ),
              child: Text(
                widget.siswa.jnsKel,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              color: Colors.orangeAccent,
              width: double.infinity,
              height: double.maxFinite,
              child: new Text(widget.siswa.tmpLahir),
            ),
          ],
        ),
      ),
    );
  }
}
