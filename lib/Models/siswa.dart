class Siswa {
  Siswa(
      {required this.id,
      required this.nama,
      required this.tmpLahir,
      required this.tglLahir,
      required this.jnsKel,
      required this.kelas,
      required this.createdAt,
      required this.updatedAt});
  int id;
  String nama;
  String tmpLahir;
  String tglLahir;
  String jnsKel;
  String kelas;
  String createdAt;
  String updatedAt;

  factory Siswa.fromJson(Map<String, dynamic> json) => Siswa(
        id: json["id"],
        nama: json["nama"].toString(),
        tmpLahir: json["tmp_lahir"].toString(),
        tglLahir: json["tgl_lahir"].toString(),
        jnsKel: json["jns_kelamin"].toString(),
        kelas: json["kelas"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
      );
}
