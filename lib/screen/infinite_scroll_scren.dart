import 'package:flutter/material.dart';

class InfiniteScrollScreen extends StatefulWidget {
  @override
  _InfiniteScrollScreenState createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  ScrollController _scrollController = ScrollController();
  List<int> _items = List.generate(20, (index) => index + 1);

  double _scrollThreshold = 0.2;
  bool _isLoading = false;
  int _pageIndex = 1; // 현재 페이지 인덱스
  bool _hasMoreData = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() async {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    if (currentScroll >= maxScroll * _scrollThreshold && _hasMoreData && !_isLoading) {
      _pageIndex++; // 페이지 인덱스를 증가시킵니다.
      await _loadMoreItems(_pageIndex);
    }
  }

  Future<void> _loadMoreItems(int pageIndex) async {

    setState(() {
      _isLoading = true;
    });

    List<int> pageItems = List.generate(20, (index) => ((pageIndex - 1) * 20) + index + 1);

    _items.addAll(pageItems);

    // 예: 서버에서 pageIndex에 해당하는 데이터를 가져오기 위한 비동기 작업
    // var newData = await fetchDataForPage(pageIndex);

    if (pageItems.isEmpty) {
      setState(() {
        _hasMoreData = false;
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite Scroll Example'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _items.length + (_hasMoreData ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < _items.length) {
            return ListTile(
              title: Text('Item ${_items[index]}'),
            );
          } else if (_hasMoreData) {
            return Center(
              child: _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: () => _loadMoreItems(_pageIndex),
                child: Text('더 보기'),
              ),
            );
          } else {
            return Center(
              child: Text('더 이상 데이터가 없습니다.'),
            );
          }
        },
      ),
    );
  }
}
