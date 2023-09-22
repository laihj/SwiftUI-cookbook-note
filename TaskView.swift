//
//  TaskView.swift
//  cookbook
//
//  Created by laihj on 2023/9/18.
//

import SwiftUI

//Use State and Binding for simple local state. State and Binding are perfect for managing simple state that is local to a view or can be passed from a parent view to a child view. Keep in mind that these property wrappers are designed to work with value types.
//Use ObservedObject and Published for complex state. When you have more complex state that can be shared across multiple views, consider using ObservedObject and Published in combination with a separate state management class.
//Use EnvironmentObject for shared state across unrelated views. If you need to share state across multiple views that aren’t directly related through a parent-child relationship, EnvironmentObject can be a good choice.
//Avoid large State variables. Storing large amounts of data in State variables can lead to performance issues, as SwiftUI recreates your view whenever state changes.
//Defer complex computation and side effects. Avoid running complex computations or side effects, like network requests, directly in your view structures.

class TaskManager: ObservableObject {
  @Published var tasks = [String]()

  func addTask(_ task: String) {
    tasks.append(task)
  }
}

struct TaskListView: View {
  @EnvironmentObject var taskManager: TaskManager
  @State private var newTask = ""

  var body: some View {
    NavigationStack {
      VStack {
        TextField("New task", text: $newTask)
          .onSubmit {
            if !newTask.isEmpty {
              taskManager.addTask(newTask)
              newTask = ""
            }
          }
          .padding()
        List(taskManager.tasks, id: \.self) { task in
          Text(task)
        }
      }
      .navigationTitle("Task List")
    }
  }
}


struct TaskView: View {
    @StateObject var taskManager = TaskManager()
    
    var body: some View {
      TaskListView()
        .environmentObject(taskManager)
    }
}

#Preview {
    TaskView()
}


