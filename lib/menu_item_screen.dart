import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'MenuItem.dart';

class MenuItemScreen extends StatefulWidget {
  final MenuItem menuItem;

  const MenuItemScreen({required this.menuItem});

  @override
  _MenuItemScreenState createState() => _MenuItemScreenState();
}

class _MenuItemScreenState extends State<MenuItemScreen> {
  final TextEditingController _commentController = TextEditingController();
  List<String> _comments = [];
  String? _lastComment;
  late String _menuItemKey;

  @override
  void initState() {
    super.initState();
    _menuItemKey = 'comments_${widget.menuItem.id}';
    _loadComments();
  }

  void _loadComments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _comments = prefs.getStringList(_menuItemKey) ?? [];
      _lastComment = prefs.getString('lastComment');
    });
  }

  Future<void> _saveComments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_menuItemKey, _comments);
    if (_lastComment != null) {
      await prefs.setString('lastComment', _lastComment!);
    }
  }

  void _addComment() {
    final comment = _commentController.text;
    setState(() {
      _comments.add(comment);
      _commentController.clear();
    });
    _saveComments();
    Navigator.pop(context, comment);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.menuItem.name),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(widget.menuItem.image),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.menuItem.name,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Ингредиенты: ${widget.menuItem.ingredients.splitMapJoin(", ")}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Время приготовления: ${widget.menuItem.preparationTime} минут',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Цена за порцию: ₸${widget.menuItem.price} \₸',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Комментарии:',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                for (var comment in _comments)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      comment,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                if (_lastComment != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _commentController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Оставьте комментарий',
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: _addComment,
                    child: const Text('Оставить комментарий'),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}