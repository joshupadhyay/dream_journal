

class DreamEntry {
  String dreamTitle;
  String dreamPeople;
  bool isHappy;

  save() {
    print('saving user using a web service');
  }


  DreamEntry(bool isHappy, {String dreamTitle, String dreamPeople}){
    this.dreamPeople = dreamPeople;
    this.dreamTitle = dreamTitle;
    this.isHappy = isHappy;
  }
}

DreamEntry newEntry = DreamEntry(true,
  dreamTitle:"test",);

