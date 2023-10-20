import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:name/route_cards/route_card_size.dart';
import 'package:name/theme/app_theme.dart';

class RouteCards extends StatelessWidget {
  const RouteCards({
    required this.rating,
    required this.title,
    required this.points,
    required this.length,
    required this.duration,
    required this.imageUrl,
    required this.cardSize,
    this.description,
    super.key,
  });

  const RouteCards.small({
    required this.rating,
    required this.title,
    required this.points,
    required this.length,
    required this.duration,
    required this.imageUrl,
    this.cardSize = RouteCardSize.small,
    this.description,
    super.key,
  });

  const RouteCards.large({
    required this.rating,
    required this.title,
    required this.points,
    required this.length,
    required this.duration,
    required this.imageUrl,
    this.cardSize = RouteCardSize.large,
    this.description,
    super.key,
  });

  final double rating;
  final String title;
  final String? description;
  final int points;
  final double length;
  final double duration;
  final String imageUrl;
  final RouteCardSize cardSize;

  @override
  Widget build(BuildContext context) {
    final appThemeData = AppTheme.of(context);
    final colorScheme = appThemeData.colorScheme;
    final typography =
        appThemeData.typography.withColor(colorScheme.neutral.primary);

    final size = cardSize.size;
    final iconSize = appThemeData.icons.sizes.size18;
    final iconColor = colorScheme.accent.primary;

    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: colorScheme.background.surface,
        boxShadow: appThemeData.shadows.elevation16,
        borderRadius: appThemeData.radius.radius8,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              height: cardSize.imageSize.height,
              width: cardSize.imageSize.width,
              fit: BoxFit.fitWidth,
              placeholder: (context, url) => Container(
                decoration: BoxDecoration(
                  borderRadius: appThemeData.radius.radiusTop8,
                  color: colorScheme.neutral.tertiary,
                ),
              ),
              errorWidget: (context, url, error) => Container(
                decoration: BoxDecoration(
                  borderRadius: appThemeData.radius.radiusTop8,
                  color: colorScheme.neutral.tertiary,
                ),
              ),
              imageBuilder: (context, imageProvider) => DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: appThemeData.radius.radiusTop8,
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
              top: 12,
              left: 12,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: appThemeData.radius.radius30,
                  color: appThemeData.colorScheme.background.background,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4.5,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.abc,
                        size: iconSize,
                        color: iconColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        rating.toString(),
                        style: typography.subhead14Bold,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textAlign: TextAlign.start,
                title,
                style: typography.headline6Bold,
              ),
              const SizedBox(
                height: 4,
              ),
              if (description != null) ...[
                Text(
                  description ?? '',
                  style: typography.subhead14Regular,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.abc,
                        size: iconSize,
                        color: iconColor,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        '$points точек',
                        textAlign: TextAlign.start,
                        style: typography.subhead14Bold,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.abc,
                        size: iconSize,
                        color: iconColor,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        '$length км',
                        textAlign: TextAlign.start,
                        style: typography.subhead14Bold,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.abc,
                        size: iconSize,
                        color: iconColor,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        '~$duration часов',
                        textAlign: TextAlign.start,
                        style: typography.subhead14Bold,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
      ]),
    );
  }
}
