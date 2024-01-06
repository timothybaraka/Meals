import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
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
