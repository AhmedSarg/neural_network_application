// import 'package:flutter/material.dart';
//
// class CustomNavBar extends StatelessWidget {
//   const CustomNavBar(
//       {super.key, required this.navBarItems, required this.selectedIndex});
//
//   final List<NavBarItem> navBarItems;
//   final int selectedIndex;
//
//   @override
//   Widget build(BuildContext context) {
//     double itemWidth = context.width() / navBarItems.length;
//     double lineWidth = context.width() / navBarItems.length / 2;
//     TextDirection direction = AppLanguages.getCurrentTextDirection(context);
//     return Container(
//       height: AppSize.s60,
//       width: AppSize.infinity,
//       color: ColorManager.primary,
//       child: Stack(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: navBarItems
//                 .map(
//                   (e) => NavBarItemWidget(
//                     navBarItem: e,
//                     isSelected: selectedIndex == navBarItems.indexOf(e),
//                     totalItems: navBarItems.length,
//                   ),
//                 )
//                 .toList(),
//           ),
//           AnimatedPositioned(
//             top: 45,
//             left: direction == TextDirection.ltr ? itemWidth * (selectedIndex + 0.5) - lineWidth / 2 : null,
//             right: direction == TextDirection.rtl ? itemWidth * (selectedIndex + 0.5) - lineWidth / 2 : null,
//             duration: const Duration(milliseconds: 200),
//             curve: Curves.easeInOut,
//             child: Container(
//               height: 2,
//               width: lineWidth,
//               clipBehavior: Clip.antiAliasWithSaveLayer,
//               decoration: BoxDecoration(
//                 color: ColorManager.secondary,
//                 borderRadius: BorderRadius.circular(1),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class NavBarItem {
//   final IconData icon;
//   final String text;
//   final double size;
//   final Function onPressed;
//
//   NavBarItem({
//     required this.icon,
//     required this.text,
//     this.size = AppSize.s24,
//     required this.onPressed,
//   });
// }
//
// class NavBarItemWidget extends StatelessWidget {
//   const NavBarItemWidget({
//     super.key,
//     required this.navBarItem,
//     required this.isSelected,
//     required this.totalItems,
//   });
//
//   final NavBarItem navBarItem;
//   final bool isSelected;
//   final int totalItems;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () {
//         navBarItem.onPressed();
//       },
//       style: TextButton.styleFrom(
//           foregroundColor: ColorManager.secondary,
//           fixedSize: Size(context.width() / totalItems, AppSize.s60),
//           padding: const EdgeInsets.all(AppPadding.p8)),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(
//             height: AppSize.s22,
//             child: Icon(
//               navBarItem.icon,
//               size: isSelected ? navBarItem.size + AppSize.s4 : navBarItem.size,
//               color: isSelected ? ColorManager.secondary : ColorManager.white,
//             ),
//           ),
//           SizedBox(
//             height: AppSize.s22,
//             child: isSelected
//                 ? const SizedBox()
//                 : Center(
//                     child: Text(
//                       navBarItem.text,
//                       // style: AppTextStyles.navBarItemTextStyle(context),
//                     ),
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }
