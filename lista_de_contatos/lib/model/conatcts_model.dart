
class ConatctsModel {
  int _id = 0;
  String _name = "";
  String _phoneNumber = "";
  String _profilePicture = "";
  ConatctsModel(
    this._name,
    this._phoneNumber,
    this._profilePicture,
  );

  int get id => _id;
  String get name => _name;
  String get phoneNumber => _phoneNumber;
  String get profilePicture => _profilePicture;

  set id(int id) {
    _id = id;
  }
  set name(String name) {
    _name = name;
  }
  set phoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
  }
  set profilePicture(String profilePicture) {
    _profilePicture = profilePicture;
  }
}
