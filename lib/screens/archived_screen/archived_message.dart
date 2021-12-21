// ignore_for_file: prefer_const_constructors, unused_local_variable
import 'package:feedback_application_flutter/data/archived_api/archived_message_api.dart';
import 'package:feedback_application_flutter/data/archived_api/data_api.dart';
import 'package:feedback_application_flutter/model/archived_message_model.dart';
import 'package:feedback_application_flutter/screens/message/widgets/dismissible_widget.dart';
import 'package:feedback_application_flutter/screens/message/widgets/f_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchivedMessage extends StatefulWidget {
  const ArchivedMessage({Key? key}) : super(key: key);

  @override
  _ArchivedMessageState createState() => _ArchivedMessageState();
}

class _ArchivedMessageState extends State<ArchivedMessage> {
  List<ArchivedMessaeModel?> items = List.of(Data.datas);
  Future<ArchivedModel>? _archivedModel;
  ArchivedMessageApi _archivedMessageApi = ArchivedMessageApi();

  @override
  void initState() {
    _archivedModel = _archivedMessageApi.readArchived();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 24,
          ),
        ),
        title: Text(
          "Archived Message",
          style: const TextStyle(
            fontFamily: "Poppins",
            color: Color(0xff000000),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: FutureBuilder<ArchivedModel>(
              future: _archivedModel,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error ${snapshot.error}"),
                  );
                }
                if (snapshot.hasData) {
                  var archivedMessage = snapshot.data!.payload;

                  print(archivedMessage!.length);
                  return Column(
                    children: List.generate(
                      archivedMessage.length,
                      (index) => DismissibleWidget(
                        item: archivedMessage[index],
                        onDismissed: (DismissDirection direction)async {
                          print(direction);
                        },
                        child: FTile(
                          title: archivedMessage[index].title.toString(),
                          floor: "floor",
                          date: "date",
                          level: "level",
                        ),
                      ),
                    ),
                  );
                }
                return CircularProgressIndicator();
                // return ListView.separated(
                //   shrinkWrap: true,
                //   separatorBuilder: (context, index) => Divider(),
                //   itemCount: items.length,
                //   itemBuilder: (context, index) {
                //     final item = items[index];
                //     return DismissibleWidget(
                //       item: item,
                //       onDismissed: (DismissDirection direction) =>
                //           dismissItem(context, index, direction),
                //       child: buildListTile(item!),
                //     );
                //   },
                // );
              }),
        ),
      ),
    );
  }

  void dismissItem(
      BuildContext context, int index, DismissDirection direction) {
    setState(() async {
      print("object");
    });
    switch (direction) {
      case DismissDirection.startToEnd:
        Get.snackbar("title", "message");
        break;
      case DismissDirection.endToStart:
        Get.snackbar("title1", "message1");
        break;
      default:
        break;
    }
  }
}

Widget buildListTile(ArchivedMessaeModel item) {
  return ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    leading: CircleAvatar(),
    title: Text(
      item.firstname.toString(),
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  );
}
