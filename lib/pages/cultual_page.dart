
import 'package:flutter/material.dart';
import 'package:flutter_codigo5_museumapp/helpers/data/data_dummy.dart';
import 'package:flutter_codigo5_museumapp/ui/widgets/item_artist_grid_widget.dart';
import 'package:flutter_codigo5_museumapp/ui/widgets/my_app.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/artist_model.dart';
import '../models/cultural_property_model.dart';
import '../services/api_service.dart';
import '../ui/general/colors.dart';
import '../ui/general/general_widget.dart';

class CultualPage extends StatefulWidget {
  const CultualPage({Key? key}) : super(key: key);

  @override
  State<CultualPage> createState() => _CultualPageState();
}

class _CultualPageState extends State<CultualPage> {
  final APIService _apiService = APIService();
  List<CulturalPropertyModel> cultural = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  getData() async {

    cultural = await _apiService.getCultualProperty();

    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 64),
        child: MyAppBar(),
      ),
      body: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                // SliverAppBar(
                //   expandedHeight: 200,
                //   collapsedHeight: 150,
                //   title: Text('AppBar 1'),
                //   centerTitle: true,
                // ),
                SliverAppBar(
                  backgroundColor: kBrandPrimaryColor,
                  leading: SizedBox(),
                  expandedHeight: 200,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Container(
                      height: 100,
                      alignment: Alignment.center,
                      color: Colors.transparent,
                      child: Text(
                        'Pinturas',
                        style: GoogleFonts.dmSans(),
                      ),
                    ),
                    centerTitle: true,
                  ),
                  bottom: TabBar(
                    indicatorWeight: 4,
                    indicatorColor: Colors.blueAccent,
                    tabs: [
                      Tab(
                        text: "Todos",
                      ),
                      Tab(
                        text: "A-Z",
                      ),
                      Tab(
                        text: "Tiempo",
                      ),
                    ],
                  ),
                )
              ];
            },
            body: TabBarView(
              children: [
                // GridView.count(
                //   crossAxisCount: 3,
                //   mainAxisSpacing: 6,
                //   crossAxisSpacing: 6,
                //   children: [
                //     Container(color: Colors.indigo),
                //     Container(color: Colors.redAccent),
                //     Container(color: Colors.green),
                //   ],
                // ),
                // GridView(
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 4,
                //   ),
                //   children: [
                //     Container(color: Colors.indigo),
                //     Container(color: Colors.redAccent),
                //     Container(color: Colors.green),
                //     Container(color: Colors.amber),
                //   ],
                // ),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                  ),
                  itemCount: cultural.length,
                  itemBuilder: (context,index){
                    return ItemGridWidget(cultural: cultural[index], isArtist: false,);
                  },
                ),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                  ),
                  itemCount: imagesDummy.length,
                  itemBuilder: (context,index){
                    return ItemGridWidget(cultural: cultural[index], isArtist: false,);
                  },
                ),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                  ),
                  itemCount: imagesDummy.length,
                  itemBuilder: (context,index){
                    return ItemGridWidget(cultural: cultural[index], isArtist: false,);
                  },
                ),

                // Container(),
                // Container(),
              ],
            )),
      ),
    );
  }
}
