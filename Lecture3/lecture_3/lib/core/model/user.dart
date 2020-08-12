class User {
  String useremail;
  String name;
  List<String> reservations;

  User(String useremail, String name, List<String> reservations) {
    this.useremail = useremail;
    this.name = name;
    this.reservations = reservations;
  }
}
