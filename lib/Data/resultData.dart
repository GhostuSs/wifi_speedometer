import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Data{
  String? dateTime='';
  int? downloadRate=0;
  int? uploadRate=0;
  String? isp='';
  String? wifi='Unknown';
  String? ip='';
  String? device='';
  Data({this.dateTime,this.downloadRate,this.uploadRate,this.wifi,this.ip,this.device,this.isp});
  removeData(){
    dateTime='';
    downloadRate=0;
    uploadRate=0;
    isp='';
    wifi='Unknown';
    ip='';
    device='';
  }
  Map<String,dynamic> toJson(){
    return{
      'dateTime':dateTime,
      'downloadRate':downloadRate,
      'uploadRate':uploadRate,
      'isp':isp,
      'wifi':wifi,
      'ip':ip,
      'device':device
    };
  }
  Data.fromJson(Map<String,dynamic> json){
    dateTime=json['dateTime'];
    downloadRate=json['downloadRate'];
    uploadRate=json['uploadRate'];
    isp=json['isp'];
    wifi=json['wifi'];
    ip=json['ip'];
    device=json['device'];
  }
  fromJson(Map<String,dynamic> json){
    dateTime=json['dateTime'];
    downloadRate=json['downloadRate'];
    uploadRate=json['uploadRate'];
    isp=json['isp'];
    wifi=json['wifi'];
    ip=json['ip'];
    device=json['device'];
  }
}