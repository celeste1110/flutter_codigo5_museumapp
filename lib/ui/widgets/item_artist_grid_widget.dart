import 'package:flutter/material.dart';
import 'package:flutter_codigo5_museumapp/models/artist_model.dart';
import 'package:flutter_codigo5_museumapp/models/cultural_property_model.dart';

import '../../pages/artis_detail_page.dart';
import '../general/colors.dart';
import '../general/general_widget.dart';

class ItemGridWidget extends StatelessWidget {
  // String image;
  bool isArtist;
  ArtistModel? artist;
  CulturalPropertyModel? cultural;
  ItemGridWidget({this.artist,this.cultural,required this.isArtist});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isArtist?(){


        Navigator.push(context, MaterialPageRoute(builder: (context)=> ArtistDetailPage(artist: artist!,)));
      }:null,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(isArtist?artist!.image:cultural!.image),
          ),

        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [
                      kBrandPrimaryColor.withOpacity(0.7),
                      kBrandPrimaryColor.withOpacity(0.05),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  divider6,
                  Text(
                    isArtist?artist!.mame:cultural!.mame,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    '243 items',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
