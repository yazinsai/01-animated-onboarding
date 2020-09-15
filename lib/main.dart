import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onboarding/widgets/animated_indicator.dart';

const blue = Color(0xFF4781ff);
const kTitleStyle = TextStyle(
    fontSize: 30, color: Color(0xFF01002f), fontWeight: FontWeight.bold);
const kSubtitleStyle = TextStyle(fontSize: 22, color: Color(0xFF88869f));

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MainPage(),
    );
  }
}

class Slide extends StatelessWidget {
  final Image hero;
  final String title;
  final String subtitle;
  final VoidCallback onNext;

  const Slide({Key key, this.hero, this.title, this.subtitle, this.onNext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          hero,
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  title,
                  style: kTitleStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  subtitle,
                  style: kSubtitleStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 35,
                ),
                ProgressButton(onNext: onNext),
              ],
            ),
          ),
          GestureDetector(
            onTap: onNext,
            child: Text(
              "Skip",
              style: kSubtitleStyle,
            ),
          )
        ],
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
            child: PageView(controller: pageController, children: [
          Slide(
              hero: Image.asset("./assets/hero-1.png"),
              title: "Boost your traffic",
              subtitle:
                  "Outreach to many social networks to improve your statistics",
              onNext: nextPage),
          Slide(
              hero: Image.asset("./assets/hero-2.png"),
              title: "Give the best solution",
              subtitle: "We will give best solution for your business isues",
              onNext: nextPage),
          Slide(
              hero: Image.asset("./assets/hero-3.png"),
              title: "Reach the target",
              subtitle:
                  "With our help, it will be easier to achieve your goals",
              onNext: () => print('Onboarding done!')),
        ])),
      ),
    );
  }

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOutBack);
  }
}

class ProgressButton extends StatelessWidget {
  final VoidCallback onNext;
  const ProgressButton({Key key, this.onNext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 75,
      child: Stack(children: [
        AnimatedIndicator(
          duration: const Duration(seconds: 10),
          size: 75,
          callback: onNext,
        ),
        Center(
          child: GestureDetector(
            child: NextButton(),
            onTap: onNext,
          ),
        )
      ]),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      child: Center(
        child: SvgPicture.asset(
          "./assets/arrow.svg",
          width: 10,
        ),
      ),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(99), color: blue),
    );
  }
}
