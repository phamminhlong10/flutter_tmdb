import 'package:equatable/equatable.dart';

abstract class PopularTVShowsEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchPopularTVShowsEvent extends PopularTVShowsEvent{}