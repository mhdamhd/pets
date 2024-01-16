import 'package:flutter/material.dart';
import 'package:pets/features/dogs/domain/entities/dog_entity.dart';
import 'package:pets/shared/widgets/app_network_image.dart';

class DogCard extends StatelessWidget {
  final DogEntity dog;
  const DogCard({super.key, required this.dog});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 5)]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            AppNetworkImage(url: dog.image),
            const SizedBox(height: 5),
            Text(dog.name, style:  Theme.of(context).textTheme.bodyLarge),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(dog.description, style: Theme.of(context).textTheme.bodyMedium),
            )
          ],
        ),
      ),
    );
  }
}
