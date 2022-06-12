class LoginEntity {
  LoginEntity({
      this.userId,
      this.nickname, 
      this.username,
      this.token,
      this.avatar,
  });

  LoginEntity.fromJson(dynamic json) {
    userId = json['userId'].toString();
    nickname = json['nickname'];
    username = json['username'];
    token = json['token'];
    avatar = json['avatar'];
  }
  String? userId;
  String? nickname;
  String? username;
  String? token;
  String? avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['nickname'] = nickname;
    map['username'] = username;
    map['token'] = token;
    map['avatar'] = avatar;
    return map;
  }

}