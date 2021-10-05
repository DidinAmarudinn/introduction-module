import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:onboard_module/screen/main_screen.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => MainScreen()),
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 16.0);
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imageFlex: 3,
      bodyFlex: 2,
      imagePadding: EdgeInsets.zero,
    );
    List<PageViewModel> listContent = [
      PageViewModel(
        title: "Titile 1",
        body:
            "Instead of having to buy an entire share, invest any amount you want.",
        image: _buildImage('image_assets.png'),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: "Learn as you go",
        body:
            "Download the Stockpile app and master the market with our mini-lesson.",
        image: _buildImage('image_assets.png'),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: "Kids and teens",
        body:
            "Kids and teens can track their stocks 24/7 and place trades that you approve.",
        image: _buildImage('image_assets.png'),
        decoration: pageDecoration,
      ),
    ];
    return IntroductionScreen(
      key: introKey,

      globalBackgroundColor: Colors.white,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: TextButton(
              onPressed: () {
                _onIntroEnd(context);
              },
              child: const Text(
                "skip",
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),
      ),
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: Colors.black,
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
      pages: listContent,
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipFlex: 0,
      nextFlex: 0,

      //rtl: true, // Display as right-to-left
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward, color: Colors.black),
      done: const Text('Done',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          )),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
    );
  }
}
