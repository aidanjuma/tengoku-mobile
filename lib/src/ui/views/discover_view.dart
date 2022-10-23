import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.15),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: width * 0.075,
            vertical: height * 0.05,
          ),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Image(
              width: 96,
              height: 64,
              image: AssetImage('assets/images/tengoku-logo.png'),
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: height * 0.4,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const NetworkImage(
                        'https://s4.anilist.co/file/anilistcdn/media/anime/banner/142838-tynuN00wxmKO.jpg',
                      ),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: width * 0.1,
                    vertical: height * 0.1,
                  ),
                  child: FittedBox(
                    alignment: Alignment.bottomRight,
                    fit: BoxFit.scaleDown,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        const Text(
                          'SPY×FAMILY Part 2',
                          style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              const Icon(
                                EvaIcons.star,
                                size: 18,
                                color: Color(0xfff7d16f),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 5),
                                child: const Text(
                                  '8.6/10',
                                  style: TextStyle(
                                    fontFamily: 'Lexend',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
