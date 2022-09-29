import 'package:flutter/material.dart';
import 'package:steps_tracker/features/home/domain/entities/user_entity.dart';


// ignore: must_be_immutable
class DropdownButtonView extends StatelessWidget {
  final String title;
  final List dropdownValues ;
  UserEntity? selected;
  final Function(dynamic) onChanged;

  DropdownButtonView({
    required this.title,
    required this.dropdownValues,
    required this.selected,
    required this.onChanged,
    Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text( title,
          style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 4,),
        Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
                color: const Color(0xffA4B0BE), style: BorderStyle.solid, width: 0.80),
          ),
          child:DropdownButton<UserEntity>(
            onTap: ()async{

              },
            borderRadius: BorderRadius.circular(12),
            items: dropdownValues
                .map((value) => DropdownMenuItem<UserEntity>(
              child:dropDownItem(value),
              value: value,
            ))
                .toList(),
            onChanged: (UserEntity? value) {
              onChanged(value!);
            },
            isExpanded: true,
            underline: const SizedBox(),
            value: selected,

          ),
        ),
      ],
    );
  }

  dropDownItem(value){
    return Row(
      children: [
        const SizedBox(width: 8,),
        Text(value.name),
      ],
    );
  }
}