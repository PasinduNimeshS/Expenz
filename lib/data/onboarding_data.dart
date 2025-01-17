import 'package:expenz/models/onboarding_model.dart';

class OnboardingData {
  static final List<Onboarding> onboardingDataList = [
    Onboarding(
      title: "Gain total control of your money",
      description: "Become your own money manager and make every cent count",
      imageURL: "assets/images/onboard_1.png",
    ),
    Onboarding(
      title: "Know where your money goes",
      description:
          "Track your transaction easily, with categories and financial report ",
      imageURL: "assets/images/onboard_2.png",
    ),
    Onboarding(
      title: "Planning ahead",
      description: "Setup your budget for each category so you in control",
      imageURL: "assets/images/onboard_3.png",
    ),
  ];
}
