class ListEntity {

  ListEntity({
    this.more,
    this.artists,
  });

  ListEntity.fromJson(dynamic json) {
    more = json['more'];
    if (json['artists'] != null) {
      artists = [];
      json['artists'].forEach((v) {
        artists?.add(ArtistsEntity.fromJson(v));
      });
    }
  }
  bool? more;
  List<ArtistsEntity>? artists;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['more'] = more;
    if (artists != null) {
      map['artists'] = artists?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}


class ArtistsEntity {
  ArtistsEntity({
    this.name,
    this.picUrl,
    this.img1v1Url,
    this.fansCount,
  });

  ArtistsEntity.fromJson(dynamic json) {
    name = json['name'];
    picUrl = json['picUrl'];
    img1v1Url = json['img1v1Url'];
    fansCount = json['fansCount']?? 0;
  }
  String? name;
  String? picUrl;
  String? img1v1Url;
  int? fansCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['picUrl'] = picUrl;
    map['img1v1Url'] = img1v1Url;
    map['fansCount'] = fansCount;
    return map;
  }

}