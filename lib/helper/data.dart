import 'package:flutter/cupertino.dart';
import 'package:flutter_news_app/models/categoryModel.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = <CategoryModel>[];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryName = 'Entertainment';
  categoryModel.imageUrl =
      'https://cdn.pixabay.com/photo/2015/03/26/09/58/headphones-690685_960_720.jpg';
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'General';
  categoryModel.imageUrl =
      'https://cdn.pixabay.com/photo/2021/08/19/17/08/macroperspective-6558526_960_720.jpg';
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Science';
  categoryModel.imageUrl =
      'https://cdn.pixabay.com/photo/2016/03/18/15/02/ufo-1265186_960_720.jpg';
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Exercise';
  categoryModel.imageUrl =
      'https://cdn.pixabay.com/photo/2017/01/16/15/28/boxer-1984344_960_720.jpg';
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Business';
  categoryModel.imageUrl =
      'https://cdn.pixabay.com/photo/2015/03/26/09/41/tie-690084_960_720.jpg';
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Health';
  categoryModel.imageUrl =
      'https://cdn.pixabay.com/photo/2020/03/31/14/04/covid-19-4987797_960_720.jpg';
  category.add(categoryModel);

  return category;
}
