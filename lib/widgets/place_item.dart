import 'package:flutter/material.dart';

import '../models/place.dart';
import '../screen/favorite_detail_screen.dart';

class PlaceItem extends StatelessWidget {
  const PlaceItem({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if(places.isEmpty) {
      return Center(child: Text(
        'No places added yet',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),
      ));
    } else {
      return ListView.builder(
          itemCount: places.length,
          itemBuilder: (context, index) => ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => FavoriteDetailScreen(
                  place: places[index])
              )
              );
            },
            leading: CircleAvatar(
                radius: 26,
                backgroundImage: FileImage(places[index].image),
              ),
            title: Text(
              places[index].title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
              ),
            ),
          )
      );
    }
  }
}
