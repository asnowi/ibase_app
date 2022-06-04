class LoginEntity {
  LoginEntity({
      this.id, 
      this.nickname, 
      this.username,
      this.token,
      this.icon,
  });

  LoginEntity.fromJson(dynamic json) {
    id = json['id'];
    nickname = json['nickname'];
    username = json['username'];
    token = json['token'];
    icon = json['icon'];
  }
  int? id;
  String? nickname;
  String? username;
  String? token;
  String? icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['nickname'] = nickname;
    map['username'] = username;
    map['token'] = token;
    map['icon'] = icon;
    return map;
  }

}