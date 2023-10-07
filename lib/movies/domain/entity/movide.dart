class Movie {
  final int id;
  final String title;
  final String backdropBath;
  final List<int> genderIds;
  final String overview;
  final double voteAverage;

  const Movie({
    required this.id,
    required this.title,
    required this.backdropBath,
    required this.genderIds,
    required this.overview,
    required this.voteAverage,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Movie &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          backdropBath == other.backdropBath &&
          genderIds == other.genderIds &&
          overview == other.overview &&
          voteAverage == other.voteAverage;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      backdropBath.hashCode ^
      genderIds.hashCode ^
      overview.hashCode ^
      voteAverage.hashCode;
}
