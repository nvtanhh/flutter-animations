import 'package:animations/constant/colors.dart';
import 'package:animations/models/page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FLutter Animations'),
      ),
      body: FutureBuilder(
          future: _getCategories(),
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                padding: EdgeInsets.all(16),
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  MyPage page = snapshot.data[index];
                  return GestureDetector(
                    onTap: () => {Navigator.pushNamed(context, page.routeName)},
                    child: Container(
                      decoration: BoxDecoration(
                        color: GREY_BG,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        page.name,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              );
            return SizedBox();
          }),
    );
  }

  Future<List<MyPage>> _getCategories() async {
    return [
      MyPage('Rounded loading button', 'ball_loading_btn'),
      MyPage('Circle Spin Loading', 'circle_spin_loading')
    ];
  }
}
