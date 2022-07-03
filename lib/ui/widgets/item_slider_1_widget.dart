import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemSliderWidget extends StatelessWidget {
  String image;
  ItemSliderWidget({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6,vertical: 10),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
