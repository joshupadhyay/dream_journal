

class DreamEntry {
  static const bool Happy = false;
  static const bool Sad = false;
  String dreamTitle = 'Dream Entry';
  List<String> dreamPeople = ['test'];
  List<String> dreamplaces = ['test'];
  Map emotions = {
    Happy: false,
    Sad: false
  };

  save() {
    print('saving user using a web service');
  }
}