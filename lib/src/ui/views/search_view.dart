import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:tengoku/src/utils/debouncer.dart';
import 'package:tengoku/src/providers/consumet_provider.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late Debouncer searchDebouncer;
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.2),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.1,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Icon(EvaIcons.search),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                ),
              ),
              Flexible(
                child: TextField(
                  decoration: const InputDecoration.collapsed(
                    hintText: 'Search',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onChanged: (query) => _updateSearchResults(
                    query,
                    null,
                    null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateSearchResults(String query, int? page, int? resultsPerPage) {
    _debouncer.run(
      () async => await Provider.of<ConsumetProvider>(
        context,
        listen: false,
      ).basicAnimeSearch(
        query,
        page,
        resultsPerPage,
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
