import 'package:flutter/material.dart';
import 'package:match_dating/localization/localization_const.dart';
import 'package:match_dating/theme/theme.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  bool microphoneon = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/itsmatch/m1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              backButton(context),
              nameNumberDetail(context),
              const Spacer(),
              callOptions(size, context),
              heightSizeBox(fixPadding * 3),
            ],
          ),
        ),
      ),
    );
  }

  backButton(BuildContext context) {
    return Row(
      children: [
        IconButton(
          padding: const EdgeInsets.symmetric(
              horizontal: fixPadding * 1.5, vertical: 8),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 22,
            color: whiteColor,
          ),
        ),
      ],
    );
  }

  nameNumberDetail(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(getTranslated(context, 'call.name'), style: white24Style),
        const Text(
          "+(91)1243561234",
          style: semibold16whiteStyle,
        ),
        Text(
          getTranslated(context, 'call.dialing'),
          style: semibold14whiteStyle,
        )
      ],
    );
  }

  callOptions(Size size, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/videocall');
          },
          child: Container(
            height: size.height * 0.07,
            width: size.height * 0.07,
            decoration: const BoxDecoration(
              color: blackColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.videocam,
              color: whiteColor,
              size: 26,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: size.height * 0.07,
            width: size.height * 0.07,
            decoration: const BoxDecoration(
              color: Color(0xffE50C0C),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.call_end,
              color: whiteColor,
              size: 26,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              microphoneon = !microphoneon;
            });
          },
          child: Container(
            height: size.height * 0.07,
            width: size.height * 0.07,
            decoration: BoxDecoration(
              color: microphoneon ? Colors.blue : blackColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              microphoneon ? Icons.mic_none_outlined : Icons.mic_off_outlined,
              color: whiteColor,
              size: 26,
            ),
          ),
        ),
      ],
    );
  }
}
