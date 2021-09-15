import 'package:flutter/material.dart';

class List extends StatelessWidget {
  // const List({Key? key}) : super(key: key);
  var iphone5s = "https://www.pngitem.com/pimgs/m/198-1987281_iphone-5s-png-transparent-png.png";
  var iphone6 = "https://e7.pngegg.com/pngimages/70/401/png-clipart-iphone-6-plus-apple-iphone-6-iphone-6s-gold-net-gadget-electronics.png";
  var iphone6s = "https://www.pngitem.com/pimgs/m/59-595525_iphone-6s-png-apple-iphone-6-32gb-space.png";
  var iphone7 = "https://e7.pngegg.com/pngimages/315/931/png-clipart-iphone-8-apple-product-red-telephone-iphone-7-red-gadget-electronics.png";
  var iphone7plus = "https://www.vippng.com/png/detail/385-3854129_apple-iphone-7-plus.png";
  var iphone8 = "https://toppng.com/uploads/preview/apple-iphone-8-64gb-red-mrrm2rma-iphone-8-plus-red-11563402256slnwxk5h9h.png";
  var iphonex = "https://e7.pngegg.com/pngimages/630/527/png-clipart-iphone-x-iphone-8-plus-iphone-4-apple-iphone-gadget-electronics-thumbnail.png";
  var iphone11 = "https://www.vhv.rs/dpng/d/572-5723935_apple-iphone-11-png-iphone-11-pro-max.png";
  var iphone11pro = "https://www.kindpng.com/picc/m/266-2662141_apple-iphone-11-pro-max-iphone-11-pro.png";
  var iphone12 = "https://ansons.ph/wp-content/uploads/2020/12/iPhone-12-Mini_Black_03.png";
  var iphone12pro = "https://www.begawei.com/wp-content/uploads/2020/10/Apple-iPhone-12-Pro.png";

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListData(gambar: iphone5s,judul: "iPhone 5s", deskripsi: "New Design iPhone 5s",),
        ListData(gambar: iphone6,judul: "iPhone 6", deskripsi: "New Design iPhone 6",),
        ListData(gambar: iphone6s,judul: "iPhone 6s", deskripsi: "New Design iPhone 6s",),
        ListData(gambar: iphone7,judul: "iPhone 7", deskripsi: "New Design iPhone 7",),
        ListData(gambar: iphone7plus,judul: "iPhone 7+", deskripsi: "New Design iPhone 7 Plus",),
        ListData(gambar: iphone8,judul: "iPhone 8", deskripsi: "New Design iPhone 8",),
        ListData(gambar: iphonex,judul: "iPhone X", deskripsi: "New Design iPhone X",),
        ListData(gambar: iphone11,judul: "iPhone 11", deskripsi: "New Design iPhone 11",),
        ListData(gambar: iphone11pro,judul: "iPhone 11 Pro", deskripsi: "New Design iPhone 11 Pro",),
        ListData(gambar: iphone12,judul: "iPhone 12", deskripsi: "New Design iPhone 12",),
        ListData(gambar: iphone12pro,judul: "iPhone 12 Pro", deskripsi: "New Design iPhone 12 Pro",),
      ],
    );
  }
}

class ListData extends StatelessWidget {
  const ListData({Key? key, required this.gambar, required this.judul, required this.deskripsi}) : super(key: key);
  final String gambar;
  final String judul;
  final String deskripsi;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      // child: Center(
      child: Row(
        children: <Widget>[
          Image(image: NetworkImage(gambar),width: 100.0,),
          // Text(judul, style: TextStyle(fontSize: 50.0, color: Colors.black),)
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(judul, style: const TextStyle(fontSize: 25.0, color: Colors.black),),
                Text(deskripsi, style: const TextStyle(fontSize: 15.0, color: Colors.grey),),
              ],
            ),
          )
        ],
      ),
      // ),
    );
  }
}
