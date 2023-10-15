import 'package:hive/hive.dart';
import '../../domain/entities/load_news_details.dart';
part 'news_details_hive_model.g.dart';


@HiveType(typeId: 1)
class NewsDetails {
  @HiveField(0)
  final LoadNewsDetails? newsDetails;
  @HiveField(1)
  int? index;

  NewsDetails({
    required this.newsDetails,
    required this.index,
  });
}



class NewsDetailsBox {
  static Box<NewsDetails>? _box;
  static Box<NewsDetails> getInstance() {
    return _box ??= Hive.box('NewsDetails');
  }
}
