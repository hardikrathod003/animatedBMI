import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BMI(),
    ),
  );
}

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> with TickerProviderStateMixin {
  var backColor = const Color(0xff090e21);
  var backColor2 = const Color(0xff1d1e33);
  bool isMaleSelected = true;
  bool isFemaleSelected = false;
  var Sliderval = 180;
  var Weight = 60;
  var Age = 28;
  var isFemaleSelectedAge1 = 0;
  var isFemaleSelectedAge2 = 0;
  var isFemaleSelectedWeight1 = 0;
  var isFemaleSelectedWeight2 = 0;

  late AnimationController maleAnimationController;
  late AnimationController femaleAnimationController;

  late Animation maleBoxHeightAnimation;
  late Animation maleBoxWidthAnimation;
  late Animation femaleBoxHeightAnimation;
  late Animation femaleBoxWidthAnimation;

  var Decor = BoxDecoration(
    color: const Color(0xff1d1e33),
    borderRadius: BorderRadius.circular(10),
  );

  @override
  void initState() {
    super.initState();

    maleAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    femaleAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));

    maleBoxHeightAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 250, end: 260), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 260, end: 250), weight: 1),
    ]).animate(maleAnimationController);
    femaleBoxHeightAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 250, end: 260), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 260, end: 250), weight: 1),
    ]).animate(femaleAnimationController);
    maleBoxWidthAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 170, end: 180), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 180, end: 170), weight: 1),
    ]).animate(maleAnimationController);
    femaleBoxWidthAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 170, end: 180), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 180, end: 170), weight: 1),
    ]).animate(femaleAnimationController);

    maleAnimationController.forward();
    femaleAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: backColor,
        child: Column(
          children: [
            Expanded(
              flex: 28,
              child: Row(
                children: [
                  const Spacer(flex: 1),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFemaleSelected = true;
                        isMaleSelected = false;
                        femaleAnimationController.reverse();
                      });
                    },
                    child: AnimatedBuilder(
                      animation: femaleAnimationController,
                      builder: (context, widget) {
                        return Container(
                          height: femaleBoxHeightAnimation.value,
                          width: femaleBoxWidthAnimation.value,
                          decoration: BoxDecoration(
                            color: (isFemaleSelected)
                                ? const Color(0xff3B3C4D)
                                : const Color(0xff1D1E33),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.female,
                                size: 130,
                                color: (isFemaleSelected)
                                    ? Colors.red
                                    : Colors.white,
                              ),
                              Text(
                                "Female",
                                style: TextStyle(
                                  color: (isFemaleSelected)
                                      ? Colors.red
                                      : Colors.white,
                                  fontSize: 25,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const Spacer(flex: 1),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFemaleSelected = false;
                        isMaleSelected = true;
                        maleAnimationController.reverse();
                      });
                    },
                    child: AnimatedBuilder(
                      animation: maleAnimationController,
                      builder: (context, widget) {
                        return Container(
                          height: maleBoxHeightAnimation.value,
                          width: maleBoxWidthAnimation.value,
                          decoration: BoxDecoration(
                            color: (isMaleSelected)
                                ? const Color(0xff3B3C4D)
                                : const Color(0xff1D1E33),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.male,
                                size: 130,
                                color: (isMaleSelected)
                                    ? Colors.red
                                    : Colors.white,
                              ),
                              Text(
                                "Male",
                                style: TextStyle(
                                  color: (isMaleSelected)
                                      ? Colors.red
                                      : Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            ),
            const SizedBox(height: 2.5),
            Expanded(
              flex: 33,
              child: Center(
                child: Container(
                  height: 190,
                  width: 350,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "HEIGHT",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff626473),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$Sliderval",
                            style: const TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 7),
                          Container(
                            height: 100,
                            alignment: const Alignment(0, 0.2),
                            child: const Text(
                              "cm",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff626473),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        value: Sliderval.toDouble(),
                        onChanged: (val) {
                          setState(() {
                            Sliderval = val.toInt();
                          });
                        },
                        thumbColor: const Color(0xffeb1555),
                        activeColor: const Color(0xfff5c1d1),
                        inactiveColor: const Color(0xff555555),
                        max: 270,
                        min: 90,
                      ),
                    ],
                  ),
                  decoration: Decor,
                ),
              ),
            ),
            const SizedBox(height: 2),
            Expanded(
              flex: 28,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 180,
                    width: 160,
                    decoration: Decor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Weight",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "$Weight",
                          style: const TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  Weight--;
                                  isFemaleSelectedWeight1 = 1;
                                  isFemaleSelectedWeight2 = 0;
                                });
                              },
                              child: Ink(
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: (isFemaleSelectedWeight1 == 1)
                                          ? const Color(0xfff67fa4)
                                          : Colors.white,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (isFemaleSelectedWeight1 == 1)
                                        ? const Color(0xff6e6f7a)
                                        : const Color(0xff4c4f5e),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  Weight++;
                                  isFemaleSelectedWeight2 = 1;
                                  isFemaleSelectedWeight1 = 0;
                                });
                              },
                              child: Ink(
                                child: Container(
                                  child: Icon(
                                    Icons.add,
                                    size: 30,
                                    color: (isFemaleSelectedWeight2 == 1)
                                        ? const Color(0xfff67fa4)
                                        : Colors.white,
                                  ),
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (isFemaleSelectedWeight2 == 1)
                                        ? const Color(0xff6e6f7a)
                                        : const Color(0xff4c4f5e),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 180,
                    width: 160,
                    decoration: Decor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Age",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "$Age",
                          style: const TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  Age--;
                                  isFemaleSelectedAge1 = 1;
                                  isFemaleSelectedAge2 = 0;
                                });
                              },
                              child: Ink(
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: (isFemaleSelectedAge1 == 1)
                                          ? const Color(0xfff67fa4)
                                          : Colors.white,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (isFemaleSelectedAge1 == 1)
                                        ? const Color(0xff6e6f7a)
                                        : const Color(0xff4c4f5e),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  Age++;
                                  isFemaleSelectedAge2 = 1;
                                  isFemaleSelectedAge1 = 0;
                                });
                              },
                              child: Ink(
                                child: Container(
                                  child: Icon(
                                    Icons.add,
                                    size: 30,
                                    color: (isFemaleSelectedAge2 == 1)
                                        ? const Color(0xfff67fa4)
                                        : Colors.white,
                                  ),
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (isFemaleSelectedAge2 == 1)
                                        ? const Color(0xff6e6f7a)
                                        : const Color(0xff4c4f5e),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              flex: 12,
              child: InkWell(
                onTap: () {},
                child: Ink(
                  child: Container(
                    height: 75,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: const Text(
                      "Calculate",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffeb1555),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
