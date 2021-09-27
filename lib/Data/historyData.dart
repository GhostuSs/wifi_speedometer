
class Result{
  Result({required this.isp});
  int id=0;
  int downloadRate=0;
  int uploadRate=0;
  String isp='';
  String wifi='Unknown';
  String ip='';
  String device='';

  Result.fromMap(Map map) :
        this.id = map['title'],
        this.downloadRate = map['completed'],
        this.uploadRate = map['uploadRate'],
        this.isp = map['isp'],
        this.wifi = map['wifi'],
        this.ip = map['ip'],
        this.device = map['device'];

  Map toMap(){
    return {
      'id': this.id,
      'downloadRate': this.downloadRate,
      'uploadRate' : this.uploadRate,
      'isp' : this.isp,
      'wifi' : this.wifi,
      'ip' : this.ip,
      'device' : this.device
    };
  }

}