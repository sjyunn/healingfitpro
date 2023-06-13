import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hfitpro/screens/manual_screen.dart';
import 'package:hfitpro/screens/mode_screen.dart';
import 'package:hfitpro/screens/mypage_screen.dart';
import 'package:hfitpro/screens/review_screen.dart';
import 'package:hfitpro/screens/time_screen.dart';
import 'package:hfitpro/screens/strength_screen.dart';
import 'package:hfitpro/screens/volumn_screen.dart';
import 'package:hfitpro/screens/music_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1800;
  int totalSeconds = twentyFiveMinutes;
  bool isRunning = false;
  int totalPomodoros = 0;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        isRunning = false;
        totalSeconds = twentyFiveMinutes;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onStopPressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
      totalSeconds = twentyFiveMinutes;
    });
  }

  void modeChangePressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ModeChange()),
    );
  }

  void timeChangePressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TimeChange()),
    );
  }

  void strengthChangePressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const StrengthChange()),
    );
  }

  void volumnChangePressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const VolumnChange()),
    );
  }

  void musicChangePressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MusicChange()),
    );
  }

  void runtimeDownPressed() {
    setState(() {
      if (totalSeconds > 600) {
        totalSeconds = totalSeconds - 300;
      }
    });
  }

  void runtimeUpPressed() {
    setState(() {
      if (totalSeconds < 3000) {
        totalSeconds = totalSeconds + 300;
      }
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        title: const Text(
          'HealingFit Pro',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    isRunning ? 'TES동작중' : 'TES시작',
                    style: TextStyle(
                      color: Theme.of(context).canvasColor,
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      iconSize: 40,
                      color:
                          isRunning ? Colors.grey : Theme.of(context).cardColor,
                      onPressed: isRunning ? () {} : runtimeDownPressed,
                      icon: const Icon(Icons.arrow_circle_left_outlined),
                    ),
                    Text(
                      format(totalSeconds),
                      style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontSize: 69,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      iconSize: 40,
                      color:
                          isRunning ? Colors.grey : Theme.of(context).cardColor,
                      onPressed: isRunning ? () {} : runtimeUpPressed,
                      icon: const Icon(Icons.arrow_circle_right_outlined),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            flex: 3,
            child: isRunning
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: IconButton(
                          iconSize: 150,
                          color: Theme.of(context).cardColor,
                          onPressed: onStopPressed,
                          icon: const Icon(Icons.stop_circle_outlined),
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: 60,
                              color: Theme.of(context).cardColor,
                              onPressed: modeChangePressed,
                              icon:
                                  const Icon(Icons.airline_seat_recline_normal),
                            ),
                            IconButton(
                              iconSize: 60,
                              color: Theme.of(context).cardColor,
                              onPressed: timeChangePressed,
                              icon: const Icon(Icons.access_time),
                            ),
                            IconButton(
                              iconSize: 60,
                              color: Theme.of(context).cardColor,
                              onPressed: strengthChangePressed,
                              icon: const Icon(Icons.bolt_rounded),
                            ),
                            IconButton(
                              iconSize: 60,
                              color: Theme.of(context).cardColor,
                              onPressed: volumnChangePressed,
                              icon: const Icon(Icons.volume_up_outlined),
                            ),
                            IconButton(
                              iconSize: 60,
                              color: Theme.of(context).cardColor,
                              onPressed: musicChangePressed,
                              icon: const Icon(Icons.library_music_outlined),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: IconButton(
                      iconSize: 150,
                      color: Theme.of(context).cardColor,
                      onPressed: onStartPressed,
                      icon: const Icon(Icons.play_circle_outline),
                    ),
                  ),
          ),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          onTap: (int index) {
            switch (index) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ManualPage()),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyPage()),
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReviewPage()),
                );
                break;
              default:
            }
          },
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.blue[300],
          backgroundColor: Colors.black87,
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(Icons.text_snippet),
              label: '사용법 보기',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.amber[300],
              icon: const Icon(Icons.people),
              label: '사용후기',
            ),
          ],
        ),
      ),
    );
  }
}
