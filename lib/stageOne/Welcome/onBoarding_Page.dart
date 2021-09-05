import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:project_s/constants.dart';
import 'components/button_widget.dart';
import 'welcome_screen.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Annie Leonard',
              body:
                  'There is no such thing as \'away.\' When we throw anything away, it must go somewhere',
              image: buildImage('assets/img.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Mother Teresa',
              body:
                  'I only feel angry when I see waste. When I see people throwing away things we could use.',
              image: buildImage('assets/onScreen5.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'W.Edwards Deming',
              body:
                  'My mother was my biggest role model. She taught me to hate waste. We never wasted anything.',
              image: buildImage('assets/onScreen3.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Grace Potter',
              body:
                  'Tearing down an old house and building a new one is the most wasteful thing we do as humans.',
              footer: ButtonWidget(
                text: 'Start Reading',
                onClicked: () => goToHome(context),
              ),
              image: buildImage('assets/onScreen4.png'),
              decoration: getPageDecoration(),
            ),
          ],
          done: Text('Continue',
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor)),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: Text('Skip', style: TextStyle(color: kPrimaryColor)),
          onSkip: () => goToHome(context),
          next: Icon(
            Icons.arrow_forward,
            color: kPrimaryColor,
          ),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => print('Page $index selected'),
          skipFlex: 0,
          nextFlex: 0,
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => WelcomeScreen()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Color(0xFFBDBDBD),
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
        descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
