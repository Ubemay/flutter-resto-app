import 'package:flutter/material.dart';
import 'MenuItem.dart';
import 'menu_item_screen.dart';
import 'music_player.dart';

class MenuScreen extends StatefulWidget {
  final List<MenuItem> menuItems;
  final List<MenuItem> seasonalItems;
  final List<MenuItem> drinks;

  const MenuScreen({
    required this.menuItems,
    required this.seasonalItems,
    required this.drinks,
  });

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final Map<MenuItem, String> _lastComments = {};

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Меню'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Блюда'),
              Tab(text: 'Новое сезона'),
              Tab(text: 'Напитки',)
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(
                MusicPlayer.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
              onPressed: () {
                setState(() {
                  MusicPlayer.toggle();
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      MusicPlayer.isPlaying
                          ? 'Музыка включена'
                          : 'Музыка выключена',
                    ),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
          ],
        ),
        body: TabBarView(
          children: [
            _buildMenuList(widget.menuItems),
            _buildMenuList(widget.seasonalItems),
            _buildMenuList(widget.drinks),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuList(List<MenuItem> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          leading: Image.network(
            item.image,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
          title: Text(item.name),
          subtitle: Text('\₸${item.price.toStringAsFixed(2)}'),
          onTap: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MenuItemScreen(menuItem: item),
              ),
            );
            if (result != null && result is String) {
              setState(() {
                _lastComments[item] = result;
              });
            }
          },
          trailing: _lastComments.containsKey(item)
              ? Text('последний комментарий: ${_lastComments[item]}')
              : Text('последний комментарий: '),
        );
      },
    );
  }
}

