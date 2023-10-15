import 'package:equatable/equatable.dart';

class Recomendations extends Equatable {
  final int id;
  final String backdropPath;

  const Recomendations({
    required this.id,
    required this.backdropPath,
  });

  @override
  List<Object?> get props => [
        id,
        backdropPath,
      ];
}
