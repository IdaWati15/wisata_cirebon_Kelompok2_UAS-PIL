import 'package:flutter/material.dart';
import 'package:wisata_cirebon/detail_screen.dart';
import 'package:wisata_cirebon/model/tambah_wisata.dart';
import 'package:wisata_cirebon/model/tourism_place.dart';
import 'package:wisata_cirebon/wisata_page.dart';
import 'package:wisata_cirebon/model/travel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen ({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Travel> _travelList = Travel.getTravelItems();
    List<Travel> _nearestTravelList = Travel.getNearestItems();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
             return const Tambahwisata();
             }));
          },child: Icon(Icons.add),
      ),
            Image.asset(
              "images/menu.png",
              width: 30,
            
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "images/pin.png",
                  width: 20,
                ),
                const SizedBox(
                  width: 2,
                ),
                const Text(
                  'CIREBON',
                  style: TextStyle(color: Color(0xff8f294f), fontSize: 16.0),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xff8f294f),
                )
              ],
            ),
            
          ],
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                    text: 'Beranda',
                    style: const TextStyle(
                        color: Color(0xff8f294f), fontSize: 32, height: 1.3),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' Rekomendasi Wisata Cirebon',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(.8)))
                    ]),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "images/search.png",
                        width: 24,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search wisata'),
                        ),
                      ),
                      Image.asset(
                        "images/option.png",
                        width: 24,
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.1),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Pilihlah sesuka hatimu',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff8f294f)),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                height: size.height * .4,
                child: ListView.builder(
                    itemCount: _nearestTravelList.length,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: GestureDetector(
                          onTap: (){
                            
                          },
                          child: Stack(
                            children: [
                              ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(24),
                                  ),
                                  child: Image.asset(
                                      _nearestTravelList[index].imageUrl[0])),
                              Positioned(
                                bottom: 20,
                                left: 20,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(0, 0, 0, .5),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      )),
                                  child: Text(
                                    _nearestTravelList[index]
                                            .distance
                                            .toString() +
                                        "km",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Daftar tempat wisata',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff8f294f)),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                height: size.height * .4,
                child: ListView.builder(
                    itemCount: tourismPlaceList.length,
                    itemBuilder: (context, index) {
                    final TourismPlace place = tourismPlaceList[index]; {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 7.0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return DetailScreen(place: place);
                        }));
                          },
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: Image.asset(
                                  _travelList[index].imageUrl[1],
                                  fit: BoxFit.fill,
                                  height: 60.0,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _travelList[index].name,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          _travelList[index].location,
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            color: Color(0xff686771),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "images/star.png",
                                              width: 30,
                                            ),
                                            Text(
                                              _travelList[index]
                                                  .rating
                                                  .toString(),
                                              style: const TextStyle(
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
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
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
