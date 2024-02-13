import 'package:favorite_places/provider/provider_favorite_place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteDetailScreen extends ConsumerWidget {
  const FavoriteDetailScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailData = ref.read(favoritePlaceProvider.notifier).getDetailData(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(detailData.title),
      ),

      body: Center(
        child: Text(detailData.title, style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Colors.white
        ),),
      ),
    );
  }
}