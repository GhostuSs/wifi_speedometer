class Data{
  int downloadRate=0;
  int uploadRate=0;
  String isp='';
  String wifi='Unknown';
  String ip='';
  String device='';

  removeData(){
    downloadRate=0;
    uploadRate=0;
    isp='';
    wifi='Unknown';
    ip='';
    device='';
  }
}