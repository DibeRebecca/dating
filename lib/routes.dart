import 'package:flutter/material.dart';
import 'package:match_dating/crushes/views/crushes.dart';
import 'package:match_dating/pages/screens.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return PageTransition(
          child: const SplashScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case '/onboarding':
        return PageTransition(
          child: const OnBoardingScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case '/signin':
        return PageTransition(
          child: const SignInScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case '/signup':
        return PageTransition(
          child: const SignUpScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case '/verification':
        return PageTransition(
          child: const VerificationScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case '/gender':
        return PageTransition(
          child: const GenderScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case '/showme':
        return PageTransition(
          child: const ShowMeScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case '/locationenable':
        return PageTransition(
          child: const LocationEnableScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case '/bottom':
        return PageTransition(
          child: const BottomNaviScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case '/detail':
        return PageTransition(
          child: const DetailScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case '/itsmatch':
        return PageTransition(
          child: const ItsMatch(),
          type: PageTransitionType.rightToLeft,
        );
      case '/match':
        return PageTransition(
          child: Crushes(),
          type: PageTransitionType.rightToLeft,
        );
      case '/notification':
        return PageTransition(
          child: const NotificationScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case '/chat':
        return PageTransition(
          child: const Chat(),
          type: PageTransitionType.rightToLeft,
        );
      case '/call':
        return PageTransition(
          child: const CallScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case '/videocall':
        return PageTransition(
          child: const VideoCallScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case '/nearyou':
        return PageTransition(
          child: NearYouScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case '/editprofile':
        return PageTransition(
          child: const EditProfileScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case '/like':
        return PageTransition(
          child: LikeScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case '/viplike':
        return PageTransition(
          child: VIPLikeScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case '/dislike':
        return PageTransition(
          child: DisLikeScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case '/vipdislike':
        return PageTransition(
          child: VIPDisLikeScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case '/vip':
        return PageTransition(
          child: const VIPScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case '/payment':
        return PageTransition(
          child: const PaymentScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case '/success':
        return PageTransition(
          child: const SuccessScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case '/about':
        return PageTransition(
          child: const AboutScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case '/settings':
        return PageTransition(
          child: const SettingScreen(),
          type: PageTransitionType.rightToLeft,
        );
      default:
        return PageTransition(
          child: Container(),
          type: PageTransitionType.rightToLeft,
        );
    }
  }
}
