class LoginEntity {
  LoginEntity({
      this.id, 
      this.nickname, 
      this.username,});

  LoginEntity.fromJson(dynamic json) {
    id = json['id'];
    nickname = json['nickname'];
    username = json['username'];
  }
  int? id;
  String? nickname;
  String? username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['nickname'] = nickname;
    map['username'] = username;
    return map;
  }

}