import 'package:closingwork/api/simpleapi.dart';
import 'package:closingwork/models/assetdetails.dart';
import 'package:closingwork/screens/closework.dart';
import 'package:flutter/material.dart';
import 'package:closingwork/global/data.dart' as global;
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DetailScreen extends StatefulWidget {
  final qrtext;

  DetailScreen({this.qrtext});

  DetailScreenState createState() => DetailScreenState();
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class DetailScreenState extends State<DetailScreen> {
  final RefreshController _refresh = RefreshController();
  TextEditingController no = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController loc = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController sn = TextEditingController();
  TextEditingController ip = TextEditingController();
  TextEditingController user = TextEditingController();
  TextEditingController mac = TextEditingController();
  TextEditingController ac = TextEditingController();
  int countd = 0;
  var dataQuery;

  Future _qrload() async {
    var obj = await CloseWorkApi().getDatafromAsset(widget.qrtext);
    AssetDetail ass = AssetDetail.fromJson(obj['data']);
    setState(() {
      no.text = widget.qrtext;
      desc.text = ass.assetdesc;
      loc.text = ass.assetloc;
      model.text = ass.modelno;
      sn.text = ass.sn;
      ip.text = ass.ip;
      user.text = ass.userauth;
      mac.text = ass.mac;
      ac.text = ass.acc;
      countd = obj['cnt'];
      dataQuery = obj['wr'];
    });
  }

  @override
  void initState() {
    _qrload();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(      
      controller: _refresh,
      enablePullDown: true,
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 1));
        _qrload();
        _refresh.refreshCompleted();
      },      
      child: Scaffold(
        appBar: AppBar(
          title: Text("IT Barcode Scaner"),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Column(
            children: <Widget>[
              assetno(),
              location(),
              macno(),
              ipno(),
              userauth(),
              Divider(
                height: 20,
                color: Colors.white,
              ),
              worklist()
            ],
          ),
        ),
        persistentFooterButtons: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Text(global.dataFlogin['username']),
          ),
        ],
      ),
    );
  }

  Widget assetno() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 0),
        child: TextField(
          controller: no,
          maxLines: 1,
          readOnly: true,
          focusNode: AlwaysDisabledFocusNode(),
          style: TextStyle(fontSize: 15),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(1)),
              ),
              labelText: "Asset No"),
        ),
      ),
    );
  }

  Widget location() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: TextField(
          controller: loc,
          maxLines: 1,
          readOnly: true,
          focusNode: AlwaysDisabledFocusNode(),
          style: TextStyle(fontSize: 15),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(1)),
              ),
              labelText: "Location"),
        ),
      ),
    );
  }

  Widget macno() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: TextField(
          controller: mac,
          maxLines: 1,
          readOnly: true,
          focusNode: AlwaysDisabledFocusNode(),
          style: TextStyle(fontSize: 15),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(1)),
              ),
              labelText: "Mac"),
        ),
      ),
    );
  }

  Widget ipno() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: TextField(
          controller: ip,
          maxLines: 1,
          readOnly: true,
          focusNode: AlwaysDisabledFocusNode(),
          style: TextStyle(fontSize: 15),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(1)),
              ),
              labelText: "IP"),
        ),
      ),
    );
  }

  Widget userauth() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: TextField(
          controller: user,
          maxLines: 1,
          readOnly: true,
          focusNode: AlwaysDisabledFocusNode(),
          style: TextStyle(fontSize: 15),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(1)),
              ),
              labelText: "User"),
        ),
      ),
    );
  }

  Widget worklist() {
    return Container(
      child: Expanded(
        child: ListView.builder(
          itemCount: countd,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(top: 5),
              color: Colors.white,
              child: ListTile(
                title: Text(
                  dataQuery[index]['WorkorderNo'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  return Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return CloseworkPage(
                            workorder: dataQuery[index]["WorkorderNo"]);
                      },
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
