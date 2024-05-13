// import 'package:flutter/material.dart';
//
// class CustomTextField extends StatefulWidget {
//   const CustomTextField({
//     super.key,
//     required this.focusNode,
//     this.nextFocus,
//     required this.controller,
//     this.width = AppSize.s300,
//     this.height = AppSize.s50,
//     required this.validator,
//     required this.obscureText,
//     required this.keyboardType,
//     this.readOnly = false,
//     this.onTap,
//   });
//
//   final FocusNode focusNode;
//   final FocusNode? nextFocus;
//   final TextEditingController controller;
//   final double width, height;
//   final String? Function(String?) validator;
//   final bool obscureText;
//   final TextInputType keyboardType;
//   final void Function()? onTap;
//   final bool readOnly;
//
//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }
//
// class _CustomTextFieldState extends State<CustomTextField> {
//   String? errorText;
//   bool focused = false;
//
//   @override
//   Widget build(BuildContext context) {
//     Color borderColor = focused ? ColorManager.secondary : ColorManager.primary;
//     BorderRadius englishBorder = BorderRadius.only(
//       bottomLeft: Radius.circular(widget.height / 4),
//       bottomRight: Radius.circular(widget.height / 2),
//       topRight: Radius.circular(widget.height / 2),
//       topLeft: Radius.zero,
//     );
//     BorderRadius arabicBorder = BorderRadius.only(
//       bottomLeft: Radius.circular(widget.height / 2),
//       bottomRight: Radius.circular(widget.height / 4),
//       topRight: Radius.zero,
//       topLeft: Radius.circular(widget.height / 2),
//     );
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Focus(
//           // focusNode: widget.focusNode,
//           onFocusChange: (focused) {
//             setState(() {
//               this.focused = focused;
//             });
//           },
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 300),
//             width: widget.width,
//             height: widget.height,
//             padding: const EdgeInsets.only(bottom: 2),
//             decoration: BoxDecoration(
//                 color: ColorManager.offwhite,
//                 border: Border(
//                   bottom: BorderSide(
//                     width: 2,
//                     color: borderColor,
//                     strokeAlign: BorderSide.strokeAlignOutside,
//                   ),
//                 ),
//                 borderRadius: AppLanguages.getCurrentTextDirection(context) == TextDirection.rtl ? arabicBorder : englishBorder,
//                 boxShadow: [
//                   BoxShadow(
//                     color: ColorManager.black.withOpacity(.3),
//                     blurRadius: 4,
//                     offset: const Offset(0, 2),
//                   ),
//                 ],
//               ),
//             clipBehavior: Clip.antiAliasWithSaveLayer,
//             child: TextFormField(
//                 controller: widget.controller,
//                 focusNode: widget.focusNode,
//                 cursorWidth: AppSize.s1,
//                 cursorColor: ColorManager.secondary,
//                 obscureText: widget.obscureText,
//                 keyboardType: widget.keyboardType,
//                 onTap: widget.onTap,
//                 readOnly: widget.readOnly,
//                 validator: (value) {
//                   setState(() {
//                     errorText = widget.validator(value);
//                   });
//                   return widget.validator(value);
//                 },
//                 textInputAction: TextInputAction.next,
//                 onEditingComplete: () {
//                   if (widget.nextFocus != null) {
//                     widget.focusNode.unfocus();
//                     widget.nextFocus!.requestFocus();
//                   }
//                 },
//                 // style: AppTextStyles.textFieldValueTextStyle(context),
//                 decoration: const InputDecoration(
//                   errorStyle: TextStyle(
//                     fontSize: AppSize.s0,
//                     color: ColorManager.transparent,
//                   ),
//                   contentPadding:
//                       EdgeInsets.symmetric(horizontal: AppPadding.p8),
//                   enabledBorder: InputBorder.none,
//                   disabledBorder: InputBorder.none,
//                   focusedBorder: InputBorder.none,
//                   errorBorder: InputBorder.none,
//                   focusedErrorBorder: InputBorder.none,
//                 ),
//               ),
//           ),
//         ),
//         const SizedBox(
//           height: AppSize.s8,
//         ),
//         errorText == null
//             ? const SizedBox()
//             : Text(
//                 errorText!,
//                 // style: AppTextStyles.textFieldErrorTextStyle(context),
//               ),
//       ],
//     );
//   }
// }
