class ListEntity {

  ListEntity({
    this.current,
    this.total,
    this.pages,
    this.size,
  });

  ListEntity.fromJson(dynamic json) {
    current = json['current'];
    total = json['total'];
    pages = json['pages'];
    size = json['size'];

    if (json['list'] != null) {
        list = [];
        json['list'].forEach((v) {
        list?.add(RecordEntity.fromJson(v));
      });
    }
  }
  int? current;
  int? total;
  int? pages;
  int? size;
  List<RecordEntity>? list;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (list != null) {
      map['list'] = list?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}


class RecordEntity {
  RecordEntity({
    this.id,
    this.userId,
    this.username,
    this.phone,
    this.ip,
    this.createTime,
  });

  RecordEntity.fromJson(dynamic json) {
    id = json['id'].toString();
    userId = json['userId'].toString();
    username = json['username'];
    phone = json['phone'];
    ip = json['ip'];
    createTime = json['createTime'];
  }
  String? id;
  String? userId;
  String? username;
  String? phone;
  String? ip;
  String? createTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userId'] = userId;
    map['username'] = username;
    map['phone'] = phone;
    map['ip'] = ip;
    map['createTime'] = createTime;
    return map;
  }

}