import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:iot_unlock/data/entity/entities.dart';
import 'package:iot_unlock/utils/Utils.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  // 声明一个list，存放image Widget
  List<Widget> imageList = List();

  @override
  void initState() {
    imageList
      ..add(Image.network(
        'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2726034926,4129010873&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3485348007,2192172119&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=190488632,3936347730&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DeviceEntity device = DeviceEntity.fromJson(
        {'name': '大门', 'icon': 'door_close.svg', 'open': false});
    return Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          title: Text('轮播图'),
        ),
        body: ListView(
          // 这里使用listView是因为本地写了几组不同样式的展示，太懒了，所以这里就没有改
          children: <Widget>[
            firstSwiperView(),
            GridView.count(
              crossAxisCount: 2,
              physics: ScrollPhysics(), // to disable GridView's scrolling
              shrinkWrap: true,
              children: <Widget>[
                _buildDevice(device),
                _buildDevice(device),
                _buildDevice(device),
                _buildDevice(device),
                _buildDevice(device),
                _buildDevice(device),
                _buildDevice(device),
                _buildDevice(device),
                _buildDevice(device),
                _buildDevice(device),
              ],
            ),
          ],
        ));
  }

  Widget firstSwiperView() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Swiper(
        itemCount: 4,
        itemBuilder: _swiperBuilder,
        pagination: SwiperPagination(
            alignment: Alignment.bottomRight,
            margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
            builder: DotSwiperPaginationBuilder(
                color: Colors.black54, activeColor: Colors.white)),
        controller: SwiperController(),
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: (index) => print('点击了第$index'),
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (imageList[index]);
  }

  Widget _buildDevice(DeviceEntity entity) {
    Widget avatar = new SvgPicture.asset(
      Utils.getImgPath(entity.icon),
      color: Colors.green,
    );
    return Card(
        elevation: 15, //设置阴影
        child: Container(
          margin: EdgeInsets.all(10),
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    entity.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  new SizedBox(
                    width: 60.0,
                    height: 60.0,
                    child: avatar,
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: avatar,
                ),
              )
            ],
          ),
        ));
  }
}

//Widget _buildDevice(DeviceEntity entity) {
//  Widget avatar = new SvgPicture.asset(
//    Utils.getImgPath(entity.icon),
//    color: Colors.green,
//  );
//  return Card(
//      elevation: 15, //设置阴影
//      child: Container(
//        margin: EdgeInsets.all(0),
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceAround,
//          crossAxisAlignment: CrossAxisAlignment.end,
//          children: <Widget>[
//            Column(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: <Widget>[
//                Text(
//                  entity.name,
//                  style: TextStyle(
//                      fontWeight: FontWeight.bold,
//                      fontSize: 16,
//                      color: Colors.black),
//                ),
//                new SizedBox(
//                  width: 60.0,
//                  height: 60.0,
//                  child: avatar,
//                ),
//              ],
//            ),
//            new SizedBox(
//              width: 40.0,
//              height: 40.0,
//              child: avatar,
//            ),
//          ],
//        ),
//      ));
//}

//Card(
//elevation: 15, //设置阴影
//child: Container(
//margin: EdgeInsets.all(10),
//child: Column(
//crossAxisAlignment: CrossAxisAlignment.start,
//children: <Widget>[
//Text(
//entity.name,
//style: TextStyle(
//fontWeight: FontWeight.bold,
//fontSize: 16,
//color: Colors.black),
//),
//Row(
//mainAxisAlignment: MainAxisAlignment.spaceAround,
//children: <Widget>[
//new SizedBox(
//width: 40.0,
//height: 40.0,
//child: avatar,
//),
//Image.asset(
//Utils.getImgPath(entity.icon),
//color: Colors.grey,
//),
//],
//)
//],
//),
//));
