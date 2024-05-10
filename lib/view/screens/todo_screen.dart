import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/data/local/my_hive.dart';
import 'package:todo_app/res/app_generics/generics.dart';
import 'package:todo_app/res/colors.dart';
import 'package:todo_app/res/strings.dart';
import 'package:todo_app/view/widgets/add_new_todo_widget.dart';
import 'package:todo_app/view/widgets/no_todos_widget.dart';
import 'package:todo_app/view_model/todo_provider.dart';

import '../../models/todo.dart';
import '../widgets/todo_item.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeResources(context: context);
    List todoList = [];

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Consumer<ToDoProvider>(
        builder: (BuildContext context,
            todoProviderValue, Widget? child) {

          /// Getting all the todos if any
           todoList = MyHive.getTodoList();

        return Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: sizes.width * 0.04,
                vertical: sizes.height*0.02,
              ),
              child: Column(
                children: [
                  SizedBox(height: sizes.height * 0.05,),
                  Expanded(
                    child: ListView(
                      children: [
                        /// All Todos Heading text
                        Container(
                          margin: EdgeInsets.only(
                            bottom: sizes.height * 0.02,
                          ),
                          child:  Text(
                            AppStrings.allToDos,
                            style: TextStyle(
                              fontSize: sizes.fontSize30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        /// Showing No ToDos message if there are no Todos
                        todoList.isEmpty
                            ?  noToDosMessageWidget(message: AppStrings.noTodosMessage)
                            : Container(),

                        /// Listing of all ToDos
                        for (Todo todo in todoList.reversed)
                          ToDoItem(
                            todo: todo,
                            onToDoChanged: todoProviderValue.markAsCompleted,
                            onDeleteItem: todoProviderValue.deleteToDoItem,
                            onUpdateItem: todoProviderValue.updateToDoItem,
                            updatedTextController: todoProviderValue.updatedTodoController,
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            /// Adding new Todo item textField and button
            Align(
              alignment: Alignment.bottomCenter,
              child: AddNewTodoWidget(todoProvider: todoProviderValue),
            ),
          ],
        );
      },
      ),
    );
  }

}
