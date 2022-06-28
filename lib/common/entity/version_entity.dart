class VersionEntity {
  VersionEntity({
    this.id,
    this.fileInfoId,
    this.type,
    this.hasUpdate,
    this.ignorable,
    this.versionCode,
    this.versionName,
    this.updateContent,
    this.downloadUrl,
    this.appId,
    this.createTime,
  });

  VersionEntity.fromJson(dynamic json) {
    id = json['id'].toString();
    fileInfoId = json['fileInfoId'].toString();
    type = json['type'].toString();
    hasUpdate = json['hasUpdate'];
    ignorable = json['ignorable'];
    versionCode = json['versionCode'];
    versionName = json['versionName'];
    updateContent = json['updateContent'];
    downloadUrl = json['downloadUrl'];
    appId = json['appId'];
    createTime = json['createTime'];
  }

  String? id;
  String? fileInfoId;
  String? type;
  bool? hasUpdate;
  bool? ignorable;
  int? versionCode;
  String? versionName;
  String? updateContent;
  String? downloadUrl;
  String? appId;
  String? createTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['fileInfoId'] = fileInfoId;
    map['type'] = type;
    map['hasUpdate'] = hasUpdate;
    map['ignorable'] = ignorable;
    map['versionCode'] = versionCode;
    map['versionName'] = versionName;
    map['updateContent'] = updateContent;
    map['downloadUrl'] = downloadUrl;
    map['appId'] = appId;
    map['createTime'] = createTime;
    return map;
  }

}