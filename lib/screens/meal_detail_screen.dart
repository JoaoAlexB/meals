import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontFamily: 'RobotoCondensed',
        ),
      ),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
        width: 300,
        height: 200,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              _createSectionTitle(context, 'Ingredientes'),
              _createSectionContainer(
                ListView(
                  children: meal.ingredients.map((i) {
                    return Card(
                      color: Theme.of(context).colorScheme.secondary,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(i),
                      ),
                    );
                  }).toList(),
                ),
              ),
              _createSectionTitle(context, 'Passos'),
              _createSectionContainer(
                ListView(
                  children: meal.steps.asMap().entries.map((steps) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('${steps.key + 1}'),
                      ),
                      title: Text(steps.value),
                    );
                  }).toList(),
                ),
                // ListView.builder(
                //   itemBuilder: (context, index) {
                //     return ListTile(
                //       leading: CircleAvatar(
                //         child: Text('${index + 1}'),
                //       ),
                //       title: Text(meal.steps[index]),
                //     );
                //   },
                // ),
              )
            ],
          ),
        ));
  }
}
