import 'dart:async';
import 'package:closingwork/api/simpleapi.dart';
import 'package:closingwork/models/workorders.dart';
import 'package:flutter/material.dart';
import 'package:closingwork/global/data.dart' as global;
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class CloseworkPage extends StatefulWidget {
  final String workorder;

  CloseworkPage({this.workorder});

  _CloseworkPageState createState() => _CloseworkPageState();
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class _CloseworkPageState extends State<CloseworkPage> {
  TextEditingController daterec = new TextEditingController();
  TextEditingController pmsdate = new TextEditingController();
  TextEditingController pmedate = new TextEditingController();
  TextEditingController startdate = new TextEditingController();
  TextEditingController pbdesc = new TextEditingController();
  TextEditingController wkdesc = new TextEditingController();

  Future _wrload() async {
    var obj = await CloseWorkApi().getDetailfromWork(widget.workorder);
    Workorders wr = Workorders.fromJson(obj['data']);
    setState(() {
      daterec.text = wr.drec.toString();
      pmsdate.text = wr.pmstart.toString();
      pmedate.text = wr.pmend.toString();
      pbdesc.text = wr.pbdesc;
      wkdesc.text = wr.typedesc;
    });
  }

  @override
  void initState() {
    super.initState();
    _wrload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workorder),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Column(
          children: <Widget>[
            datereceived(),
            detailproblem(),
            worktypedesc(),
            pmstartdate(),
            pmenddate(),
            datestart(),
          ],
        ),
      ),
      floatingActionButton: btnclose(),
      persistentFooterButtons: <Widget>[
        Container(
          padding: EdgeInsets.only(right: 10),
          child: Text(global.dataFlogin['username']),
        ),
      ],
    );
  }

  Widget detailproblem() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: TextField(
          controller: pbdesc,
          maxLines: 4,
          readOnly: true,
          focusNode: AlwaysDisabledFocusNode(),
          style: TextStyle(fontSize: 15),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(1.0)),
            ),
            labelText: "Probleam Description",
          ),
        ),
      ),
    );
  }

  Widget datereceived() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: TextField(
          controller: daterec,
          maxLines: 1,
          readOnly: true,
          focusNode: AlwaysDisabledFocusNode(),
          style: TextStyle(fontSize: 15),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(1.0)),
            ),
            labelText: "Date Received",
          ),
        ),
      ),
    );
  }

  Widget worktypedesc() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: TextField(
          controller: wkdesc,
          maxLines: 1,
          readOnly: true,
          focusNode: AlwaysDisabledFocusNode(),
          style: TextStyle(fontSize: 15),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(1.0)),
            ),
            labelText: "WorkType Description",
          ),
        ),
      ),
    );
  }

  Widget pmstartdate() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: TextField(
          controller: pmsdate,
          maxLines: 1,
          readOnly: true,
          focusNode: AlwaysDisabledFocusNode(),
          style: TextStyle(fontSize: 15),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(1.0)),
            ),
            labelText: "PM StartDate",
          ),
        ),
      ),
    );
  }

  Widget pmenddate() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: TextField(
          controller: pmedate,
          maxLines: 1,
          readOnly: true,
          focusNode: AlwaysDisabledFocusNode(),
          style: TextStyle(fontSize: 15),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(1.0)),
            ),
            labelText: "PM EndDate",
          ),
        ),
      ),
    );
  }

  Widget datestart() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: TextField(
          controller: startdate,
          maxLines: 1,
          readOnly: true,
          // focusNode: AlwaysDisabledFocusNode(),
          onTap: () {
            DatePicker.showDateTimePicker(context, onChanged: (date) {
              setState(() {
                startdate.text = date.toString();
              });
            }, onConfirm: (date) {
              setState(() {
                startdate.text = date.toString();
              });
            }, currentTime: DateTime.now(), locale: LocaleType.en);
          },
          style: TextStyle(fontSize: 15),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(1.0)),
            ),
            labelText: "Start Date",
          ),
        ),
      ),
    );
  }

  Widget btnclose() {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: RaisedButton(
        onPressed: () {
          if (startdate.text != "") {
            CloseWorkApi().setDatetoWork(context, widget.workorder,
                startdate.text, global.dataFlogin['username']);
            Timer(Duration(seconds: 4), () {
              Navigator.of(context).pop();
            });
          }
        },
        textColor: Colors.white,
        color: Colors.red,
        child: Text(
          "CLOSE WORK",
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
