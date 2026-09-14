// import 'package:lab2_todo/todo.dart';

// void main() {
//   Todo task1 = Todo(id: 1, title: 'Купить продукты');
//   Todo task2 = Todo(id: 2, title: 'Сделать зарядку');
//   task1.complete();
//   print(task1);
//   print(task2);
// }

// import 'dart:io';
// void main() {
//   stdout.write('Введите что-нибудь: ');
//   String? input = stdin.readLineSync();
//   print('Вы ввели: $input');
// }

import 'dart:io';
import 'package:lab2_todo/todo.dart';
void printMenu() {
  print('');
  print('ToDo список');
  print('add - добавить задачу');
  print('list - показать');
  print('done - отметить выполненной');
  print('delete - удалить задачу');
  print('exit - выйти');
}

void addTodo(List<Todo> todos) {
  stdout.write('Название задачи: ');
  String? input = stdin.readLineSync();

  if (input == null || input.trim().isEmpty) {
    print('Ошибка: название не может быть пустым');
    return;
  }
  int newId = todos.isEmpty ? 1: todos.last.id + 1;
  todos.add(Todo(id: newId, title: input.trim()));
  print('Задача добавлена!');
}

void listTodos(List<Todo> todos) {
  if (todos.isEmpty) {
    print('Список задач пуст');
    return;
  }

  print('');
  for (var todo in todos) {
    print(todo);
  }
}

void completeTodo(List<Todo> todos) {
  stdout.write('ID задачи: ');
  String? input = stdin.readLineSync();

  if (input == null) return;

  int? id = int.tryParse(input.trim());
  if (id == null) {
    print('Ошибка: введите число');
    return;
  }
  for (var todo in todos) {
    if (todo.id == id) {
      todo.complete();
      print('Задача отмечена выполненной!');
      return;
    }
  }
  print('Задача с ID $id не найдена');
}