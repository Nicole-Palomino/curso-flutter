import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PaginaUser extends StatefulWidget {
  const PaginaUser({super.key});

  @override
  State<PaginaUser> createState() => _PaginaUserState();
}

class _PaginaUserState extends State<PaginaUser> {

  final List<String> imgList = [
    'https://estaticos-cdn.prensaiberica.es/clip/e6063c52-a481-4f64-8dcf-e7c2a4dce1cd_alta-libre-aspect-ratio_default_0.jpg',
    'https://english.ahram.org.eg/Media/News/2023/12/29/41_2023-638394505916982791-698.jpg',
    'https://cdn.vox-cdn.com/thumbor/ra8sctqLekc-ujEJWMvFGrTs9pY=/0x0:4005x3076/1200x800/filters:focal(1516x254:2156x894)/cdn.vox-cdn.com/uploads/chorus_image/image/72164051/1481027917.0.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Container(
        child: _swiper(),
      )
    );
  }

  Widget _swiper() {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 250.0,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
        items: imgList.map((item) => Container(
          child: Center(
            child: Image.network(item, fit: BoxFit.cover, width: 340,),
          ),
        )).toList(),
      ),
    );
  }
}