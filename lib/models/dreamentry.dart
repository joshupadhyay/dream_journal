

//make an emotion class - icon, name of emotion
//dreamentry has a list of emotions, so you only have to add a new emotion once (to the list)
//emotionbuilder then just gets passed that list

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

  String setdreamPeople(text){
    this.dreamTitle = text;
  }

  String setdreamTitle(text){
    this.dreamTitle = text;
  }


}

DreamEntry newEntry = DreamEntry(true,
  dreamTitle:"test",);

