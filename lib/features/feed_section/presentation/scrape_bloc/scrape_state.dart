part of 'scrape_bloc.dart';

abstract class ScrapeState extends Equatable {}

class ScrapeDataLoadingState extends ScrapeState {
  @override
  List<Object> get props => [];
}

class ScrapeDataLoadedState extends ScrapeState {
  final List<NewsFeedScraped> newsFeedData;
  final List<NewsDetails> newsDetailsDataList;
  ScrapeDataLoadedState(this.newsFeedData, this.newsDetailsDataList);
  @override
  List<Object> get props => [newsFeedData, newsDetailsDataList];
}

class ScrapeDataErrorState extends ScrapeState {
  final String error;
  ScrapeDataErrorState(this.error);
  @override
  List<Object> get props => [error];
}