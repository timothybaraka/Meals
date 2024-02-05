import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favorites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealFavoriteStatus(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(wasAdded
                        ? 'Meal is now a favorite'
                        : 'Meal removed as favorite')));
              },
              icon: isFavorite
                  ? const Icon(Icons.star)
                  : const Icon(Icons.star_border))
        ],
      ),
      body: Column(
        children: [
          Image.network(meal.imageUrl,
              height: 300, width: double.infinity, fit: BoxFit.cover),
          const SizedBox(height: 10),
          const Text('Ingridients',
              style: TextStyle(fontSize: 20, color: Colors.amber)),
          const SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (context, index) {
                    return Text(
                      meal.ingredients[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    );
                  })),
          const SizedBox(height: 10),
          const Text('Steps',
              style: TextStyle(fontSize: 20, color: Colors.amber)),
          const SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
            itemCount: meal.steps.length,
            itemBuilder: (context, index) {
              return Text(meal.steps[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white));
            },
          ))
        ],
      ),
    );
  }
}
