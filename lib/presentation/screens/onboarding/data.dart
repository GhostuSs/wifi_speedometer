
class SliderModel{
  String imagePath;
  String title;
  String desc;
  
  SliderModel({required this.imagePath,required this.title,required this.desc});
}

List<SliderModel> getSlides(){
  List<SliderModel> slides = List.empty(growable: true);
  slides.add(SliderModel(
      imagePath: 'assets/onboarding/wifirouter.png',
      title: 'Internet Speedtest',
      desc: 'Find out the connection speed'));
  slides.add(SliderModel(
      imagePath: 'assets/onboarding/feedback.png',
      title: 'Help us to improve the app',
      desc: 'We always monitor your comments and listen to your opinion'));
  slides.add(SliderModel(
      imagePath: 'assets/onboarding/stats.png',
      title: 'Stats of movements',
      desc: 'Measurement statistics and connection information'));
  slides.add(SliderModel(
      imagePath: 'assets/onboarding/wifirouter.png',
      title: 'Wi-Fi Uniqueness',
      desc: 'Subscribe to unlock all the features,\njust '+r'$'+'3.99/w '));
  slides.add(SliderModel(
      imagePath: 'assets/onboarding/wifirouter.png',
      title: 'Wi-Fi Uniqueness',
      desc: 'Subscribe to unlock all the features,\njust '+r'$'+'3.99/w '));
  return slides;
}