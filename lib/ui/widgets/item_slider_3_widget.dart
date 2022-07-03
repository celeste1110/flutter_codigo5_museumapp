import 'package:flutter/material.dart';

import '../general/general_widget.dart';
import '../responsive/responsive.dart';

class ItemSlider3Widget extends StatelessWidget {
  String title;
  String image;
  Widget toPage;

  ItemSlider3Widget({required this.title,required this.image,required this.toPage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> toPage));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(

            height: 180,
            margin: const EdgeInsets.only(right: 12),
            width: ResponsiveUI.of(context).wp(50),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(image),
              ),
            ),
          ),
          divider6,
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          divider6,


          Text(
            '12 999 artistas',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
