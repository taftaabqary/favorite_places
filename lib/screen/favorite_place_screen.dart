import 'package:favorite_places/models/place_item.dart';
import 'package:favorite_places/provider/provider_favorite_place.dart';
import 'package:favorite_places/screen/favorite_add_screen.dart';
import 'package:favorite_places/screen/favorite_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritePlaceScreen extends ConsumerStatefulWidget {
  const FavoritePlaceScreen({super.key});

  @override
  ConsumerState<FavoritePlaceScreen> createState() {
    return _FavoritePlaceScreenState();
  }
}

class _FavoritePlaceScreenState extends ConsumerState<FavoritePlaceScreen> {
  @override
  Widget build(BuildContext context) {
    final List<PlaceItem> favoritePlaces = ref.watch(providerFavoritePlace);

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
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: ListView.builder(
            itemCount: favoritePlaces.length,
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => FavoriteDetailScreen(
                  id: favoritePlaces[index].id)));
              },
              title: Text(favoritePlaces[index].title),
            )
        ),
      ),
    );
  }
}