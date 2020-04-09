

//make an emotion class - icon, name of emotion
//dreamentry has a list of emotions, so you only have to add a new emotion once (to the list)
//emotionbuilder then just gets passed that list

class DreamEntry {
  String dreamTitle;
  String dreamPeople;
  String dreamLocation;
  bool isHappy;

  save() {
    //TODO: get firebase commands here
  }

  update() {
    //TODO: get firebase commands here
  }

  emotionToggle(){
    //TODO: get buttonpressed to toggle emotions, 1 method for each emotion?
  }

  DreamEntry(bool isHappy, {String dreamTitle, String dreamPeople, String dreamLocation}){
    this.dreamPeople = dreamPeople;
    this.dreamTitle = dreamTitle;
    this.dreamLocation = dreamLocation;
    this.isHappy = isHappy;
  }

  String setdreamPeople(text){
    this.dreamTitle = text;
  }

  String setdreamTitle(text){
    this.dreamTitle = text;
  }

}

