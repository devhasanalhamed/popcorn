import 'package:equatable/equatable.dart';

import 'package:popcorn/core/utils/enums.dart';
import 'package:popcorn/modules/series/domain/entity/series_details.dart';
import 'package:popcorn/modules/series/domain/entity/series_recommendation.dart';

class SeriesDetailsState extends Equatable {
  /// Series details
  final SeriesDetails? seriesDetails;
  final RequestState seriesDetailsState;
  final String seriesDetailsMessage;

  /// Series recommendations
  final List<SeriesRecommendation> seriesRecommendations;
  final RequestState seriesRecommendationsState;
  final String seriesRecommendationsMessage;

  const SeriesDetailsState({
    this.seriesDetails,
    this.seriesDetailsState = RequestState.loading,
    this.seriesDetailsMessage = '',
    this.seriesRecommendations = const [],
    this.seriesRecommendationsState = RequestState.loading,
    this.seriesRecommendationsMessage = '',
  });

  SeriesDetailsState copyWith({
    SeriesDetails? seriesDetails,
    RequestState? seriesDetailsState,
    String? seriesDetailsMessage,
    List<SeriesRecommendation>? seriesRecommendations,
    RequestState? seriesRecommendationsState,
    String? seriesRecommendationsMessage,
  }) {
    return SeriesDetailsState(
      seriesDetails: seriesDetails ?? this.seriesDetails,
      seriesDetailsState: seriesDetailsState ?? this.seriesDetailsState,
      seriesDetailsMessage: seriesDetailsMessage ?? this.seriesDetailsMessage,
      seriesRecommendations:
          seriesRecommendations ?? this.seriesRecommendations,
      seriesRecommendationsState:
          seriesRecommendationsState ?? this.seriesRecommendationsState,
      seriesRecommendationsMessage:
          seriesRecommendationsMessage ?? this.seriesRecommendationsMessage,
    );
  }

  @override
  List<Object?> get props {
    return [
      seriesDetails,
      seriesDetailsState,
      seriesDetailsMessage,
      seriesRecommendations,
      seriesRecommendationsState,
      seriesRecommendationsMessage,
    ];
  }
}
