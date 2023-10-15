part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id;
  const GetMovieDetailsEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class GetMovieRecomendationsEvent extends MovieDetailsEvent {
  final int id;
  const GetMovieRecomendationsEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
