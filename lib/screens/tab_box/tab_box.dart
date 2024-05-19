import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/size/size_utils.dart';
import '../contact_screen.dart';
import '../home_screen.dart';
import '../languages_screen.dart';
import '../setting_screen.dart';

class TabBox1 extends StatefulWidget {
  const TabBox1({super.key});

  @override
  State<TabBox1> createState() => _TabBox1State();
}

class _TabBox1State extends State<TabBox1> {
  List<Widget> _screens = [];
  int _activeIndex = 0;

  @override
  void initState() {
    _screens = [
      HomeScreen(),
      SettingScreen(),
      LanguagesScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery
        .of(context)
        .size
        .height;
    width = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFFFFC3DF)),
                  side: MaterialStateProperty.all(
                      BorderSide(color: Color(0xFF000072), width: 2.w)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)))),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactScreen()));
              },
              child: Text(
                "CONTACT",
                style: TextStyle(color: Color(0xFF000072), fontSize: 10.w),
              )),
        ],
      ),
      body: _screens[_activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newActiveIndex) {
          _activeIndex = newActiveIndex;
          setState(() {});
        },
        currentIndex: _activeIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        backgroundColor: Color(0xFF000072),
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset("assets/icons/fast.svg"),
            icon: SvgPicture.asset("assets/icons/fast.svg"),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset("assets/icons/skills.svg"),
            icon: SvgPicture.asset("assets/icons/skills.svg"),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset("assets/icons/contact.svg"),
            icon: SvgPicture.asset("assets/icons/contact.svg"),
            label: "",
          ),
        ],
      ),
    );
  }
}
