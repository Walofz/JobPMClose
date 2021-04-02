import 'dart:core';

class Workorders {
  String pbdesc;
  String drec;
  String pmstart;
  String pmend;
  int type;
  String typedesc;

  Workorders(this.pbdesc, this.drec, this.pmstart, this.pmend, this.type,
      this.typedesc);

  Workorders.fromJson(Map<String, dynamic> json)
      : pbdesc = json['Pbdesc'],
        drec = json['Drec'],
        pmstart = json['PMStart'],
        pmend = json['PMEnd'],
        type = json['WType'],
        typedesc = json['WDesc'];
  
  Future<Set> toJson() async => {
        pbdesc = pbdesc,
        drec = drec,
        pmstart = pmstart,
        pmend = pmend,
        type = type,
        typedesc = typedesc,
      };
}
