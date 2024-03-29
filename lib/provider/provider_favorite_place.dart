import 'dart:io';

import 'package:favorite_places/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritePlaceNotifier extends StateNotifier<List<Place>> {
  FavoritePlaceNotifier() : super(const []);

  void addNewPlace(String title, File image) {
    final place = Place(title: title, image: image);
    state = [...state, place];
  }

  Place getDetailData(String id) {
    return state.firstWhere((value) => value.id == id);
  }

}

final favoritePlaceProvider = StateNotifierProvider<FavoritePlaceNotifier, List<Place>>((ref) => FavoritePlaceNotifier());
