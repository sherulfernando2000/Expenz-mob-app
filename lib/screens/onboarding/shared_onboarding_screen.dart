import 'package:flutter/material.dart';
import 'package:flutter2/constants/colors.dart';
import 'package:flutter2/constants/constants.dart';

class SharedOnboardingScreen extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;

  const SharedOnboardingScreen({super.key, required this.title, required this.imagePath, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath, 
            width: 200, 
            fit: BoxFit.cover
          ),
          const SizedBox(
            height:20
          ),
          Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
          ),
          const SizedBox(
              height: 20,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: kGrey,
              
      
      
            )
          ),
          
        ],
      ),
    );
  }
}
