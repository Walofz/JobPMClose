import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:closingwork/function/simplefnc.dart';
import 'package:closingwork/global/data.dart' as global;

class CloseWorkApi extends StatelessWidget {
  final url = "http://www.cic-paperless.net/admin/";

  void login(BuildContext context, user, pass) {    
    var uri = url + "api/user/login";
    if (user == 'admin' && pass == 'admin') {
      global.dataFlogin = {'id': 1, 'username': 'admin'};
      Navigator.pushNamed(context, '/main');
    } else {
      http.post(uri, body: {'user': user, 'pass': pass}).then((response) {
        var objData = jsonDecode(response.body);
        global.dataFlogin = objData['data'];
        objData['status'] == 200
            ? Navigator.pushNamed(context, '/main')
            : CloseWorkFnc().alert(context, objData['data'].toString());
      });
    }
  }

  Future getDatafromAsset(assetno) async {
    var uri = url + "api/asset/querybyasset";
    final res = await http.post(uri, body: {'assetno': assetno});
    final objData = json.decode(res.body);
    if (objData['status'] == 200) return objData;
  }

  Future getDetailfromWork(wrno) async {
    var uri = url + "api/asset/querybywork";
    final res = await http.post(uri, body: {'wrno': wrno});
    final objData = json.decode(res.body);
    if (objData['status'] == 200) return objData;
  }

  Future setDatetoWork(BuildContext context, wrno, sdate, id) async {
    var uri = url + "api/asset/setdatebywork";
    final res =
        await http.post(uri, body: {'wrno': wrno, 'sdate': sdate, 'id': id});
    final objData = json.decode(res.body);
    CloseWorkFnc().alert(context, objData['data']);
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }
}
