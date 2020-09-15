import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onboarding/widgets/animated_indicator.dart';

const blue = Color(0xFF4781ff);

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
          Column(
            children: [
              Image.asset("./assets/hero-1.png"),
              Text("Boost your traffic"),
              Text(
                  "Outreach to many social networks to improve your statistics"),
              ProgressButton(onNext: nextPage),
              Text("Skip")
            ],
          ),
          Column(
            children: [
              Image.asset("./assets/hero-2.png"),
              Text("Give the best solution"),
              Text("We will give best solution for your business isues"),
              ProgressButton(onNext: nextPage),
              Text("Skip")
            ],
          ),
          Column(
            children: [
              Image.asset("./assets/hero-3.png"),
              Text("Reach the target"),
              Text("With our help, it will be easier to achieve your goals"),
              ProgressButton(onNext: () => print('Onboarding complete!')),
              Text("Skip")
            ],
          ),
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
