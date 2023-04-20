import 'package:flutter/material.dart';
import 'MenuItem.dart';
import 'menu_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(
      id: 0,
      name: 'Стейк',
      ingredients: 'говядина, специи',
      image: "https://halal-spb.ru/sites/default/files/styles/large/public/bd09da8cd90c4f5f8807f24785545d00.jpg?itok=KnyHC-n8",
      price: 2600,
      preparationTime: 60,
    ),
    MenuItem(
      id: 1,
      name: 'Салат',
      ingredients: 'огурцы, помидоры, зелень',
      image: "https://s1.eda.ru/StaticContent/Photos/150224210655/150304174558/p_O.jpg",
      price: 1000,
      preparationTime: 10,
    ),
    MenuItem(
      id: 2,
      name: 'Пицца',
      ingredients: 'помидоры, сыр, соус',
      image: "https://km-doma.ru/assets/gallery_thumbnails/61/61c9e221fbaea3f706b958b294b1a9ca.jpg",
      price: 1500,
      preparationTime: 30,
    ),
  ];

  final List<MenuItem> seasonalItems = [
    MenuItem(
      id: 3,
      name: 'Картофельное пюре с грибным соусом',
      ingredients: 'картофель, грибы, сливки, чеснок',
      image: 'http://klassnie.ru/wp-content/uploads/2020/07/Mushroom-3.jpg',
      price: 800,
      preparationTime: 20,
    ),
    MenuItem(
      id: 4,
      name: 'Тыквенный суп',
      ingredients: 'тыква, лук, морковь, сливки',
      image: 'https://static.1000.menu/img/content/30273/sup-pure-iz-tykvy-klassicheskii_1545215004_1_max.jpg',
      price: 1200,
      preparationTime: 45,
    ),
    MenuItem(
      id: 5,
      name: 'Жареная курица с малиновым соусом',
      ingredients: 'курица, малина, мед, горчица',
      image: 'https://www.nyamburg.ru/wp-content/uploads/kuritsa-s-malinovym-sousom.jpg',
      price: 1600,
      preparationTime: 35,
    ),
    MenuItem(
      id: 6,
      name: 'Шоколадный торт с мятным сиропом',
      ingredients: 'шоколад, сахар, яйца, мята',
      image: 'https://vku.life/wp-content/uploads/2020/05/shokoladnyj-mussovyj-tort-s-mjatoj-1140x755.jpg',
      price: 1400,
      preparationTime: 60,
    ),
  ];

  final List<MenuItem> drinks = [
    MenuItem(
      id: 7,
      name: 'Черный чай',
      ingredients: 'чайник черного чая',
      image: 'https://e2.edimdoma.ru/data/ingredients/0000/1200/1200-ed4_wide.jpg?1515760357',
      price: 300,
      preparationTime: 1,
    ),
    MenuItem(
      id: 8,
      name: 'Вода',
      ingredients: '1L Bonaqua',
      image: 'https://arbuz.kz/image/s3/arbuz-kz-products/208216-voda_bonaqua_negazirovannaya_1_l.jpg?w=1100&h=1100&_c=1678787223',
      price: 200,
      preparationTime: 1,
    ),
    MenuItem(
      id: 9,
      name: 'Pepsi',
      ingredients: 'Pepsi',
      image: 'https://static.insales-cdn.com/images/products/1/4073/301461481/%D0%9D%D0%B0%D0%BF%D0%B8%D1%82%D0%BE%D0%BA_PEPSI_%D0%B3%D0%B0%D0%B7_0_5_%D0%BB_%D0%9A%D0%90%D0%97%D0%90%D0%A5%D0%A1%D0%A2%D0%90%D0%9D.jpg',
      price: 500,
      preparationTime: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resto App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuScreen(menuItems: menuItems, seasonalItems: seasonalItems, drinks: drinks,),
    );
  }
}
