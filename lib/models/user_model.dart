class UserModel {

  final String name;
  final String surname;
  final String uid;
  final String email;
  String bio;
  String profile_picture;
  Map<String,bool> preferences;
  Map<String,int> comments;
  //connections collection and privateuserinfo collection
  //uncompleted

  UserModel({this.comments =const {"":0},this.bio="", this.surname="", this.profile_picture="", this.preferences= const {"pref1":true}, required this.name, required this.uid, required this.email});

  UserModel copyWith({
    String? name,
    String? surname,
    String? bio,
    String? email,
    String? uid,
  }) {
    return UserModel(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      bio: bio ?? this.bio,
      email: email ?? this.email,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'surname': surname,
      'uid': uid,
      'email': email,
      'bio': bio,
      'profile_picture': profile_picture,
      "preferences":preferences,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      surname: map['surname'] ?? '',
      bio: map['bio'] ?? '',
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
    );
  }

  @override
  String toString() {
    return 'UserModel(name: $name, uid: $uid, email: $email )';
  }

  bool createUser(){

    return false;
  }
}
