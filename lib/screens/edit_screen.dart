import 'package:flutter/material.dart';
import 'package:todo/ui_elements/atoms/default_button.dart';
import 'package:todo/ui_elements/atoms/default_text.dart';
import 'package:todo/ui_elements/molecules/input_box.dart';

enum EditType {
  add,
  edit,
}

class EditScreen extends StatefulWidget {
  final EditType editType;
  final VoidCallback? onSubmit;

  const EditScreen({
    Key? key,
    required this.editType,
    this.onSubmit,
  }) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              DefaultText(
                widget.editType == EditType.add ? 'Add New Task' : 'Edit Task',
              ),
              const SizedBox(
                height: 64,
              ),
              InputBox(
                hint: widget.editType == EditType.add
                    ? 'Enter Here'
                    : 'Have to push code',
                onChanged: (text) => {},
                controller: controller,
              ),
              const SizedBox(
                height: 37,
              ),
              DefaultButton(
                text: widget.editType == EditType.add ? 'Submit' : 'Update',
                color: widget.editType == EditType.add
                    ? const Color(0xFF5748FF)
                    : const Color(0xFFA39C00),
                onTap: () => {
                  Navigator.pop(context, [controller.text, widget.editType])
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
