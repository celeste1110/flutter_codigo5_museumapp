import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo5_museumapp/helpers/data/data_dummy.dart';
import 'package:flutter_codigo5_museumapp/ui/general/general_widget.dart';
import 'package:flutter_codigo5_museumapp/ui/responsive/responsive.dart';

import '../models/museum_model.dart';
import '../services/api_service.dart';
import '../ui/widgets/item_slider_3_widget.dart';
import 'artist_page.dart';
import 'cultual_page.dart';

class ExplorerPage extends StatefulWidget {
  const ExplorerPage({Key? key}) : super(key: key);

  @override
  State<ExplorerPage> createState() => _ExplorerPageState();
}

class _ExplorerPageState extends State<ExplorerPage> {
  final APIService _apiService = APIService();
  List<MuseumModel> museum = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    museum = await _apiService.getMuseums();
    // cultural = await _apiService.getCultualProperty();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(ResponsiveUI.of(context).wp(10));
    ResponsiveUI _responsive=ResponsiveUI(context);
    print(_responsive.wp(100));
    print(_responsive.hp(100));
    print(ResponsiveUI.pWidth(context, 0.6));
    print(ResponsiveUI.pHeight(context, 0.8));
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: museum.map((e) => Container(

                  height: 180,
                  margin: const EdgeInsets.only(right: 12),
                  width: ResponsiveUI.of(context).wp(85),
                  decoration: BoxDecoration(
                     color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(e.image),
                    ),
                  ),
                ),
                ).toList(),
              ),
            ),
            divider30,
            const Text(
              'Categorias',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            divider20,
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ItemSlider3Widget(title: 'Artistas',image: 'https://images.pexels.com/photos/3778355/pexels-photo-3778355.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',toPage: ArtistPage(),),
                  ItemSlider3Widget(title: 'Pintura', image: 'https://images.pexels.com/photos/7375049/pexels-photo-7375049.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',toPage: CultualPage(),)

                ]
              ),
            ),


          ],
        ),
      ),
    );
  }
}
