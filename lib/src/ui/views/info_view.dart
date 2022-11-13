import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:tengoku/src/models/anime_result.dart';
import 'package:tengoku/src/providers/consumet_provider.dart';
import 'package:tengoku/src/ui/components/panels/cards/relation_card.dart';
import 'package:tengoku/src/ui/components/sliders/content_slider.dart';

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
    final colors = Theme.of(context).colorScheme;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      /* Header with Back Arrow */
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.15),
        child: Container(
          width: double.infinity,
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
        crossAxisAlignment: CrossAxisAlignment.center,
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
                      child: Container(
                        width: 150,
                        height: 212,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              widget.initialData.coverImage!,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          /* Padding, Text for Titles (Romaji | Native) & Play Button */
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: height * 0.005,
              horizontal: width * 0.025,
            ),
            /* Title(s) & Play Button Column */
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                /* Title(s) */
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
                /* Play Button */
                BouncingWidget(
                  scaleFactor: 0.5,
                  duration: const Duration(milliseconds: 200),
                  onPressed: () => {},
                  child: Container(
                    width: width * 0.2,
                    height: height * 0.045,
                    margin: EdgeInsets.only(top: height * 0.01),
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
          ),
          /* Relations */
          Consumer<ConsumetProvider>(
            builder: ((context, provider, child) {
              if (provider.isLoading == false &&
                  provider.currentAnimeInfo != null) {
                List<AnimeResult>? relations =
                    provider.currentAnimeInfo!.relations!;

                if (relations.isNotEmpty) {
                  List<RelationCard> cards = [];
                  // Relations present; map each relation to a RelationCard.
                  for (int i = 0; i < relations.length; i++) {
                    final relation = relations[i];
                    cards.add(
                      RelationCard(
                        relation: relation,
                        spacing: i < relations.length
                            ? const EdgeInsets.only(right: 12)
                            : const EdgeInsets.only(left: 12),
                      ),
                    );
                  }

                  return Container(
                    width: double.infinity,
                    height: height * 0.16,
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.005,
                      horizontal: width * 0.035,
                    ),
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: height * 0.01),
                          child: Text(
                            'Relations',
                            style: TextStyle(
                              fontFamily: 'Lexend',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: colors.onSurface,
                            ),
                          ),
                        ),
                        ContentSlider(
                          direction: Axis.horizontal,
                          panels: cards,
                        ),
                      ],
                    ),
                  );
                }
              }
              return const SizedBox.shrink();
            }),
          )
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // TODO: Implement multi-provider.
      Provider.of<ConsumetProvider>(context, listen: false)
          .getAnimeInfoWithEpisodes(widget.initialData.id, null);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
