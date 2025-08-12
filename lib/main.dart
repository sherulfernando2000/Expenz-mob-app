import 'package:flutter/material.dart';
import 'package:flutter2/screens/onboarding_screen.dart';
import 'package:flutter2/screens/user_services.dart';
import 'package:flutter2/widgets/wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserServices.checkUserName(),
      builder: (context, snapshot) {
        //if  the snapshot is still waiting
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          bool hasUserName = snapshot.data ?? false;
          return MaterialApp(
            title: "Expenz",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: "Inter"),
            home: Wrapper(
              showMainScreen: hasUserName),
          );
        }
      },
    );

    // return MaterialApp(
    //   title: "Expenz",
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(fontFamily: "Inter"),
    //   home: OnboardingScreen(),
    // );
  }
}
