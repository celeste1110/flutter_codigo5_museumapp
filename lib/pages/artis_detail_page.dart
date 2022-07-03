import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo5_museumapp/models/artist_model.dart';
import 'package:flutter_codigo5_museumapp/ui/general/colors.dart';
import 'package:flutter_codigo5_museumapp/ui/general/general_widget.dart';
import 'package:flutter_codigo5_museumapp/ui/responsive/responsive.dart';

import '../ui/widgets/my_app.dart';
import 'package:logger/logger.dart';
class ArtistDetailPage extends StatefulWidget {

  ArtistModel artist;
  ArtistDetailPage({required this.artist});
  @override
  State<ArtistDetailPage> createState() => _ArtistDetailPageState();
}

class _ArtistDetailPageState extends State<ArtistDetailPage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: ResponsiveUI.pHeight(context, 0.4),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        widget.artist.image,
                      ),
                    ),
                  ),
                ),
                PreferredSize(
                  preferredSize: Size(double.infinity, 64),
                  child: MyAppBar(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  divider40,
                  Center(
                    child: Text(
                     widget.artist.mame,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  divider12,
                  Center(
                    child: Text(
                      widget.artist.birthDate.toString().substring(0,10),
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  divider30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.white,
                        ),
                      ),
                      dividerWitdh12,
                      dividerWitdh6,
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  divider30,
                  Text(
                    '''${widget.artist.biography}
''',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      height: 1.4,
                    ),
                    maxLines: !isExpanded ? 3 : null,
                    overflow: !isExpanded
                        ? TextOverflow.ellipsis
                        : TextOverflow.visible,
                  ),
                  divider6,
                  GestureDetector(
                    onTap: () {
                      isExpanded = !isExpanded;
                      setState(() {});
                    },
                    child: Text(
                      !isExpanded ? 'Más informacion' : 'Menos informacion',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  // AnimatedContainer(
                  //   duration:Duration(milliseconds: 1200),
                  //   height: 54,
                  //   color: Colors.red,
                  //   child: Text(
                  //     '''Nació el 30 de marzo de 1853. Hijo de un austero y humilde pastor protestante neerlandés llamado Theodorus y de su mujer Anna Cornelia, Vincent recibió el mismo nombre que le habían puesto a un hermano que nació muerto exactamente un año antes. El 1 de mayo de 1857 nació su hermano Theo y ambos tuvieron cuatro hermanos más: Cornelius Vincent, Elisabetha Huberta, Anna Cornelia y Wilhelmina Jacoba.''',
                  //     style: TextStyle(
                  //       color: Colors.yellow,
                  //     ),
                  //      maxLines: 3,
                  //      overflow: TextOverflow.ellipsis,
                  //
                  //   ),
                  // ),
                  divider20,
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 12),
                    decoration: BoxDecoration(
                      // color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                      border:Border.all(
                        color: Colors.white12,
                        width: 1.2,

                      ),
    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ONLINE EXIBIT',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'ACamino en los campos de trigo ',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Impresionismo',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.description,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            divider6,
            divider30,
          ],
        ),
      ),
    );
  }
}
