class Member{
  final int id;
  final String name;
  final String password;
  final String nickname;
  final String picture;
  final String email;
  final bool isAdmin;

  Member({this.id, this.name, this.password, this.nickname, this.picture, this.email, this.isAdmin});

  factory Member.newMemberfromJson(Map<String, dynamic> json){
    return Member(
      id: json["Id"],
      name: json["Name"],
      password: json["Password"],
      email: json["Email"]
    );
  }
}