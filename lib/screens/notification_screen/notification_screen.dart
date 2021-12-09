// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:feedback_application_flutter/constants/theme_constant.dart';
import 'package:feedback_application_flutter/data/notification/notification_api.dart';
import 'package:feedback_application_flutter/model/notification_model.dart';
import 'package:feedback_application_flutter/screens/message_detail/message_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({
    Key? key,
  }) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  Future<NotificationModel>? notificationmodel;
  List<Payload>? _listNotification;

  NotificationApi _notificationApi = NotificationApi();

  @override
  initState() {
    notificationmodel = _notificationApi.readDataFromNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Notification",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontFamily: "Poppins",
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: FutureBuilder<NotificationModel>(
              future: notificationmodel,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }

                if (snapshot.hasData) {
                  _listNotification = snapshot.data!.payload;
                  return Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .06,
                      ),
                      ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: _listNotification?.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Material(
                                color:
                                    _listNotification![index].isClick == false
                                        ? Color(0xffEEEEEE)
                                        : null,
                                child: InkWell(
                                  onTap: () {
                                    print(_listNotification![index]
                                        .isClick
                                        .toString());
                                    Get.to(
                                      () => MessageDetailScreen(
                                        title:
                                            "${_listNotification?[index].feedbackId?.title}",
                                        date:
                                            "${_listNotification?[index].notificationDate!.day}/${_listNotification?[index].notificationDate!.month}/${_listNotification?[index].notificationDate!.year}",
                                        level:
                                            "${_listNotification?[index].feedbackId?.feedbackLevel}",
                                        id: "${_listNotification?[index].feedbackId?.id}",
                                        managerContact: [],
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${_listNotification?[index].feedbackId?.title}",
                                              style: ThemeConstant
                                                  .textTheme.headline6!
                                                  .copyWith(
                                                color: Colors.black,
                                              ),
                                            ),
                                            _listNotification![index].isClick ==
                                                    false
                                                ? CircleAvatar(
                                                    radius: 5,
                                                    backgroundColor:
                                                        ThemeConstant
                                                            .lightScheme
                                                            .primary,
                                                  )
                                                : SizedBox(),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .75,
                                            child: Text(
                                              "${_listNotification?[index].feedbackId?.message}",
                                              style: ThemeConstant
                                                  .textTheme.subtitle2!
                                                  .copyWith(
                                                color: ThemeConstant
                                                    .lightScheme.secondary,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                            "${_listNotification?[index].notificationDate}",
                                            style: ThemeConstant
                                                .textTheme.caption!
                                                .copyWith(
                                              color: ThemeConstant
                                                  .lightScheme.secondary,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02,
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  );
                }
                return Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 180,
                    height: 180,
                    child: Lottie.asset("assets/loadings/waiting.json"),
                  ),
                );
                // return Column(
                //   children: [
                //     SizedBox(
                //       height: MediaQuery.of(context).size.height * .06,
                //     ),
                //     InkWell(
                //       onTap: () {
                //         print("Notification");
                //       },
                //       child: Container(
                //         padding: EdgeInsets.symmetric(horizontal: 20),
                //         width: MediaQuery.of(context).size.width,
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Row(
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 Text(
                //                   "Title message",
                //                   style: ThemeConstant.textTheme.headline6!
                //                       .copyWith(
                //                     color: Colors.black,
                //                   ),
                //                 ),
                //                 CircleAvatar(
                //                   radius: 5,
                //                   backgroundColor:
                //                       ThemeConstant.lightScheme.primary,
                //                 ),
                //               ],
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.symmetric(vertical: 10),
                //               child: SizedBox(
                //                 width: MediaQuery.of(context).size.width * .75,
                //                 child: Text(
                //                   "In publishing and graphic design, Lorem ipsum is a placeholder text ",
                //                   style: ThemeConstant.textTheme.subtitle2!
                //                       .copyWith(
                //                     color: ThemeConstant.lightScheme.secondary,
                //                     fontWeight: FontWeight.w400,
                //                   ),
                //                   overflow: TextOverflow.ellipsis,
                //                   maxLines: 2,
                //                 ),
                //               ),
                //             ),
                //             Align(
                //               alignment: Alignment.bottomRight,
                //               child: Text(
                //                 "Jul 23, 2022 at 09:15 AM",
                //                 style:
                //                     ThemeConstant.textTheme.caption!.copyWith(
                //                   color: ThemeConstant.lightScheme.secondary,
                //                 ),
                //               ),
                //             )
                //           ],
                //         ),
                //       ),
                //     ),
                //     SizedBox(
                //       height: MediaQuery.of(context).size.height * .015,
                //     ),
                //     Container(
                //       width: MediaQuery.of(context).size.width,
                //       decoration: BoxDecoration(
                //         color: Color(0xffF1F3F4),
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //       child: InkWell(
                //         splashColor: Colors.black,
                //         onTap: () {
                //           print("object");
                //         },
                //         child: Padding(
                //           padding: const EdgeInsets.symmetric(
                //               horizontal: 20, vertical: 10),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Row(
                //                 crossAxisAlignment: CrossAxisAlignment.center,
                //                 mainAxisAlignment:
                //                     MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   Text(
                //                     "Title message",
                //                     style: ThemeConstant.textTheme.headline6!
                //                         .copyWith(
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                   CircleAvatar(
                //                     radius: 5,
                //                     backgroundColor:
                //                         ThemeConstant.lightScheme.primary,
                //                   ),
                //                 ],
                //               ),
                //               Padding(
                //                 padding:
                //                     const EdgeInsets.symmetric(vertical: 10),
                //                 child: SizedBox(
                //                   width:
                //                       MediaQuery.of(context).size.width * .75,
                //                   child: Text(
                //                     "In publishing and graphic design, Lorem ipsum is a placeholder text ",
                //                     style: ThemeConstant.textTheme.subtitle2!
                //                         .copyWith(
                //                       color:
                //                           ThemeConstant.lightScheme.secondary,
                //                       fontWeight: FontWeight.w400,
                //                     ),
                //                     overflow: TextOverflow.ellipsis,
                //                     maxLines: 2,
                //                   ),
                //                 ),
                //               ),
                //               Align(
                //                 alignment: Alignment.bottomRight,
                //                 child: Text(
                //                   "Jul 23, 2022 at 09:15 AM",
                //                   style:
                //                       ThemeConstant.textTheme.caption!.copyWith(
                //                     color: ThemeConstant.lightScheme.secondary,
                //                   ),
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //     SizedBox(
                //       height: MediaQuery.of(context).size.height * .015,
                //     ),
                //     Container(
                //       width: MediaQuery.of(context).size.width,
                //       decoration: BoxDecoration(
                //         color: Color(0xffF1F3F4),
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //       child: InkWell(
                //         splashColor: Colors.black,
                //         onTap: () {
                //           print("object");
                //         },
                //         child: Padding(
                //           padding: const EdgeInsets.symmetric(
                //               horizontal: 20, vertical: 10),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Row(
                //                 crossAxisAlignment: CrossAxisAlignment.center,
                //                 mainAxisAlignment:
                //                     MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   Text(
                //                     "Title message",
                //                     style: ThemeConstant.textTheme.headline6!
                //                         .copyWith(
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                   CircleAvatar(
                //                     radius: 5,
                //                     backgroundColor:
                //                         ThemeConstant.lightScheme.primary,
                //                   ),
                //                 ],
                //               ),
                //               Padding(
                //                 padding:
                //                     const EdgeInsets.symmetric(vertical: 10),
                //                 child: SizedBox(
                //                   width:
                //                       MediaQuery.of(context).size.width * .75,
                //                   child: Text(
                //                     "In publishing and graphic design, Lorem ipsum is a placeholder text ",
                //                     style: ThemeConstant.textTheme.subtitle2!
                //                         .copyWith(
                //                       color:
                //                           ThemeConstant.lightScheme.secondary,
                //                       fontWeight: FontWeight.w400,
                //                     ),
                //                     overflow: TextOverflow.ellipsis,
                //                     maxLines: 2,
                //                   ),
                //                 ),
                //               ),
                //               Align(
                //                 alignment: Alignment.bottomRight,
                //                 child: Text(
                //                   "Jul 23, 2022 at 09:15 AM",
                //                   style:
                //                       ThemeConstant.textTheme.caption!.copyWith(
                //                     color: ThemeConstant.lightScheme.secondary,
                //                   ),
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //     SizedBox(
                //       height: MediaQuery.of(context).size.height * .015,
                //     ),
                //     Container(
                //       width: MediaQuery.of(context).size.width,
                //       decoration: BoxDecoration(
                //         color: Color(0xffF1F3F4),
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //       child: InkWell(
                //         splashColor: Colors.black,
                //         onTap: () {
                //           print("object");
                //         },
                //         child: Padding(
                //           padding: const EdgeInsets.symmetric(
                //               horizontal: 20, vertical: 10),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Row(
                //                 crossAxisAlignment: CrossAxisAlignment.center,
                //                 mainAxisAlignment:
                //                     MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   Text(
                //                     "Title message",
                //                     style: ThemeConstant.textTheme.headline6!
                //                         .copyWith(
                //                       color: Colors.black,
                //                     ),
                //                   ),
                //                   CircleAvatar(
                //                     radius: 5,
                //                     backgroundColor:
                //                         ThemeConstant.lightScheme.primary,
                //                   ),
                //                 ],
                //               ),
                //               Padding(
                //                 padding:
                //                     const EdgeInsets.symmetric(vertical: 10),
                //                 child: SizedBox(
                //                   width:
                //                       MediaQuery.of(context).size.width * .75,
                //                   child: Text(
                //                     "In publishing and graphic design, Lorem ipsum is a placeholder text ",
                //                     style: ThemeConstant.textTheme.subtitle2!
                //                         .copyWith(
                //                       color:
                //                           ThemeConstant.lightScheme.secondary,
                //                       fontWeight: FontWeight.w400,
                //                     ),
                //                     overflow: TextOverflow.ellipsis,
                //                     maxLines: 2,
                //                   ),
                //                 ),
                //               ),
                //               Align(
                //                 alignment: Alignment.bottomRight,
                //                 child: Text(
                //                   "Jul 23, 2022 at 09:15 AM",
                //                   style:
                //                       ThemeConstant.textTheme.caption!.copyWith(
                //                     color: ThemeConstant.lightScheme.secondary,
                //                   ),
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // );
              },
            ),
          ),
        ),
      ),
    );
  }

  // Mark as Read on Notification

  // Future<NotificationModel> markAsread(String id) async{

  // }
}
