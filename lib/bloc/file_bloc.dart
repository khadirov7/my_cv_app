import 'dart:io';
import 'dart:isolate';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_cv_app/bloc/file_event.dart';
import 'package:my_cv_app/bloc/file_state.dart';
import 'package:my_cv_app/data/models/file_data_model.dart';
import 'package:my_cv_app/data/models/file_status_model.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../data/repo.dart';
import '../services/file_maneger_services.dart';

class BookBloc extends Bloc<FileManagerEvent, FileManagerState> {
  BookBloc()
      : super(FileManagerState(
    progress: 0,
    newFileLocation: "",
    books: books,
    searchBooks: books,
  )) {
    on<DownloadFileEvent>(_downloadFile);
  }

  Future<void> _downloadFile(DownloadFileEvent event, emit) async {
    Dio dio = Dio();

    FileStatusModel fileStatusModel = await getStatus(event.fileDataModel);

    if (fileStatusModel.isExist) {
      OpenFilex.open(fileStatusModel.newFileLocation);
    } else {
      await dio.download(
        event.fileDataModel.fileUrl,
        fileStatusModel.newFileLocation,
        onReceiveProgress: (count, total) async {
          emit(state.copyWith(progress: count / total));
        },
      );
      await FileManagerService.init();
      emit(
        state.copyWith(
          progress: 1,
          newFileLocation: fileStatusModel.newFileLocation,
        ),
      );
    }
  }


  Future<bool> _requestWritePermission() async {
    await Permission.storage.request();
    return await Permission.storage.request().isGranted;
  }

  Future<Directory?> getDownloadPath() async {
    Directory? directory;

    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory("/storage/emulated/0/Download");
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      }
    } catch (error) {
      debugPrint("Cannot get download folder path");
    }
    return directory;
  }

  Future<FileStatusModel> getStatus(FileDataModel fileDataModel) async {
    final FileStatusModel fileStatusModel =
    await Isolate.run<FileStatusModel>(() async {
      return await FileManagerService.checkFile(fileDataModel);
    });
    return fileStatusModel;
  }

}