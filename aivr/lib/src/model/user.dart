class User {
  String id;
  String name;
  String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });

  // Method to update user information
  void updateDetails({String? name, String? email}) {
    if (name != null) {
      this.name = name;
    }
    if (email != null) {
      this.email = email;
    }
  }

  // Method to display user information
  String get userInfo => 'ID: $id, Name: $name, Email: $email}';

  // Additional methods can be added here, such as toJson, fromJson, etc.
}
