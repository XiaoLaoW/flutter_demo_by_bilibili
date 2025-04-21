import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key, this.keyword}) : super(key: key);
  String? keyword = "";

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.keyword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _searchBar(),
          ],
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.teal,
      child: Row(
        children: [
          SizedBox(width: 10),
          Image.asset(
            "assets/images/search.png",
            height: 20,
            width: 20,
          ),
          Expanded(
            child: TextField(
                controller: _searchController,
                style: TextStyle(color: Colors.white, fontSize: 16),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),

                    ),
                    hintText: "搜索",
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white, fontSize: 16))),
          ),
          Text('取消', style: TextStyle(color: Colors.white, fontSize: 16)),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
