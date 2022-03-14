import 'package:flutter/material.dart';
import 'package:todo/ui_elements/atoms/default_text.dart';
import 'package:todo/ui_elements/atoms/delete_icon.dart';
import 'package:todo/ui_elements/atoms/edit_icon.dart';
import 'package:todo/ui_elements/atoms/small_text.dart';

class TodoCard extends StatelessWidget {
  final String todoData;
  final String date;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  const TodoCard(
      {Key? key,
      required this.todoData,
      this.date = '',
      this.onDelete,
      this.onEdit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0.2),
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ]),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: DefaultText(todoData)),
              InkWell(
                child: const DeleteIcon(),
                onTap: onDelete,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: SmallText(date)),
              InkWell(
                child: const EditIcon(),
                onTap: onEdit,
              ),
            ],
          )
        ],
      ),
    );
  }
}
