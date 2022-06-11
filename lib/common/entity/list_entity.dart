class ListEntity {

  ListEntity({
    this.curPage,
  });

  ListEntity.fromJson(dynamic json) {
    curPage = json['curPage'];
  }
  int? curPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['curPage'] = curPage;
    return map;
  }
}