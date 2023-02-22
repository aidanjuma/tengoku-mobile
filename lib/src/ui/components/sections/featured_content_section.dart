import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class FeaturedContentSection extends StatelessWidget {
  final int rating;
  final String mediaName;
  final String coverImagePath;
  final String bannerImagePath;

  const FeaturedContentSection({
    super.key,
    required this.rating,
    required this.mediaName,
    required this.coverImagePath,
    required this.bannerImagePath,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
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
                image: AssetImage(bannerImagePath),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          /* Aligned Container: Snap to Bottom of SizedBox */
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 226,
              padding: EdgeInsets.symmetric(horizontal: width * 0.025),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  /* Left: Cover Image */
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: 160,
                      height: 226,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(coverImagePath),
                        ),
                      ),
                    ),
                  ),
                  /* Right: Basic Info */
                  Align(
                    alignment: Alignment.topRight,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            mediaName,
                            style: const TextStyle(
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
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
                                    rating.toString(),
                                    style: const TextStyle(
                                      fontFamily: 'Lexend',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.white,
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
            ),
          ),
          /* Header with Tengoku Logo */
          Positioned(
            top: height * 0.05,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.025,
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
          )
        ],
      ),
    );
  }
}
