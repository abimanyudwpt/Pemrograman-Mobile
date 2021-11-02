import 'package:flutter/material.dart';
import 'package:project/Models/siswa.dart';
import 'package:project/Services/apiStatic.dart';
import 'package:project/UI/detailSiswa.dart';
import 'package:project/UI/homePage.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Daftar Siswa"),
        ),
        body: FutureBuilder<List<Siswa>>(
            future: ApiStatic.getSiswa(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                List<Siswa> listSiswa = snapshot.data!;
                return Container(
                  padding: EdgeInsets.all(5),
                  child: ListView.builder(
                    itemCount: listSiswa.length,
                    itemBuilder: (BuildContext context, int index) => Column(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      DetailSiswa(
                                        siswa: listSiswa[index],
                                      )));
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.only(top: 10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(
                                      width: 1, color: Colors.lightBlueAccent)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.account_circle),
                                  Column(
                                    children: [
                                      Text(listSiswa[index].nama),
                                      Text(
                                        listSiswa[index].jnsKel,
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                );
              }
            }),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 1,
          onTap: (i) {
            switch (i) {
              case 0:
                Navigator.of(context).pushReplacement(new MaterialPageRoute(
                    builder: (BuildContext context) => HomePage()));
                break;
              case 1:
                Navigator.of(context).pushReplacement(new MaterialPageRoute(
                    builder: (BuildContext context) => ListPage()));
                break;
              default:
            }
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle), label: "Siswa"),
          ],
        ));
  }
}
