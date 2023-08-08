import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import '../../../utils/common_widgets/texts.dart';
import '../../../utils/extensions/theme/colors/color_manager.dart';

class OfferInfo extends StatefulWidget {
  String title;
  bool isDate;
  final validator;
  TextEditingController dateController;


  OfferInfo({required this.title, required this.isDate, required this.dateController, required this.validator});

  @override
  State<OfferInfo> createState() => _OfferInfoState();
}

class _OfferInfoState extends State<OfferInfo> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 2),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.dateController.text = DateFormat('yyyy-MM-dd').format(picked).toString(); // Format as needed
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        largeBody(widget.title, ColorManager.greyColor100, false),
        SizedBox(height: context.width * 0.01),
        Row(
          children: [
            Expanded(
                child: TextFormField(
                  controller: widget.dateController,
                  validator: widget.validator,
                  readOnly: widget.isDate,
                  keyboardType: TextInputType.number,
                  onTap: widget.isDate
                      ? () async{await _selectDate(context);}
                      : null,
                  style: GoogleFonts.fraunces(
                    textStyle: TextStyle(
                      fontSize: 14,
                        color: ColorManager.greyColor200,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: ColorManager.greyColor)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: ColorManager.greyColor)
                    ),
                  ),
                )
            ),
          ],
        ),
      ],
    );
  }
}
