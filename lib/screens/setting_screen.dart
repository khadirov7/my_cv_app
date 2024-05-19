import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_cv_app/bloc/file_bloc.dart';
import 'package:my_cv_app/bloc/file_event.dart';
import 'package:my_cv_app/bloc/file_state.dart';
import 'package:my_cv_app/data/models/file_data_model.dart';
import 'package:open_filex/open_filex.dart';
import '../services/file_maneger_services.dart';
import '../utils/colors/app_colors.dart';
import '../utils/size/size_utils.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        actions: [
          IconButton(onPressed: () {}, icon: SvgPicture.asset('assets/icons/pdf.svg')),
        ],
        backgroundColor: const Color(0xFFFDFDFD),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded,size: 24.w,color: Color(0xFF000072),)),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
        children: [
           Text(
            "Skills: Tech",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 12.w,
              fontWeight: FontWeight.w600,
            ),
          ),
          ...List.generate(
            context.read<BookBloc>().state.books.length,
                (index) {
              FileDataModel fileDataModel =
              context.read<BookBloc>().state.books[index];

              BookBloc fileManagerBloc = BookBloc();

              return BlocProvider.value(
                value: fileManagerBloc,
                child: BlocBuilder<BookBloc, FileManagerState>(
                  builder: (context, state) {
                    debugPrint("CURRENT MB: ${state.progress}");
                    String filePath = FileManagerService.isExist(
                      fileDataModel.fileUrl,
                      fileDataModel.fileName,
                    );
                    debugPrint("CURRENT MB: ${filePath}");
                    return Column(
                      children: [
                        SizedBox(height: 15.h,),
                        ListTile(
                          title: Text(
                            fileDataModel.fileName,
                            style:  TextStyle(
                              color: AppColors.black,
                              fontSize: 10.w,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () async {
                              if (state.newFileLocation.isNotEmpty) {
                                await OpenFilex.open(state.newFileLocation);
                              } else {
                                fileManagerBloc.add(
                                  DownloadFileEvent(
                                    fileDataModel: fileDataModel
                                  ),
                                );
                              }
                            },
                            icon: Icon(
                              state.newFileLocation.isNotEmpty
                                  ? Icons.check
                                  : Icons.download,
                              color: Colors.blue,
                            ),
                          ),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              fileDataModel.iconPath,
                              width: 18.w,
                              height: 35.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: state.progress != 0,
                          child: LinearProgressIndicator(
                            value: state.progress,
                            backgroundColor: Colors.grey,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}