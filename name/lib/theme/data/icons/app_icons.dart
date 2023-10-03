import 'package:equatable/equatable.dart';
import 'package:name/theme/data/icons/app_icons_sizes.dart';

class AppIcons extends Equatable {
  const AppIcons({required this.sizes});

  factory AppIcons.regular() => AppIcons(
        sizes: AppIconsSizes.regular(),
      );

  final AppIconsSizes sizes;

  @override
  List<Object?> get props => [];
}
