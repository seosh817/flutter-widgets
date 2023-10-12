import 'package:flutter/material.dart';

import 'infinite_scroll_mixin.dart';

class InfiniteScrollScreen2 extends StatefulWidget {
  @override
  _InfiniteScrollScreenState createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen2> with InfiniteScrollMixin {
  // ScrollController _scrollController = ScrollController();
  List<int> _items = List.generate(20, (index) => index + 1);

  @override
  void initState() {
    super.initState();
    // _scrollController.addListener(loadMore);
  }

  @override
  void dispose() {
    // scrollController.removeListener(_handleScroll);
    // _scrollController.dispose();
    super.dispose();
  }

  // void _handleScroll() async {
  //   double maxScroll = _scrollController.position.maxScrollExtent;
  //   double currentScroll = _scrollController.position.pixels;
  //   if (currentScroll >= maxScroll * _scrollThreshold && _hasMoreData && !_isLoading) {
  //     _pageIndex++; // 페이지 인덱스를 증가시킵니다.
  //     await _loadMoreItems(_pageIndex);
  //   }
  // }

  Future<void> _loadMoreItems(int pageIndex) async {

    setState(() {
      fetchDataLoading = true;
    });

    List<int> pageItems = List.generate(20, (index) => ((pageIndex - 1) * 20) + index + 1);

    _items.addAll(pageItems);

    // 예: 서버에서 pageIndex에 해당하는 데이터를 가져오기 위한 비동기 작업
    // var newData = await fetchDataForPage(pageIndex);

    if (pageItems.isEmpty) {
      setState(() {
        fetchDataLoading = false;
      });
    } else {
      setState(() {
        fetchDataLoading = false;
      });
    }
  }

  void refresh() async {
    pageIndex = 1;
    await _loadMoreItems(pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite scroll screen'),
      ),
      body: ListView.builder(
        controller: scrollController,
        itemCount: _items.length,
        itemBuilder: (context, index) {
          if (index < _items.length) {
            return ListTile(
              title: Text('Item ${_items[index]}'),
            );
          } else {
            return Center(
              child: fetchDataLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: () => _loadMoreItems(pageIndex),
                child: Text('Load more'),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  Future<void> loadMore(int pageIndex) async {
    // double maxScroll = scrollController.position.maxScrollExtent;
    // double currentScroll = scrollController.position.pixels;
    // if (currentScroll >= maxScroll * _scrollThreshold && _hasMoreData && !_isLoading) {
    //   _pageIndex++; // 페이지 인덱스를 증가시킵니다.
    // }
    await _loadMoreItems(pageIndex);
  }
}
