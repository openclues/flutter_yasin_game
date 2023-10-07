import 'dart:math';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yasin/particles_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double dx = 0.0;
  double dy = 0.0;
  bool showImage = false;
  AudioPlayer player = AudioPlayer();
  bool? showfire = false;
  late List<Particle> ps;

  Particle p = Particle();
  Offset? location = Offset(100, 100);
  @override
  void initState() {
    ps = p.createListOfParticles(100, 1000, 500);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        String audioasset = "assets/cartoon-jump-6462.mp3";
        ByteData bytes =
            await rootBundle.load(audioasset); //load audio from assets
        Uint8List audiobytes =
            bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

        setState(() {
          showImage = true;
        });
        // await player.setSource(AssetSource('cartoon-jump-6462.mp3'));
      },
      onTapDown: (d) async {
        String audioasset = "assets/cartoon-jump-6462.mp3";
        ByteData bytes =
            await rootBundle.load(audioasset); //load audio from assets
        Uint8List audiobytes =
            bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
        await player.play(BytesSource(audiobytes));

        setState(() {
          showImage = true;
        });
        // await player.setSource(
        setState(() {
          showImage = true;
        });
      },
      onTapUp: (f) {
        setState(() {
          showImage = false;
        });
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 3.5)),
            showImage == true
                ? Container(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(showoneImage()))
                : SizedBox(),
            Spacer(),
            GestureDetector(
                child: Center(
              child: Container(
                height: 200,
                width: 200,
                child: Stack(
                  children: [
                    showfire == true
                        ? Image.asset('assets/output-onlinegiftools.gif')
                        : SizedBox(),
                    GestureDetector(
                      onTapDown: (d) async {
                        String audioasset = "assets/cartoon-jump-6462.mp3";
                        ByteData bytes = await rootBundle
                            .load(audioasset); //load audio from assets
                        Uint8List audiobytes = bytes.buffer.asUint8List(
                            bytes.offsetInBytes, bytes.lengthInBytes);
                        await player.play(BytesSource(audiobytes));

                        setState(() {
                          showImage = true;
                        });
                        // await player.setSource(
                        setState(() {
                          showImage = true;
                        });
                        setState(() {
                          showfire = true;
                        });
                      },
                      onTapUp: ((details) {
                        setState(() {
                          showfire = false;
                        });
                      }),
                      child: Image.asset(
                        'assets/fing.png',
                      ),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  String showoneImage() {
    List<String> images = [
      'assets/rabbit-cute-animal.gif',
      'assets/d7cefc2f75856c69810e5964be49f283_w200.gif',
      'assets/6ddf8102bebafacc0577cb500d702da3.gif',
      'assets/squirrel-crazy.gif',
      'assets/dancing-cute.gif',
      'assets/a61.gif',
      'assets/cute-animals.gif',
      'assets/5f70b1300f43386929b595b760e7387c_w200.gif',
      'assets/tumblr_cc2ba400ec2d51a262299a8edf7a74bd_94db9c56_540.gif',
      'assets/Animaker-monkey.gif',
      'assets/Animaker-giraffe.gif',
      'assets/Animaker-elephant.gif',
      'assets/Animaker-bear.gif',
      'assets/Animaker-hippo.gif',
      'assets/Animaker-deer.gif',
      'assets/Animaker-Zebra.gif'
    ];
    images.shuffle();
    final _random = new Random();

    return images[_random.nextInt(images.length)];
  }
}
