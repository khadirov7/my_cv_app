import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/colors/app_colors.dart';
import '../utils/size/size_utils.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({super.key});

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        actions: [
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset('assets/icons/pdf.svg')),
        ],
        backgroundColor: const Color(0xFFFDFDFD),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu_rounded,
              size: 16.w,
              color: const Color(0xFF000072),
            )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Languages",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 12.w,
                fontWeight: FontWeight.w600,
              ),
            ),
            ListTile(
              onTap: () {},
              leading: SvgPicture.asset('assets/icons/english.svg',height: 32.h,),
              title: Text(
                'English',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 8.w,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                "Beginner",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 7.w,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
