import 'package:equatable/equatable.dart';
import 'package:my_cv_app/data/models/file_data_model.dart';

class FileManagerState extends Equatable {
  const FileManagerState({
    required this.progress,
    required this.newFileLocation,
    required this.books,
    required this.searchBooks,
  });

  final double progress;
  final String newFileLocation;
  final List<FileDataModel> books;
  final List<FileDataModel> searchBooks;

  FileManagerState copyWith({
    double? progress,
    String? newFileLocation,
    List<FileDataModel>? books,
    List<FileDataModel>? searchBooks,
  }) {
    return FileManagerState(
      progress: progress ?? this.progress,
      newFileLocation: newFileLocation ?? this.newFileLocation,
      books: books ?? this.books,
      searchBooks: searchBooks ?? this.searchBooks,
    );
  }

  @override
  List<Object?> get props => [progress, newFileLocation, books, searchBooks];
}