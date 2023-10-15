// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_details_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsDetailsAdapter extends TypeAdapter<NewsDetails> {
  @override
  final int typeId = 1;

  @override
  NewsDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsDetails(
      newsDetails: LoadNewsDetails(
        timeString: fields[0] as String,
        paragraphList: fields[1] as List,
        headLine: fields[2] as String,
      ),
      index: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, NewsDetails obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.newsDetails?.timeString)
      ..writeByte(1)
      ..write(obj.newsDetails?.paragraphList)
      ..writeByte(2)
      ..write(obj.newsDetails?.headLine)
      ..writeByte(3)
      ..write(obj.index);
  }
}
