import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resso_music/screen/home/provider/home_provider.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _Home_screenState();
}

class _Home_screenState extends State<homescreen> {
  Homeprovider? homeprovidertrue;
  Homeprovider? homeproviderfalse;

  @override
  Widget build(BuildContext context) {
    homeprovidertrue = Provider.of<Homeprovider>(context, listen: true);
    homeproviderfalse = Provider.of<Homeprovider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 315,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.search, color: Colors.black, size: 25),
                            SizedBox(
                              width: 30,
                            ),
                            Text("Search",
                                style: TextStyle(
                                    color: Colors.black,
                                    letterSpacing: 1,
                                    fontSize: 15)),
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Icon(
                      Icons.music_note_rounded,
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Text(
                  "Mahiya",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 2),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      // return Container(height: 100,width: 100,color: Colors.red,margin: EdgeInsets.all(5),);
                      return InkWell(
                          onTap: () {
                            song = index;
                            Navigator.pushNamed(context, 'Music2');
                          },
                          child: rajj(index)
                      );

                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, mainAxisExtent: 300),
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "Made for you",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  margin: EdgeInsets.all(15),
                  width: double.infinity,
                  child: GridView.builder(scrollDirection: Axis.horizontal,shrinkWrap: true,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),itemCount: homeproviderfalse!.artist.length, itemBuilder: (context, index) {
                    return InkWell(onTap: () {
                      Navigator.pushNamed(context, 'badshah', arguments: index);
                    },child: diya(index));
                  },),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Pick 'n' Max",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 2),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      // return Container(height: 100,width: 100,color: Colors.red,margin: EdgeInsets.all(5),);
                      return InkWell(
                          onTap: () {
                            song = index;
                            Navigator.pushNamed(context, 'Music2');
                          },
                          child: rajj(index)
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, mainAxisExtent: 300),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget diya(index)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
          },
          child: Container(
            height: 150,
            width: 120,
            color: Colors.white,
            child: Image.asset("${homeproviderfalse!.artist[index]}",
                fit: BoxFit.cover),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "${homeproviderfalse!.artname[index]}",
          style: TextStyle(
              color: Colors.white,
              letterSpacing: 3,
              fontWeight: FontWeight.bold),
        ),
        Text(
          "${homeproviderfalse!.artsub[index]}",
          style: TextStyle(
            color: Colors.white60,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }

  Widget rajj(int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 70,
          width: 70,
          color: Colors.yellow,
          child: Image.asset(
            "${homeproviderfalse!.immg[index]}",
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${homeproviderfalse!.naam[index]}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "${homeproviderfalse!.subnaam[index]}",
              style: TextStyle(color: Colors.white60),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}