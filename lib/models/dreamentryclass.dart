
class DreamEntryClass {
  int id;
  String dreamTitle;
  String dreamPeople;
  String dreamLocation;
  DateTime date;
  int isAngry;
  int isEmbarassed;
  int isContemplative;
  int isExcited;
  int isHappy;
  int isCool;
  int isSad;
  int isScared;


  DreamEntryClass({this.dreamTitle, this.dreamPeople, this.dreamLocation, this.date,this.isAngry, this.isEmbarassed,
  this.isContemplative, this.isExcited, this.isHappy, this.isCool, this.isSad, this.isScared, this.id}){}


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dreamtitle': dreamTitle,
      'dreamlocation': dreamLocation,
      'dreampeople': dreamPeople,
      'isAngry': isAngry,
      'isEmbarassed': isEmbarassed,
      'isContemplative': isContemplative,
      'isExcited': isExcited,
      'isHappy': isHappy,
      'isCool': isCool,
      'isSad': isSad,
      'isScared': isScared,
      'date': date.microsecondsSinceEpoch //DateTime as an INT for SQLite Storing
    };
  }

  factory DreamEntryClass.fromMap(List<Map<String, dynamic>> maps, int i) {
    return DreamEntryClass(
        id: maps[i]['id'],
        dreamTitle: maps[i]['dreamtitle'],
        dreamLocation: maps[i]['dreamlocation'],
        dreamPeople: maps[i]['dreampeople'],
        isHappy: maps[i]['isHappy'],
        isAngry: maps[i]['isAngry'],
        isEmbarassed: maps[i]['isEmbarassed'],
        isContemplative: maps[i]['isContemplative'],
        isSad: maps[i]['isSad'],
        isExcited: maps[i]['isExcited'],
        isCool: maps[i]['isCool'],
        isScared: maps[i]['isScared'],
        date: DateTime.fromMicrosecondsSinceEpoch(maps[i]['date'])

    );
  }


}





