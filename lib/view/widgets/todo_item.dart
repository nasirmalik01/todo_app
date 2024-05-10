import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/res/app_generics/generics.dart';
import 'package:todo_app/res/colors.dart';
import 'package:todo_app/view/widgets/edit_todo_bottom_sheet_widget.dart';
import 'package:todo_app/view/widgets/icon_widget.dart';

class ToDoItem extends StatelessWidget {
  final Todo todo;
  final onToDoChanged;
  final onDeleteItem;
  final onUpdateItem;
  final TextEditingController updatedTextController;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
    required this.onUpdateItem,
    required this.updatedTextController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: sizes.height * 0.02),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo, todo.id);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(
            horizontal: sizes.width * 0.05,
            vertical: sizes.height * 0.007
        ),
        tileColor: Colors.white,
        leading: Icon(
           todo.isCompleted
               ? Icons.check_box
               : Icons.check_box_outline_blank,
          color: AppColors.blueColor,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: sizes.fontSize16,
            color: AppColors.blackColor,
            decoration:
             todo.isCompleted ?
            TextDecoration.lineThrough
                 : null,
          ),
        ),
        trailing: SizedBox(
          width: sizes.width * 0.18,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///Adding edit icon button
              iconWidget(
                  icon: Icons.edit,
                  color: AppColors.greyColor,
                  onPress: (){
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          /// Adding edit todo textField and button
                          return EditTodoBottomSheetWidget(
                              textEditingController: updatedTextController,
                              initialValue: todo.todoText!,
                              updateFunc: () async {
                                await onUpdateItem(todo.id, updatedTextController.text);
                              },

                              );
                        });
              }),
              /// Adding delete icon button
              iconWidget(icon: Icons.delete, onPress: (){
                onDeleteItem(todo.id);
              })
            ],
          ),
        ),
      ),
    );
  }
}
