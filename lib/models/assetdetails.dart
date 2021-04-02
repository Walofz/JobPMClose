import 'dart:core';

class AssetDetail {
  String assetdesc;
  String assetloc;
  String userauth;
  String modelno;
  String sn;
  String ip;
  String mac;
  String acc;
  int status;

  AssetDetail(this.assetdesc, this.assetloc, this.userauth, this.modelno,
      this.sn, this.ip, this.mac, this.acc, this.status);

  AssetDetail.fromJson(Map<String, dynamic> json)
      : assetdesc = json['AssetDesc'],
        assetloc = json['AssetLocDesc'],
        userauth = json['UserAuth'],
        modelno = json['ModelNo'],
        sn = json['SN'],
        ip = json['IP'],
        mac = json['Mac'],
        acc = json['Account'];

  Future<Set> toJson() async => {
        assetdesc = assetdesc,
        assetloc = assetloc,
        userauth = userauth,
        modelno = modelno,
        sn = sn,
        ip = ip,
        mac = mac,
        acc = acc,
      };
}
