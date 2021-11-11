// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:feedback_application_flutter/constants/theme_constant.dart';
// import 'package:feedback_application_flutter/data/data.dart';
// import 'package:feedback_application_flutter/model/message_model.dart';
// import 'package:feedback_application_flutter/model/slidable_action.dart';
// import 'package:feedback_application_flutter/screens/message/widgets/f_tile.dart';
// import 'package:feedback_application_flutter/screens/message_detail/message_detail_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:get/get.dart';

// class ApproveHistoryScreen extends StatefulWidget {
//   const ApproveHistoryScreen({Key? key}) : super(key: key);

//   @override
//   _ApproveHistoryScreenState createState() => _ApproveHistoryScreenState();
// }

// class _ApproveHistoryScreenState extends State<ApproveHistoryScreen>
//     with SingleTickerProviderStateMixin {
//   TabController? _tabController;
//   @override
//   void initState() {
//     _tabController = TabController(length: 2, vsync: this);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _tabController!.dispose();
//     super.dispose();
//   }

//   List<MessageModel> items = List.of(allData);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//         leading: IconButton(
//           onPressed: () {
//             Get.back();
//           },
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//             size: 24,
//           ),
//         ),
//         title: Text(
//           "Messge History",
//           style: const TextStyle(
//             fontFamily: "Poppins",
//             color: Color(0xff000000),
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 23),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               height: 45,
//               decoration: BoxDecoration(
//                 color: Colors.grey[300],
//                 // borderRadius: BorderRadius.circular(
//                 //   25.0,
//                 // ),
//               ),
//               child: TabBar(
//                 controller: _tabController,
//                 // give the indicator a decoration (color and border radius)
//                 indicator: BoxDecoration(
//                   color: ThemeConstant.lightScheme.primary,
//                 ),
//                 physics: BouncingScrollPhysics(),
//                 labelColor: Colors.white,
//                 unselectedLabelColor: Colors.black,
//                 labelStyle: ThemeConstant.textTheme.subtitle1!
//                     .copyWith(color: Colors.white),
//                 tabs: [
//                   // first tab [you can add an icon using the icon property]
//                   Tab(
//                     text: 'Done',
//                   ),

//                   // second tab [you can add an icon using the icon property]
//                   Tab(
//                     text: 'Reject',
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: TabBarView(
//                 controller: _tabController,
//                 children: [
//                   // first tab bar view widget

//                   Container(
//                     margin: EdgeInsets.only(top: 20),
//                     width: MediaQuery.of(context).size.width,
//                     child: ListView.builder(
//                       itemCount: items.length,
//                       itemBuilder: (context, index) {
//                         final item = items[index];
//                         return Slidable(
//                           key: Key(item.title),
//                           actionPane: SlidableDrawerActionPane(),
                
//                           secondaryActions: <Widget>[
//                             IconSlideAction(
//                               caption: 'More',
//                               color: Colors.black45,
//                               icon: Icons.more_horiz,
//                               onTap: () =>
//                                   isDississed(index, SlidableAction.more),
//                             ),
//                             IconSlideAction(
//                               caption: 'Delete',
//                               color: Colors.red,
//                               icon: CupertinoIcons.multiply_circle,
//                               onTap: () =>
//                                   isDississed(index, SlidableAction.delete),
//                             ),
//                           ],
//                           child: FTile(
//                             onTap: () {
//                               Get.to(MessageDetailScreen());
//                             },
//                             title: items[index].title,
//                             floor: items[index].Department,
//                             level: items[index].level,
//                             date: items[index].Date,
//                             levelColor:
//                                 items[index].level.toUpperCase() == "HIGH"
//                                     ? Colors.red
//                                     : items[index].level.toUpperCase() ==
//                                             "Medium".toUpperCase()
//                                         ? Color(0xffDEDE22)
//                                         : Color(0xff00C700),
//                           ),
//                         );
//                       },
//                     ),
//                   ),

//                   // second tab bar view widget
//                   Container(
//                     margin: EdgeInsets.only(top: 20),
//                     width: MediaQuery.of(context).size.width,
//                     child: ListView.builder(
//                       itemCount: items.length,
//                       itemBuilder: (context, index) {
//                         final item = items[index];
//                         return Slidable(
//                           key: Key(item.title),
//                           actionPane: SlidableDrawerActionPane(),
                
//                           secondaryActions: <Widget>[
//                             IconSlideAction(
//                               caption: 'More',
//                               color: Colors.black45,
//                               icon: Icons.more_horiz,
//                               onTap: () =>
//                                   isDississed(index, SlidableAction.more),
//                             ),
//                             IconSlideAction(
//                               caption: 'Delete',
//                               color: Colors.red,
//                               icon: CupertinoIcons.multiply_circle,
//                               onTap: () =>
//                                   isDississed(index, SlidableAction.delete),
//                             ),
//                           ],
//                           child: FTile(
//                             onTap: () {
//                               Get.to(MessageDetailScreen());
//                             },
//                             title: items[index].title,
//                             floor: items[index].Department,
//                             level: items[index].level,
//                             date: items[index].Date,
//                             levelColor:
//                                 items[index].level.toUpperCase() == "HIGH"
//                                     ? Colors.red
//                                     : items[index].level.toUpperCase() ==
//                                             "Medium".toUpperCase()
//                                         ? Color(0xffDEDE22)
//                                         : Color(0xff00C700),
//                           ),
//                         );
//                       },
//                     ),
//                   ),

//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void isDississed(int index, SlidableAction action) {
//     final item = items[index];
//     setState(() => items.removeAt(index));

//     switch (action) {
//       case SlidableAction.more:
//         Get.snackbar(
//           "Processing",
//           "Hello everyone",
//           icon: Icon(Icons.person, color: Colors.white),
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.green,
//           borderRadius: 20,
//           margin: EdgeInsets.all(15),
//           colorText: Colors.white,
//           duration: Duration(seconds: 4),
//           isDismissible: true,
//           dismissDirection: SnackDismissDirection.HORIZONTAL,
//           forwardAnimationCurve: Curves.easeOutBack,
//         );
//         break;
//       case SlidableAction.delete:
//         Get.snackbar(
//           "Deleted",
//           "${item.title} has been deleted",
//           icon: Icon(Icons.person, color: Colors.white),
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Color(0xff2F2F2F),
//           borderRadius: 20,
//           margin: EdgeInsets.all(15),
//           colorText: Colors.white,
//           duration: Duration(seconds: 4),
//           isDismissible: true,
//           dismissDirection: SnackDismissDirection.HORIZONTAL,
//           forwardAnimationCurve: Curves.easeOutBack,
//         );
//         break;

//       default:
//     }
//   }


// }
