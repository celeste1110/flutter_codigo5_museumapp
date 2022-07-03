import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo5_museumapp/helpers/data/data_dummy.dart';
import 'package:flutter_codigo5_museumapp/ui/general/colors.dart';
import 'package:flutter_codigo5_museumapp/ui/widgets/item_slider_1_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/cultural_property_model.dart';
import '../models/museum_model.dart';
import '../services/api_service.dart';
import '../ui/general/general_widget.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../ui/widgets/item_slider_2_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final APIService _apiService = APIService();
  List<MuseumModel> museum = [];
  List<CulturalPropertyModel> cultural = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    museum = await _apiService.getMuseums();
    cultural = await _apiService.getCultualProperty();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            divider20,
            Text(
              'Explorar Museos',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            divider12,
            Text(
              'Que quieres visitar hoy?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            divider12,
            // SingleChildScrollView(
            //   physics: const BouncingScrollPhysics(),
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children:
            //         imagesDummy.map((e) => ItemSliderWidget(image: e)).toList(),
            //   ),
            // ),
            divider6,
            SizedBox(
              height: 180,
              child: PageView.builder(
                controller: PageController(
                  viewportFraction: 0.5,
                  initialPage: 0,
                ),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padEnds: false,
                pageSnapping: true,
                onPageChanged: (int value) {},
                itemCount: museum.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(14.0),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(museum[index].image),
                      ),
                    ),
                  );
                },
              ),
            ),

            //   Column(
            //   children: [
            //     Container(
            //       height: 180,
            //
            //       child: PageView(
            //         controller: PageController(
            //           viewportFraction: 0.5,
            //           initialPage: 0
            //         ),
            //         scrollDirection: Axis.horizontal,
            //         physics: const BouncingScrollPhysics(),
            //         padEnds: false,
            //         pageSnapping: true,
            //         onPageChanged: (int value){
            //
            //         },
            //
            //         children: [
            //         Container(
            //
            //           color: Colors.red,
            //
            //         ),
            //
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
              ),
              onPressed: () {},
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Explora mas de 3000 colecciones',
                ),
              ),
            ),
            divider12,
            Container(
              padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 14),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white.withOpacity(0.06),
              ),
              child: Column(
                children: [
                  ClipRRect(
                 
                    borderRadius:BorderRadius.circular(100) ,
                    child: Image.asset(
                      
                      'assets/images/regalo.png',
                      width: 160,
                      
                    ),
                  ),
                  Text(
                    "Culture Box",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  divider12,
                  Text(
                    "Suscribete para recibir noticias, historias y actualizaciones semanalmente.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  divider6,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                            side: const BorderSide(
                              width: 1.2,
                              color: Colors.white10,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'No, Gracias',
                        ),
                      ),
                      dividerWitdh12,
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                            side: const BorderSide(
                              width: 1.2,
                              color: Colors.white10,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Suscribirme',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            divider30,
            Text(
              'La mejores selecciones de hoy',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            divider20,
            SizedBox(
              height: 400,
              child: Swiper(
                // viewportFraction: 0.9,
                // scale: 0.6,
                itemCount: cultural.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          cultural[index].image,
                        ),
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
                                  kBrandPrimaryColor.withOpacity(0.9),
                                  kBrandPrimaryColor.withOpacity(0.1),
                                ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${cultural[index].mame}",
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              divider6,
                              Text(
                                cultural[index].description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },

                itemWidth: width * 0.7,
                layout: SwiperLayout.STACK,
                autoplay: true,
                controller: SwiperController(),
              ),
            ),
            divider30,
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://images.pexels.com/photos/1509534/pexels-photo-1509534.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'El festival cultural',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Encabezando hoy',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                      height: 200,
                      width: double.infinity,
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://images.pexels.com/photos/1161542/pexels-photo-1161542.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          ),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Text(
                                  'La primera presentacion de la noche',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              divider12,
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black.withOpacity(0.28),
                                    elevation: 0,
                                    side: const BorderSide(
                                        color: Colors.black87, width: 1.8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7),
                                    )),
                                onPressed: () {},
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 7),
                                  child: Text(
                                    'Reproducir video',
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                ],
              ),
            ),

            // StaggeredGrid.count(
            //   crossAxisCount: 2,
            //   crossAxisSpacing: 4,
            //   mainAxisSpacing: 4,
            //   children: [
            //    Container(
            //      color: Colors.pinkAccent,
            //      height: 200,
            //    ),
            //     Container(
            //       color: Colors.deepPurpleAccent,
            //       height: 300,
            //     ),
            //     Container(
            //       color: Colors.yellow,
            //       height: 400,
            //     ),
            //   ],
            // ),

            // StaggeredGrid.count(
            //   crossAxisCount: 2,
            //   mainAxisSpacing: 4,
            //   crossAxisSpacing: 4,
            //   children: [
            //     StaggeredGridTile.count(
            //       crossAxisCellCount: 2,
            //       mainAxisCellCount: 1,
            //       child: Container(
            //         color: Colors.red,
            //       ),
            //     ),
            //     StaggeredGridTile.count(
            //       crossAxisCellCount: 1,
            //       mainAxisCellCount: 1,
            //       child:  Container(
            //       color: Colors.lightGreen,
            //     ),
            //     ),
            //     StaggeredGridTile.count(
            //       crossAxisCellCount: 1,
            //       mainAxisCellCount: 2,
            //       child:  Container(
            //         color: Colors.blue,
            //       ),
            //     ),
            //     StaggeredGridTile.count(
            //       crossAxisCellCount: 1,
            //       mainAxisCellCount: 1,
            //       child:  Container(
            //         color: Colors.pinkAccent,
            //       ),
            //     ),
            //     StaggeredGridTile.count(
            //       crossAxisCellCount: 4,
            //       mainAxisCellCount: 2,
            //       child:  Container(
            //         color: Colors.greenAccent,
            //       ),
            //     ),
            //     // Container(
            //     //   color: Colors.red,
            //     //   width: 200,
            //     //   height: 100,
            //     // ),
            //     // Container(
            //     //   color: Colors.blue,
            //     //   width: 200,
            //     //   height: 200,
            //     // ),
            //     // Container(
            //     //   color: Colors.orange,
            //     //   width: 200,
            //     //   height: 200,
            //     // ),
            //     // Container(
            //     //   color: Colors.lightGreen,
            //     //   width: 200,
            //     //   height: 200,
            //     // ),
            //   ],
            // ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'La mejores selecciones de hoy',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            divider30,
            MasonryGridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemCount: cultural.length,
              itemBuilder: (context, index) {
                return Container(
                  height: (index % 3 + 2) * 100,
                  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(14),
                      image: DecorationImage(
                          image: NetworkImage(cultural[index].image),
                          fit: BoxFit.cover)),
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
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.blue),
                              child: Text(
                                cultural[index].artist,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            divider6,
                            Text(
                              cultural[index].mame,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
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
                );
              },
            ),
            divider20,
            Text(
              'Explorar Museos',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            divider12,
            Text(
              'Que quieres visitar hoy?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            divider12,
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: museum
                      .map(
                        (e) => ItemSlider2Widget(museo: e),
                      )
                      .toList()),
            ),

            divider40,
            divider40,
          ],
        ),
      ),
    );
  }
}
