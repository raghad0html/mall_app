// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:mall_app/ui/widget/custom_bottom_sheet.dart';
// import 'package:mall_app/ui/widget/get_location_widget.dart';
// import 'package:map_launcher/map_launcher.dart';
//
//
// class MapsSheet {
//   static void show({
//     required BuildContext context,
//     required double latUser,
//     required double longUser,
//     required String title,
//   }) async {
//     final availableMaps = await MapLauncher.installedMaps;
//
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return GetLocationWidget(whenDone: (lat ,long){
//           return CustomBottomSheet(
//             bottomSheetHeight: 300.0,
//             message: const Text(
//               'اختر تطبيق لعرض الموقع',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             options: availableMaps
//                 .map((map) => ListTile(
//               onTap: (){
//                 map.showDirections(
//                   destination: Coords(
//                       lat , long),
//                   destinationTitle: title,
//                   origin: Coords(
//                    latUser,
//                    longUser,
//                   ),
//                   originTitle:title,
//                   // waypoints: waypoints,
//                   directionsMode: DirectionsMode.driving,
//                 );
//               },
//               title: Text(map.mapName),
//               leading: SvgPicture.asset(
//                 map.icon,
//                 height: 30.0,
//                 width: 30.0,
//               ),
//             ))
//                 .toList(),
//           );
//         }, onLocationFounded: (lat ,long ) {  },);
//
//       },
//     );
//   }
// }
