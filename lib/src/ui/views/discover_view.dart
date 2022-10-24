import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  final lexendMedium = const TextStyle(
    fontFamily: 'Lexend',
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      /* Header with Tengoku Logo */
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.15),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: width * 0.05,
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
      /* Body: Banner BG Image, Basic Info & Cover Image for Featured Content */
      body: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: height * 0.475,
            child: Stack(
              fit: StackFit.loose,
              children: <Widget>[
                /* Banner BG Image */
                Container(
                  width: double.infinity,
                  height: height * 0.425,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage(
                        'assets/images/featured/spy-x-family-part-2-banner.jpg',
                      ),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                ),
                /* Container - Push content away from edges (pad out) */
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.025),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      /* Left: Cover Image */
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: SizedBox(
                            width: 160,
                            height: 226,
                            child: Image.asset(
                              'assets/images/featured/spy-x-family-part-2-cover.jpg',
                            ),
                          ),
                        ),
                      ),
                      /* Right: Basic Info */
                      Align(
                        alignment: Alignment.center,
                        child: FittedBox(
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
                                      child: Text(
                                        '8.6/10',
                                        style: lexendMedium,
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
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.025,
            ),
            width: double.infinity,
            height: height * 0.225,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Trending Right Now',
                  style: lexendMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
