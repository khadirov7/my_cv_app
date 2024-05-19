import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_cv_app/utils/styles/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/size/size_utils.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
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
        backgroundColor: Color(0xFFFDFDFD),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu_rounded,
              size: 16.w,
              color: Color(0xFF000072),
            )),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black54,
                    size: 10.w,
                  )),
              Text(
                "Back",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 10.w),
              )
            ],
          ),
           Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 12.w),
            child: Text(
              "Contact",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.w,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Hello! I am based in Uzbekistan,\nFergana and there are plenty of\nways to get in touch with me:",
                  style: AppTextStyle.interBlack.copyWith(
                      color: Colors.black,
                      fontSize: 7.w,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 2),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h,horizontal: 12.w),
            child: Row(
              children: [
                SvgPicture.asset("assets/icons/call.svg"),
                 SizedBox(width: 10.w,),
                Text("(+998) 93 156 08 33",style: AppTextStyle.interSemiBold.copyWith(color: Colors.black87,fontSize: 16),)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              children: [
                SvgPicture.asset("assets/icons/message.svg"),
                 SizedBox(width: 10.w,),
                Text("khadirovhobby@gmail.com",style: AppTextStyle.interSemiBold.copyWith(color: Colors.black87,fontSize: 16),)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h,horizontal: 12.w),
            child: Row(
              children: [
                SvgPicture.asset("assets/icons/world.svg"),
                SizedBox(width: 10.w,),
                Text("www.qodirovq.about.me",style: AppTextStyle.interSemiBold.copyWith(color: Colors.black87,fontSize: 16),)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              children: [
                IconButton(onPressed: () async {
                  Uri uri = Uri.parse('https://www.linkedin.com/in/qodirov-qosimjon-2743b228a/');
                  await launchUrl(uri);
                }, icon: SvgPicture.asset("assets/icons/linkedin.svg"),),
                const SizedBox(width: 20,),
                IconButton(onPressed: () {
                  _launchUrl('https://www.linkedin.com/in/qodirov-qosimjon-2743b228a/');
                }, icon: SvgPicture.asset("assets/icons/instagram.svg"),),
                const SizedBox(width: 20,),
                IconButton(onPressed: () {}, icon: SvgPicture.asset("assets/icons/whatsup.svg"),),
                const SizedBox(width: 20,),
                IconButton(onPressed: () {}, icon: SvgPicture.asset("assets/icons/be.svg"),),
                const SizedBox(width: 20,),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
Future<void> _launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}

