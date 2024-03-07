class MFList {
  late int id;
  late String myfavourite;

  MFList(this.id, this.myfavourite);

  static MFList fromMap(Map map) {
    return MFList(
      map['id'] as int,
      map['myfavourite'] as String,
    );
  }
}