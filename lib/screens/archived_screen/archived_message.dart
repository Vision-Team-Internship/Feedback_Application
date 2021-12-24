// ignore_for_file: prefer_const_constructors, unused_local_variable, unrelated_type_equality_checks, curly_braces_in_flow_control_structures
import 'package:feedback_application_flutter/data/archived_api/archived_message_api.dart';
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
  Future<ArchivedMessageModel>? _archivedMessageModel;
  List<Payload>? _listArchived;
  final ArchivedMessageApi _archivedMessageApi = ArchivedMessageApi();

  @override
  void initState() {
    super.initState();
    _archivedMessageModel = _archivedMessageApi.readArchived();
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
          child: FutureBuilder<ArchivedMessageModel>(
            future: _archivedMessageModel,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error ${snapshot.error}"),
                );
              }
              if (snapshot.hasData) {
                _listArchived = snapshot.data!.payload;
                return Column(
                  children: List.generate(
                    _listArchived!.length,
                    (index) => DismissibleWidget(
                      item: _listArchived?[index],
                      onDismissed: (DismissDirection direction) =>
                          dismissItem(context, index, direction),
                      child: FTile(
                        title: _listArchived![index].title.toString(),
                        floor: "floor",
                        date: "date",
                        level: "level",
                      ),
                    ),
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }

  void dismissItem(
      BuildContext context, int index, DismissDirection direction) {
    switch (direction) {
      case DismissDirection.startToEnd:
        // _archivedMessageApi.makeArchivedApi(${_listArchived?[index].id.toString()});
        break;
      case DismissDirection.endToStart:
        Get.snackbar("title1", "message1");
        break;
      default:
        break;
    }
  }
}
