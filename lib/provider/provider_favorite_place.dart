import 'package:favorite_places/models/place_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderPlace extends StateNotifier<List<PlaceItem>> {
  ProviderPlace() : super([]);

  void addNewPlace(PlaceItem place) {
    state = [
      ...state,
      place
    ];
  }

  PlaceItem getDetailData(String id) {
    return state.firstWhere((value) => value.id == id);
  }

}

final providerFavoritePlace = StateNotifierProvider<ProviderPlace, List<PlaceItem>>((ref) => ProviderPlace());
