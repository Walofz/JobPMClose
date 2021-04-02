import 'package:closingwork/api/simpleapi.dart';
import 'package:flutter/material.dart';

class CloseWorkLogin extends StatefulWidget {
  final Color backgroundColor1;
  final Color backgroundColor2;
  final Color highlightColor;
  final Color foregroundColor;
  
  CloseWorkLogin(
      {Key k,
      this.backgroundColor1,
      this.backgroundColor2,
      this.highlightColor,
      this.foregroundColor});

  CloseWorkLoginState createState() => CloseWorkLoginState();
}

class CloseWorkLoginState extends State<CloseWorkLogin> {
  final TextEditingController user = new TextEditingController();
  final TextEditingController pass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.centerLeft,
          end: new Alignment(1, 0),
          colors: [widget.backgroundColor1, widget.backgroundColor2],
          tileMode: TileMode.repeated,
        ),
      ),
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 100, bottom: 50),
            child: Center(
              child: new Column(
                children: <Widget>[
                  Container(
                    height: 128,
                    width: 128,
                    child: new CircleAvatar(
                      backgroundColor: Colors.transparent,
                      foregroundColor: widget.foregroundColor,
                      radius: 100,
                      child: new Text(
                        "4C",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: widget.foregroundColor,
                        width: 1,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(15),
                    child: new Text(
                      "4C SQL Close by IT",
                      style: TextStyle(color: widget.foregroundColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40, right: 40),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: widget.foregroundColor,
                  width: 0.5,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            padding: const EdgeInsets.only(right: 10),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Icon(
                    Icons.account_box,
                    color: widget.foregroundColor,
                  ),
                ),
                new Expanded(
                  child: TextField(
                    controller: user,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "username",
                      hintStyle: TextStyle(color: widget.foregroundColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40, right: 40, top: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: widget.foregroundColor,
                    width: 0.5,
                    style: BorderStyle.solid),
              ),
            ),
            padding: const EdgeInsets.only(right: 10),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Icon(
                    Icons.lock_open,
                    color: widget.foregroundColor,
                  ),
                ),
                new Expanded(
                  child: TextField(
                    controller: pass,
                    obscureText: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "**********",
                      helperStyle: TextStyle(color: widget.foregroundColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40, right: 40, top: 30),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    color: widget.highlightColor,
                    onPressed: () => {
                      CloseWorkApi()
                          .login(context, user.text, pass.text)
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: widget.foregroundColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
