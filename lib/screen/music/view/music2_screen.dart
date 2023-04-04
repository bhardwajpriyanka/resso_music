import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resso_music/screen/home/provider/home_provider.dart';



class music2 extends StatefulWidget {
  const music2({Key? key}) : super(key: key);

  @override
  State<music2> createState() => _music2State();
}

class _music2State extends State<music2> {
  Homeprovider? homeprovidertrue;
  Homeprovider? homeproviderfalse;

  @override
  void initState() {
    super.initState();
    Provider.of<Homeprovider>(context,listen: false).initaudio();

  }
  @override
  Widget build(BuildContext context) {
    homeprovidertrue = Provider.of<Homeprovider>(context, listen: true);
    homeproviderfalse = Provider.of<Homeprovider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Text(
                        "For You",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 25,
                        color: Colors.white,
                      )
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 25,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 500,
                width: double.infinity,
                color: Colors.white,
                child: Image.asset("${homeproviderfalse!.immg[song]}", fit: BoxFit.cover),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.favorite,
                    size: 25,
                    color: Colors.white,
                  ),
                  // SizedBox(width: 20,),
                  Icon(
                    Icons.comment,
                    size: 25,
                    color: Colors.white,
                  ),
                  // SizedBox(width: 20,),
                  Icon(
                    Icons.share,
                    size: 25,
                    color: Colors.white,
                  ),
                  // SizedBox(width: 20,),
                  Icon(
                    Icons.download,
                    size: 20,
                    color: Colors.white60,
                  ),
                  // SizedBox(width: 20,),
                  Icon(
                    Icons.queue_music,
                    size: 20,
                    color: Colors.white60,
                  ),
                  // SizedBox(width: 20,),
                  Icon(
                    Icons.more_vert,
                    size: 20,
                    color: Colors.white60,
                  ),
                ],
              ),
              Slider(
                activeColor: Colors.white,
                inactiveColor: Colors.white,
                autofocus: true,
                value: 0,
                onChanged: (value) {
                    homeproviderfalse!.assetsAudioPlayer;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () {
                        homeproviderfalse!.previoussong();
                      },
                      child: Icon(
                        Icons.skip_previous,
                        color: Colors.white,
                        size: 25,
                      )),
                  IconButton(
                    onPressed: () {
                      homeproviderfalse!.playAudio();
                    },
                    icon: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 25),
                  ),
                  IconButton(
                    onPressed: () {
                      homeproviderfalse!.pauseAudio();
                    },
                    icon: Icon(Icons.pause ,
                        color: Colors.white,
                        size: 25),
                  ),
                  InkWell(
                      onTap: () {
                        homeproviderfalse!.nextsong();
                      },
                      child: Icon(
                        Icons.skip_next,
                        color: Colors.white,
                        size: 25,
                      )),
                  IconButton(
                    onPressed: () {
                      homeproviderfalse!.muteorunmute();
                    },
                    icon: Icon(
                        homeproviderfalse!.ismute
                            ? Icons.volume_off
                            : Icons.volume_up,
                        color: Colors.white,
                        size: 25),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
