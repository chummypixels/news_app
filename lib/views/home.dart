import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/helper/data.dart';
import 'package:flutter_news_app/helper/news.dart';
import 'package:flutter_news_app/models/categoryModel.dart';
import 'package:flutter_news_app/models/ArticleModel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Flutter'),
              Text(
                'News',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
          elevation: 0.0,
        ),
        body: _loading
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      //Categories
                      Container(
                        height: 70,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return CategoryTile(
                                imageUrl: categories[index].imageUrl,
                                categoryName: categories[index].categoryName,
                              );
                            }),
                      ),
                      //Blogs
                      Container(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: articles.length,
                            itemBuilder: (context, index) {
                              return BlogTile(
                                  imageUrl: articles[index].urlToImage!,
                                  title: articles[index].title!,
                                  description: articles[index].description!);
                            }),
                      )
                    ],
                  ),
                ),
              ));
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                imageUrl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
              child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, description;
  BlogTile(
      {required this.imageUrl, required this.title, required this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [Image.network(imageUrl), Text(title), Text(description)],
      ),
    );
  }
}
