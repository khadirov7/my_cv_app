import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_cv_app/data/models/file_data_model.dart';
import 'package:my_cv_app/utils/styles/app_text_styles.dart';
import 'package:open_filex/open_filex.dart';

import '../bloc/file_bloc.dart';
import '../bloc/file_event.dart';
import '../bloc/file_state.dart';
import '../services/file_maneger_services.dart';
import '../utils/size/size_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BookBloc fileManagerBloc = BookBloc();
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.height;
    return BlocBuilder<BookBloc, FileManagerState>(
        builder: (context, state) {
      debugPrint("CURRENT MB: ${state.progress}");
      return Scaffold(
        backgroundColor: Color(0xFFE5FDFF),
        appBar: AppBar(
          elevation: 1,
          actions: [
            IconButton(
                onPressed: () async {
                  if (state.newFileLocation.isNotEmpty) {
                    await OpenFilex.open(state.newFileLocation);
                  } else {
                    fileManagerBloc.add(
                      DownloadFileEvent(
                        fileDataModel: FileDataModel(
                            iconPath: '', fileName: 'book', fileUrl: 'https://github.com/khadirov7/my_cv_app/archive/refs/heads/main.zip'),
                      ),
                    );
                  }
                  //
                },
                icon: SvgPicture.asset('assets/icons/pdf.svg')),
          ],
          backgroundColor: const Color(0xFFFDFDFD),
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu_rounded,
                size: 18.w,
                color: const Color(0xFF000072),
              )),
        ),
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/profile.png",
                  height: 245.h,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Qodirov Qosimjon",
                  style: AppTextStyle.interBold.copyWith(
                      color: Color(0xFF000072),
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "UI,Figma,REST API,Git,\nGoogle Play Console,\nGoogle Maps,Android SDK,\nFirebase,Bloc/Cubit, getX,\nProvider,Google map,Dio",
                    style: AppTextStyle.interRegular.copyWith(
                        color: const Color(0xFF000072),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 2),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "practitioner",
                  style: AppTextStyle.interRegular.copyWith(
                      color: Colors.black,
                      fontSize: 12.w,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Color(0xFF000072),
                  ),
                  Text(
                    "Uzbekistan,Tashkent",
                    style: AppTextStyle.interRegular.copyWith(
                        color: Colors.black38,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
