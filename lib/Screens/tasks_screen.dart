import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../Models/task.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  String? newTaskTitle;
  List<Task> taskList=[
    Task(title: "Is Book"),
    Task(title: "Is Plant"),
    Task(title: "Is Animal"),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      floatingActionButton: FloatingActionButton(
        onPressed: ()         {
          showModalBottomSheet(context: context,
          //isScrollControlled: true,
           builder: ((context) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom ),
                color: Color(0xff757575),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)
                    )
                  ),
                  child: Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Add Task ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 30,
                       fontWeight: FontWeight.w500
                      ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                              ),
                            ),
                        ),
                        textAlign: TextAlign.center,
                        autofocus: true,
                        cursorColor: Colors.orange,
                        onChanged: (newTitle){
                          newTaskTitle=newTitle;
                        },
                      ),
                      ElevatedButton(
                      onPressed: (() {
                        setState(() {
                          taskList.add(Task(title: newTaskTitle.toString()));
                        });
                        Navigator.pop(context);
                        
                      }), 
                      style: ButtonStyle(
                       padding: MaterialStateProperty.all( EdgeInsets.all(20.0)),
                       backgroundColor: MaterialStateProperty.all(Colors.orange),
                      ),
                      child: Text("Add Task",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25
                      ),),
                      )
                    ],
                  ),
                ),
            
              ),
            );
          }));
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 30.0,right: 30.0,bottom: 30.0,top: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30.0,
              child: Icon(
                Icons.list,
                color: Colors.orange,
                size: 30.0,
               // size: ,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Todeoy",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.w700
                
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${taskList.length.toString()} Tasks",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0
              ),
            ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                child: ListView.builder(
                  itemCount: taskList.length,
                  itemBuilder: ((context, index) {
                    return TaskTile(Tasktile: taskList[index].title,ischecked: taskList[index].isDone,
                    checkboxCallback: (checckboxSate){
                      setState(() {
                        taskList[index].toggle();
                        taskList.removeAt(index);
                      
                      });
                    });
                  }),

                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    
                  )
                ),
              ),
            )
            
          ],
        ),
    );
  }
}


class TaskTile extends StatelessWidget {
  final bool ischecked;
  final String Tasktile;
  final Function checkboxCallback;
  TaskTile({
    required this.Tasktile,
    required this.ischecked,
    required this.checkboxCallback,

  });

 
  @override
  Widget build(BuildContext context) {
    return ListTile(
          title: Text(Tasktile,style: TextStyle(decoration: (ischecked)?TextDecoration.lineThrough:null),),
          trailing: Checkbox(
              fillColor: MaterialStateProperty.all(Colors.orange),
              value: ischecked,
              onChanged: (newValue){
                checkboxCallback(newValue);
              },
             ));
      
}
}