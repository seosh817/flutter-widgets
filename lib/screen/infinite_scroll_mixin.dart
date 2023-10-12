import 'package:flutter/material.dart';

abstract class LoadEvent {
  Future<void> loadMore(int pageIndex);
}

mixin InfiniteScrollMixin<T extends StatefulWidget> on State<T> implements LoadEvent {

  ScrollController scrollController = ScrollController();

  double _scrollThreshold = 0.2;

  int pageIndex = 1;
  bool fetchDataLoading = false;
  bool hasMoreData = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    scrollController.removeListener(_handleScroll);
    scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() async {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;
    if (currentScroll >= maxScroll * _scrollThreshold && hasMoreData && !fetchDataLoading) {
      pageIndex++;
      await loadMore(pageIndex);
    }
  }

  void refresh() async {
    pageIndex = 1;
    await loadMore(pageIndex);
  }
}
