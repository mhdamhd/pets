import 'package:flutter/material.dart';
import 'package:pets/features/cats/domain/entities/cat_entity.dart';
import 'package:pets/shared/widgets/app_network_image.dart';

class CatCard extends StatelessWidget {
  final CatEntity cat;
  const CatCard({super.key, required this.cat});

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
        child: AppNetworkImage(url: cat.image),
      ),
    );
  }
}
