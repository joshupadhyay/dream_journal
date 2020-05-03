
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

  factory DreamEntryClass.fromMap(Map<String, dynamic> maps) {
    return DreamEntryClass(
        id: maps['id'],
        dreamTitle: maps['dreamtitle'],
        dreamLocation: maps['dreamlocation'],
        dreamPeople: maps['dreampeople'],
        isHappy: maps['isHappy'],
        isAngry: maps['isAngry'],
        isEmbarassed: maps['isEmbarassed'],
        isContemplative: maps['isContemplative'],
        isSad: maps['isSad'],
        isExcited: maps['isExcited'],
        isCool: maps['isCool'],
        isScared: maps['isScared'],
        date: DateTime.fromMicrosecondsSinceEpoch(maps['date'])

    );
  }


}





