class LoginEntity {
  LoginEntity({
      this.userId,
      this.nickname, 
      this.username,
      this.phone,
      this.gender,
      this.avatarUrl,
      this.token,
      this.email,
      this.lastIp,
  });

  LoginEntity.fromJson(dynamic json) {
    userId = json['userId'].toString();
    nickname = json['nickname'];
    username = json['username'];
    phone = json['phone'];
    gender = json['gender'];
    avatarUrl = json['avatarUrl'];
    token = json['token'];
    email = json['email'];
    lastIp = json['lastIp'];
  }
  String? userId;
  String? nickname;
  String? username;
  String? phone;
  int? gender;
  String? avatarUrl;
  String? token;
  String? email;
  String? lastIp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['nickname'] = nickname;
    map['username'] = username;
    map['phone'] = phone;
    map['gender'] = gender;
    map['avatarUrl'] = avatarUrl;
    map['token'] = token;
    map['email'] = email;
    map['lastIp'] = lastIp;
    return map;
  }

}