import 'package:flutter/material.dart';
import 'package:lyfeonwheels/widgets/ListViewTile.dart';
import 'package:lyfeonwheels/constants.dart';
import 'package:provider/provider.dart';

class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRequest();
  }

  Future<bool> getRequest() async {
    List<ListViewTile> list = [];
    list = await auth.getRequests();
    Provider.of<Data>(context, listen: false).updateRequests(list);
    if (list.isEmpty) {
      return Future.value(false);
    } else
      return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getRequest(),
      builder: (context, snapshot) {
        if (snapshot.data == true) {
          return ListView.builder(
              itemBuilder: (context, index) {
                return Provider.of<Data>(context).requests[index];
              },
              itemCount: Provider.of<Data>(context).requests.length);
        } else if (snapshot.data == false) {
          return Center(
            child: Text('Nothing to show here'),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
