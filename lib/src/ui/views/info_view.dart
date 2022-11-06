import 'package:flutter/material.dart';
import 'package:tengoku/src/models/anime_result.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class InfoView extends StatefulWidget {
  final AnimeResult initialData;

  const InfoView({
    super.key,
    required this.initialData,
  });

  @override
  State<InfoView> createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      /* Header with Back Arrow */
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.15),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.05,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(EvaIcons.arrowBack),
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: height * 0.405,
            child: Stack(
              fit: StackFit.loose,
              children: <Widget>[
                /* Banner BG Image */
                _renderBackgroundImage(height),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    /* Center: Cover Image */
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Container(
                          constraints: const BoxConstraints(
                            maxWidth: 150,
                            maxHeight: 212,
                          ),
                          child: Image.network(
                            widget.initialData.coverImage!,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          /* Padding, Text for Titles (Romaji | Native) */
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: height * 0.01,
              horizontal: width * 0.025,
            ),
            child: Column(
              children: <Text>[
                Text(
                  widget.initialData.title.romaji ??
                      widget.initialData.title.userPreferred!,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                  ),
                ),
                Text(
                  widget.initialData.title.native ??
                      widget.initialData.title.userPreferred!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Zen Maru Gothic',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: colors.onSurface,
                  ),
                ),
              ],
            ),
          ),

          /* Play Button */
          BouncingWidget(
            scaleFactor: 0.5,
            duration: const Duration(milliseconds: 200),
            onPressed: () => {},
            child: Container(
              width: width * 0.2,
              height: height * 0.045,
              margin: EdgeInsets.symmetric(vertical: height * 0.015),
              padding: EdgeInsets.only(
                left: width * 0.02,
                right: width * 0.03,
              ),
              decoration: BoxDecoration(
                color: colors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  Icon(EvaIcons.arrowRight),
                  Text(
                    'Play',
                    style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderBackgroundImage(double height) {
    String banner;
    String? image = widget.initialData.bannerImage;

    // Should theoretically always have cover image, so use as fallback for now.
    image != null ? banner = image : banner = widget.initialData.coverImage!;

    return Container(
      width: double.infinity,
      height: height * 0.355,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(banner),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.2),
            BlendMode.darken,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
