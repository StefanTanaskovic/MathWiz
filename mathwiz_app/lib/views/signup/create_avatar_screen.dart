import 'package:flutter/material.dart';
import 'package:mathwiz_app/constants.dart';
import 'package:mathwiz_app/controllers/avatar_notifier.dart';
import 'package:mathwiz_app/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class CreateAvatarScreen extends StatefulWidget {
  @override
  _CreateAvatarScreenState createState() => _CreateAvatarScreenState();
}

class _CreateAvatarScreenState extends State<CreateAvatarScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AvatarNotifier avatarNotifier =
        Provider.of<AvatarNotifier>(context, listen: false);
    avatarNotifier.getItems(context);

    Size size = MediaQuery.of(context).size;

    if (context.watch<AvatarNotifier>().masterItemsModel == null) {
      return Scaffold(
        body: LoadingIndicator(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Create Avatar'),
          backgroundColor: kPrimaryColor,
        ),
        body: SafeArea(
            child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Expanded(
                // Top Avatar Area
                child: Image.network(
                  context.watch<AvatarNotifier>().avatarURL,
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text("Finsih"))
                  ],
                ),
              ),
            ],
          ),
        )),
      );
    }
  }
}
