import 'dart:convert';

import 'package:project/Models/siswa.dart';
// import 'package:http/http.dart' as http;

class ApiStatic {
  static final host = 'http://192.168.1.4';
  static gethost() {
    return host;
  }
  // static Future<List<Siswa>> getSiswa2() async {
  //   List<Siswa> siswa = [];
  //   for (var i = 0; i < 10; i++) {
  //     siswa.add(Siswa(
  //         id: i,
  //         nama: "nama" + i.toString(),
  //         tmpLahir: "tempat lahir",
  //         tglLahir: "10/10/2005",
  //         jnsKel: "Laki-Laki",
  //         kelas: "Kelas 8",
  //         createdAt: "",
  //         updatedAt: ""));
  //   }
  //   return siswa;
  // }

  static Future<List<Siswa>> getSiswa() async {
    String response =
        '{"message":"Success","data":[{"id":1,"nama":"Budi Doremi","tmp_lahir":"Singarja","tgl_lahir":"2001-05-12","jns_kelamin":"Laki - Laki","kelas":"7","created_at":"2021-10-27T03:08:56.000000Z","updated_at":"2021-10-27T03:08:56.000000Z"},{"id":3,"nama":"Desak Putri","tmp_lahir":"Singaraja","tgl_lahir":"2006-10-10","jns_kelamin":"Perempuan","kelas":"9","created_at":"2021-10-27T04:09:43.000000Z","updated_at":"2021-10-27T04:14:13.000000Z"}]}';
    try {
      var json = jsonDecode(response);
      final parsed = json['data'].cast<Map<String, dynamic>>();
      return parsed.map<Siswa>((json) => Siswa.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
    //   try {
    //     final respone = await http.get(Uri.parse("$host/api/datas"));
    //     if (respone.statusCode == 200) {
    //       var response;
    //       var json = jsonDecode(response.body);
    //       final parsed = json[''].cast<Map<String, dynamic>>();
    //       return parsed.map<Siswa>((json) => Siswa.fromJson(json)).toList();
    //     } else {
    //       return [];
    //     }
    //   } catch (e) {
    //     return [];
    //   }
  }
}
