import 'dart:convert';

import 'package:clone_carrot_market/pages/splash_wrapper.dart';
import 'package:clone_carrot_market/widget/boardItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    title: 'CarrotMarketClone',
    theme: ThemeData(primaryColor: Color(0xff16171B)),
    home: SplashWrapper(),
  ));
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}


Widget buildLoadingIndicator() {
  return Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
    ),
  );
}



class _HomePageState extends State<HomePage> {
  List<dynamic> items = [];

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  Future<void> loadItems() async {
    await Future.delayed(const Duration(seconds: 5));
    final String response =
        await rootBundle.loadString('assets/board_items.json');
    final List<dynamic> data = jsonDecode(response);
    setState(() {
      items = data;
    });
  }

  //Tags 생성
  Widget _buildCategoryButton(IconData icon, String label) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Color(0xffEBECF0), size: 18),
      label: Text(label, style: TextStyle(color: Color(0xffEBECF0))),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.transparent),
        backgroundColor: Color(0xff2A2B2F),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff16171B),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // 글쓰기 기능 실행
        },
        backgroundColor: Color(0xFFFF6F00), // 오렌지 컬러
        label: Text(
          '글쓰기',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        icon: Icon(Icons.edit),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        backgroundColor: Color(0xff16171B),
        title: Row(
          children: [
            Text(
              '운암동',
              style: TextStyle(
                  color: Color(0xffEBECF0), fontWeight: FontWeight.w700),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xffEBECF0),
              ),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  size: 30,
                  Icons.menu,
                  color: Color(0xffEBECF0),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  size: 30,
                  Icons.search,
                  color: Color(0xffEBECF0),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Stack(
                  children: [
                    Icon(
                      size: 30,
                      Icons.notifications_none,
                      color: Color(0xffEBECF0),
                    ),
                    Positioned(
                      right: 0,
                      top: 2,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      body: items.length == 0 ? buildLoadingIndicator() 
      :
      ListView.separated(
        itemCount: items.length + 1,
        separatorBuilder: (context, index) => SizedBox(height: 8),
        itemBuilder: (context, index) {
          if (index == 0) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  _buildCategoryButton(Icons.search, '알바'),
                  SizedBox(width: 8),
                  _buildCategoryButton(Icons.home_outlined, '부동산'),
                  SizedBox(width: 8),
                  _buildCategoryButton(Icons.directions_car, '중고차'),
                  SizedBox(width: 8),
                  _buildCategoryButton(Icons.chair, '가구'),
                  SizedBox(width: 8),
                  _buildCategoryButton(Icons.pets, '반려동물'),
                ],
              ),
            );
          }

          //실제 아이템은 index -1 사용
          final item = items[index -1];
          return buildItem(
            no : index,
            imageUrl: item['imageUrl'],
            title: item['title'],
            location: item['location'],
            price: item['price'],
            likes: item['likes'],
            comments: item['comments'],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xff22252C),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Column(
              children: [
                Icon(
                  size: 35,
                  Icons.home,
                  color: Color(0xff878B94),
                ),
                Text(
                  '홈',
                  style: TextStyle(
                    color: Color(0xff878B94),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Icon(
                  size: 35,
                  Icons.newspaper,
                  color: Color(0xff878B94),
                ),
                Text(
                  '동네생활',
                  style: TextStyle(
                    color: Color(0xff878B94),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Icon(
                  size: 35,
                  Icons.pin_drop_outlined,
                  color: Color(0xff878B94),
                ),
                Text(
                  '동네지도',
                  style: TextStyle(
                    color: Color(0xff878B94),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Icon(
                  size: 35,
                  Icons.chat,
                  color: Color(0xff878B94),
                ),
                Text(
                  '채팅',
                  style: TextStyle(
                    color: Color(0xff878B94),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Icon(
                  size: 35,
                  Icons.person,
                  color: Color(0xff878B94),
                ),
                Text(
                  '나의 당근',
                  style: TextStyle(
                    color: Color(0xff878B94),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
