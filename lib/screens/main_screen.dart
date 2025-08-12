import 'package:flutter/material.dart';
import 'package:flutter2/constants/colors.dart';
import 'package:flutter2/screens/add_new_screen.dart';
import 'package:flutter2/screens/budget_screen.dart';
import 'package:flutter2/screens/home_page.dart';
import 'package:flutter2/screens/profile_screen.dart';
import 'package:flutter2/screens/transaction_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeScreen(),
      TransactionScreen(),
      AddNewScreen(),
      BudgetScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: kWhite,
        selectedItemColor: kMainColor,
        unselectedItemColor: kGrey,
        currentIndex: _currentPageIndex,
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
            print(_currentPageIndex);
          });
        },
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),

          const BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: "Transaction",
          ),

          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: kMainColor,
                shape: BoxShape.circle,
              ),

              child: const Icon(Icons.add, color: kWhite, size: 30),
            ),

            label: "",
          ),

          const BottomNavigationBarItem(
            icon: Icon(Icons.rocket),
            label: "Budget",
          ),

          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
      body: pages[_currentPageIndex],
    );
  }
}
