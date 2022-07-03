import 'package:flutter/material.dart';
import 'package:flutter_codigo5_museumapp/models/museum_model.dart';

import '../general/general_widget.dart';

class ItemSlider2Widget extends StatelessWidget {
  MuseumModel museo;
  ItemSlider2Widget({required this.museo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      margin: EdgeInsets.only(right: 32),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      museo.image,
                    ),
                  ),
                ),

              ),
              Positioned.fill(
                bottom: -20,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.person,
                      color: Color(0xffD6A527),
                      size: 30,
                    ),


                  ),
                ),
              )
            ],
          ),
          divider30,
          Text(
            'EXPLORAR',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          divider6,
          Text(
            museo.mame,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          divider6,
          Text(
            museo.address,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
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
