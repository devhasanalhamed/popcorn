// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class SeriesRecommendation extends Equatable {
  final int id;
  final String backdropPath;

  const SeriesRecommendation({required this.id, required this.backdropPath});

  @override
  List<Object> get props => [id, backdropPath];
}
