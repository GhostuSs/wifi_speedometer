import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wifi_speed_test/presentation/components/onboarding/ratingDialog.dart';
import 'package:wifi_speed_test/presentation/components/onboarding/sliderTile.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';
import 'data.dart';
void main()=>runApp(MaterialApp(home:OnBoardingScreen()));
class OnBoardingScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _OnBoardingScreen();
  }

}

class _OnBoardingScreen extends State<OnBoardingScreen> {
  List<SliderModel> slides = List.empty(growable: true);
  int currentIndex = 0;
  PageController pageController = new PageController();
  @override
  void initState() {
    super.initState();
    slides = getSlides();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGrey,
      body: PageView.builder(
        controller: pageController,
        itemCount: slides.length,
          onPageChanged: (val)=>setState((){currentIndex=val;}),
          itemBuilder: (context,index){
              return SliderTile(
                flag: index == slides.length-2 || index ==slides.length-1 ? true : false,
                imageAssetPath: slides[index].imagePath,
                title: slides[index].title,
                desc: slides[index].desc,
              );
          }
      ),
      floatingActionButton: currentIndex != slides.length-1 ? btmSheet(false,'Next',onNext) : btmSheet(true,'Continue',onContinue),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  Future<void> onNext() async {
    if (currentIndex==1) await showDialog(context: context,builder: (context)=>RateMyApp());
    setState(() {
      currentIndex++;
      pageController.animateToPage(
          currentIndex, duration: Duration(milliseconds: 300),
          curve: Curves.linear);
    });
  }
  void onContinue(){
    Navigator.pushNamed(context, '/');
  }
Widget btmSheet(bool isLast,String text,onPressed){
    return Container(
        decoration: BoxDecoration(
          color: kDarkGrey,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            isLast ? Text(''):Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i=0;i<slides.length-1;i++) currentIndex == i ? pageIndexIndicator(true) : pageIndexIndicator(false)
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical:10.0),
              child: Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                    color: kBlue,
                    borderRadius: BorderRadius.circular(8.0)
                ),
                child: TextButton(
                    child: Text(
                      '$text',
                      style: TextStyle(
                        color: kWhite,
                        fontSize: 18.0,
                        fontFamily: 'OpenSans-Bold',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed:onPressed),
              ),
            ),
            isLast
                ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Text(
                          'Privacy Policy',
                          style: TextStyle(
                              color: Color(0xFFAEAEB2),
                              fontFamily: 'OpenSans-Regular',
                              fontSize: 14.0
                          ),
                        ),
                        onTap: ()=>{},
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          height: 16,
                          width: 1,
                          color: Color(0xFFAEAEB2),
                        ),
                      ),
                      InkWell(
                        child: Text(
                          'Terms of Use',
                          style: TextStyle(
                              color: Color(0xFFAEAEB2),
                              fontFamily: 'OpenSans-Regular',
                              fontSize: 14.0
                          ),
                        ),
                        onTap: ()=>{},
                      )
                    ]
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: InkWell(
                    child: Text(
                      'Restore purchases',
                      style: TextStyle(
                          color: kWhite,
                          fontFamily: 'OpenSans-Regular',
                          fontSize: 16.0
                      ),
                    ),
                    onTap: ()=>{},
                  ),
                )
              ],
            )
                :Text(''),
            SizedBox(height: isLast
                ? MediaQuery.of(context).size.height*0.0175
                : MediaQuery.of(context).size.height*0.049)
          ],
        )
    );
}

Widget pageIndexIndicator(bool isCurrentPage) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 7.0),
      child: Container(
        height: 8.0,
        width: 8.0,
        decoration: BoxDecoration(
            color: isCurrentPage ? kBlue : kLightGrey,
            borderRadius: BorderRadius.circular(15.0)
        ),
      ),
    );
  }
}


