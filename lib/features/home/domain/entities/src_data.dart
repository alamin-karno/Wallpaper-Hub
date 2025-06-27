import 'package:equatable/equatable.dart';

class SrcData with EquatableMixin {
  SrcData({
    required this.original,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
  });

  final String original;
  final String large;
  final String medium;
  final String small;
  final String portrait;
  final String landscape;

  @override
  List<Object?> get props => [
        original,
        large,
        medium,
        small,
        portrait,
        landscape,
      ];
}
