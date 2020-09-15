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

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("./assets/hero-1.png"),
            Text("Boost your traffic"),
            Text("Outreach to many social networks to improve your statistics"),
            ProgressButton(),
            Text("Skip")
          ],
        )),
      ),
    );
  }
}

class ProgressButton extends StatelessWidget {
  const ProgressButton({
    Key key,
  }) : super(key: key);

  void onComplete() {
    print('onComplete');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      height: 65,
      child: Stack(children: [
        AnimatedIndicator(
          duration: const Duration(seconds: 10),
          size: 65,
          callback: onComplete,
        ),
        Center(
          child: NextButton(),
        )
      ]),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
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
