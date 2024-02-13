import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/provider/provider_favorite_place.dart';
import 'package:favorite_places/screen/favorite_add_screen.dart';
import 'package:favorite_places/widgets/place_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritePlaceScreen extends ConsumerWidget {
  const FavoritePlaceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Place> favoritePlaces = ref.watch(favoritePlaceProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Favorite Places'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FavoriteAddScreen()));
              },
              icon: const Icon(Icons.add)
          )
        ],
      ),
      body: PlaceItem(places: favoritePlaces)
    );
  }
}