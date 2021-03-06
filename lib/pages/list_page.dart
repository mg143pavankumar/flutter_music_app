import 'package:flutter/material.dart';
import 'package:flutter_music_app/core/const.dart';
import 'package:flutter_music_app/models/music_model.dart';
import 'package:flutter_music_app/widgets/custom_button_widget.dart';

import '../core/const.dart';
import 'detail_page.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<MusicModel> _list;
  int _playId;

  @override
  void initState() {
    _playId = 0;
    _list = MusicModel.list;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        title: Text(
          "Skin - Flume",
          style: TextStyle(
            color: AppColors.lightBlue,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.mainColor,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButtonWidget(
                      size: 50,
                      icon: Icon(
                        Icons.favorite,
                        color: AppColors.styleColor,
                      ),
                    ),
                    CustomButtonWidget(
                      image: "assets/logo.jpg",
                      size: 150,
                      borderWidth: 5,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => DetailPage(),
                          ),
                        );
                      },
                    ),
                    CustomButtonWidget(
                      size: 50,
                      icon: Icon(
                        Icons.menu,
                        color: AppColors.styleColor,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  physics: BouncingScrollPhysics(),
                  itemCount: _list.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => DetailPage(),
                          ),
                        );
                      },
                      child: AnimatedContainer(
                        duration: Duration(
                          milliseconds: 500,
                        ),
                        decoration: BoxDecoration(
                          color: _list[index].id == _playId
                              ? AppColors.activeColor
                              : AppColors.mainColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _list[index].title,
                                  style: TextStyle(
                                    color: AppColors.styleColor,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  _list[index].album,
                                  style: TextStyle(
                                    color:
                                        AppColors.styleColor.withOpacity(0.7),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            CustomButtonWidget(
                              size: 50,
                              icon: Icon(
                                _list[index].id == _playId
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                color: _list[index].id == _playId
                                    ? Colors.white
                                    : AppColors.styleColor,
                              ),
                              isActive: _list[index].id == _playId,
                              onTap: () {
                                setState(() {
                                  _playId = _list[index].id;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.mainColor.withOpacity(0.12),
                    AppColors.mainColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
