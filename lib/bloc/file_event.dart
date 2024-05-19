import 'package:equatable/equatable.dart';
import '../data/models/file_data_model.dart';

abstract class FileManagerEvent extends Equatable {
  const FileManagerEvent();
}

class DownloadFileEvent extends FileManagerEvent {
  final FileDataModel fileDataModel;

  const DownloadFileEvent({
    required this.fileDataModel,
  });

  @override
  List<Object?> get props => [fileDataModel];
}
