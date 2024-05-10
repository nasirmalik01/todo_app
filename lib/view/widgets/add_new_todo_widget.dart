import 'package:flutter/material.dart';
import 'package:todo_app/res/app_generics/generics.dart';
import 'package:todo_app/res/colors.dart';
import 'package:todo_app/res/strings.dart';
import 'package:todo_app/utils/helper_methods/snackbar.dart';
import 'package:todo_app/view_model/todo_provider.dart';

class AddNewTodoWidget extends StatelessWidget {
  final ToDoProvider todoProvider;
  const AddNewTodoWidget({required this.todoProvider, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                bottom: sizes.height*0.03,
                right: sizes.width*0.04,
                left: sizes.width*0.05,
              ),
              padding:  EdgeInsets.symmetric(
                horizontal: sizes.width * 0.04,
                vertical: sizes.height*0.006,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: todoProvider.todoController,
                decoration: const InputDecoration(
                    hintText: AppStrings.addTodoTextFieldHint,
                    border: InputBorder.none),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                bottom: sizes.height*0.03,
                right: sizes.width*0.04,
              ),
              child: FloatingActionButton(
                shape: const CircleBorder(),
                backgroundColor: AppColors.blueColor,
                onPressed: () {
                  if(todoProvider.todoController.text.isEmpty){
                    showSnackBar(context, message: 'Todo can\'t be empty');
                  }
                  else {
                    todoProvider.addToDoItem(
                        todoProvider.todoController.text);
                  }
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
          ),
        ]);
  }
}
