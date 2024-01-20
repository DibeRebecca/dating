import 'package:flutter/material.dart';
import 'package:match_dating/localization/localization_const.dart';

import '../../theme/theme.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
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
              topPart(context, size),
              const Spacer(),
              nameTime(context),
              heightSizeBox(fixPadding * 3),
              callOptions(size, context),
              heightSizeBox(fixPadding * 3),
            ],
          ),
        ),
      ),
    );
  }

  callOptions(Size size, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: size.height * 0.07,
          width: size.height * 0.07,
          decoration: const BoxDecoration(
            color: blackColor,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.flip_camera_android,
            color: whiteColor,
            size: 26,
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

  nameTime(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(getTranslated(context, 'video_call.name'), style: white24Style),
        const Text(
          "20.25",
          style: white14Style,
        ),
      ],
    );
  }

  topPart(BuildContext context, Size size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        Container(
          margin: const EdgeInsets.only(right: 20, left: 20),
          height: size.height * 0.2,
          width: size.width * 0.25,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: whiteColor,
                width: 4,
              )),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              "assets/itsmatch/m2jpg.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
