import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class User extends HiveObject{
  String? userId = '';
  String? phone = '';
  String? username = '';
  String? token = '';
  String? avatarImg = '';

  User({
    this.userId,
    this.phone,
    this.username,
    this.token,
    this.avatarImg,
  });

  @override
  String toString() {
    return 'User{userId: $userId, phone: $phone, username: $username,token: $token, avatarImg: $avatarImg}';
  }
}