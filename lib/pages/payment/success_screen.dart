import 'package:flutter/material.dart';
import 'package:match_dating/theme/theme.dart';

import '../../localization/localization_const.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/onboarding/onboarding screen.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              "assets/payment/success.png",
              height: size.height * 0.12,
              width: size.height * 0.12,
            ),
            heightSizeBox(20),
            Text(getTranslated(context, 'success.payment_success'),
                style: black18Style),
            heightSpace,
            Text(
              getTranslated(context, 'success.thank_you'),
              textAlign: TextAlign.center,
              style: medium14GreyStyle.copyWith(
                height: 1,
                color: const Color(0xff878383),
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/bottom');
              },
              child: Text(getTranslated(context, 'success.back_to_home'),
                  style: red316Style),
            )
          ],
        ),
      ),
    );
  }
}
