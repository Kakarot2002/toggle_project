
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:toggleprojectscreen/addDetails.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> data = [1, 2, 3, 4];
  List listw = [];
  String listkw = "";
  // ignore: unused_field
  int _focusedIndex = 0;
  Color red1 = Colors.red;
  Color blue1 = const Color.fromRGBO(33, 150, 243, 1);
  late int count = 5;
  late String str1 = "Pet1";
  late String str2 = "Pet2";
  late int age = 1;

  void _onItemFocus(int index) {
    setState(() {
      _focusedIndex = index;
      if (index == 0) {
        str1 = "Pet 1";
        str2 = "Husky";
        age = 7;
      }
      if (index == 1) {
        str1 = "Pet 2";
        str2 = "Labrador";
        age = 3;
      } else if (index == 2) {
        str1 = "Pet 3";
        str2 = "German";
        age = 5;
      } else if (index == 3) {
        str1 = "Pet 4";
        str2 = "rotviller";
        age = 7;
      } else if (index == 4) {
        str1 = "Pet 5";
        str2 = "pug";
        age = 10;
      } else if (index == (count - 1)) {
        str1 = listkw;
        str2 = listw[1];
        age = listw[2];
      }
    });
  }

  Widget _buildItemList(BuildContext context, int index) {
    if (index == data.length) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Container(
      width: 100,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(40)),
            child: Center(
                child: Text(
              '${data[index]}',
              style: const TextStyle(fontSize: 25.0),
            )),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {




    final Size size = MediaQuery.of(context).size;
    Color _iconColor = Colors.black;

  




    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.green,
          elevation: 0,
        ),
        body: Container(
          color: Colors.grey[200],
          child: Column(
            children: [
            Container(
                height: 100,
                color: Colors.green,
                child: Stack(
                    clipBehavior: Clip.antiAlias,
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 5,
                        child: Container(
                          height: 140,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(70)),
                        ),
                      ),
                      Container(
                        height: 100,
                        color: Colors.transparent,
                        child: Expanded(
                            child: ScrollSnapList(
                          itemBuilder: _buildItemList,
                          itemSize: 100,
                          dynamicItemSize: true,
                          onReachEnd: () {
                            print('Done!');
                          },
                          itemCount: data.length,
                          onItemFocus: _onItemFocus,
                        )),
                      ),
                    ])),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyaddDetailsPage()));
                    setState(() {
                      listkw = result;
                      data.add(count);
                      count++;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    primary: Colors.grey, // <-- Button color
                    onPrimary: Colors.grey, // <-- Splash color
                  ),
                  child: const Icon(Icons.add, color: Colors.black),
                )
              ],
            ),
            Container(
              height: 200,
              width: 300,
              margin: const EdgeInsets.all(10),
              color: Colors.grey[200],
              child: Text(
                " $str1 is aged $age and is a $str2 ",
                style: const TextStyle(color: Colors.grey, fontSize: 50),
              ),
            ),
            Container(
              margin:EdgeInsets.only(top: 245),
              width: size.width,
              height: 80,
              color: Colors.grey[200],
              child: Stack(children: [
                CustomPaint(
                  size: Size(size.width, 80),
                  painter: BNBCustomPainter(),
                ),
                Center(
                  heightFactor: 0.3,
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: Ink(
                      child: const Icon(CupertinoIcons.location_solid, size: 56),
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            
                            colors: [
                              Color.fromRGBO(174, 34, 195, 1),
                              Color.fromRGBO(231, 177, 60, 1)
                            ]
                          ),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),

                Container(
                  width: size.width,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(icon: Icon(Icons.home_outlined,color: _iconColor),onPressed: (){ setState(() {
            _iconColor = Colors.blue;
          });},),
                      IconButton(icon: Icon(Icons.people_outline,color: _iconColor),onPressed: (){ setState(() {
            _iconColor = Colors.blue;
          });},),
                      IconButton(icon: Icon(Icons.favorite_border,color: _iconColor),onPressed: (){ setState(() {
            _iconColor =  Colors.blue;
          });},),
                      IconButton(icon: Icon(Icons.person_outline,color: _iconColor),onPressed: (){ setState(() {
            _iconColor = Colors.blue;
          });},),]
                ),

            )]),
            )
          ]),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.50, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
