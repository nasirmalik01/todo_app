import 'package:flutter/material.dart';
import 'package:todo_app/res/app_generics/generics.dart';
import 'package:todo_app/res/colors.dart';
import 'package:todo_app/res/strings.dart';
import 'package:todo_app/utils/helper_methods/snackbar.dart';
import 'package:todo_app/view/widgets/button.dart';

class EditTodoBottomSheetWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function()? updateFunc;
  final String initialValue;

  const EditTodoBottomSheetWidget({
    required this.textEditingController,
    required this.updateFunc,
    required this.initialValue,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    textEditingController.text = initialValue;
    return Padding(
      padding: const EdgeInsets.only(
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: sizes.width * 0.05,
                top: sizes.height * 0.03,
              ),
              child: Text(
                AppStrings.editYourTodo,
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: sizes.fontSize20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: sizes.height * 0.015,),
            Padding(
              padding: EdgeInsets.only(
                  right: sizes.width * 0.05,
                  left: sizes.width * 0.05
              ),
              child: Center(
                child: Container(
                  margin: EdgeInsets.symmetric(
                      vertical: sizes.height * 0.01),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderColor),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: TextField(
                    controller: textEditingController,
                    style: const TextStyle(color: AppColors.blackColor),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: sizes.height * 0.01,
                          horizontal: sizes.height * 0.02
                      ),
                      border: InputBorder.none,
                      labelText: AppStrings.editTodoHint,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: sizes.height*0.025,),
            Center(
              child: elevatedButtonWidget(
                onPress: () async {
                  if(textEditingController.text.isEmpty){
                    Navigator.pop(context);
                    showSnackBar(context, message: 'Updated Todo can\'t be empty');
                  }
                  else {
                    await updateFunc!();
                    textEditingController.clear();
                    Navigator.pop(context);
                  }
                }
              )
            ),
            const SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
}
