import 'package:flutter/material.dart';
import 'package:flutter_api_practice/controllers/user_screen_controller.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserScreenController()..fetchUser(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Usersページ'),
          ),
          body: Container(
            child: Consumer<UserScreenController>(
              builder: (context, model, child) {
                return ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(model.users[index].name),
                      subtitle: Text(model.users[index].email),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                  itemCount: model.users.length,
                );
              },
            ),
          ),
          floatingActionButton: Consumer<UserScreenController>(
            builder: (_, model, __) {
              return FloatingActionButton(
                child: Icon(Icons.get_app),
                onPressed: () {
                  model.fetchUser();
                },
              );
            },
          ),
        );
      },
    );
  }
}
