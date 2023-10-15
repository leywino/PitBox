import 'package:equatable/equatable.dart';

class LoadNewsDetails extends Equatable {
  final String timeString;
  final List paragraphList;
  final String headLine;

  const LoadNewsDetails({
    required this.timeString,
    required this.paragraphList,
    required this.headLine,
  });
  @override
  List<Object> get props => [timeString, paragraphList, headLine];
}
