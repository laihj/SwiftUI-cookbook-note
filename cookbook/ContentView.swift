//
//  ContentView.swift
//  cookbook
//
//  Created by laihj on 2023/9/15.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
        NavigationStack {
            Text("hello")
                .font(.largeTitle)
                .navigationTitle("Hello")
                .navigationBarTitleDisplayMode(.inline)
            
            NavigationLink("detailList", destination: DetailListView())
            NavigationLink("detailForm", destination: DetailFormView())
            
            NavigationLink("storeView", destination: AppSceneStoreView())
            
            Button {
                
            } label: {
                Text("Press Me!")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
            }.padding()
                .background(
                    LinearGradient(gradient: Gradient(colors: [.purple,.pink]), startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .cornerRadius(10)
            
            Text("backgouund")
                .background(
                    Image(systemName: "flame")
                        .resizable(resizingMode: .tile) //todo tile 为什么没有平铺开
                        .opacity(0.25)
                )
                .fontWeight(.heavy)
                .fontWidth(.expanded)
                .padding()
                .background(.white)// todo 没有 background 就没有 shadow
                .border(Color.black, width: 3)
                .shadow(radius: 10)
            
            Circle()
                    .fill(Color.blue) //todo 没有 fill 也没有 shadow
                    .shadow(color: .purple, radius: 10, x: 0, y: 0)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        }
    }
}
    
struct DetailListView: View {
    let tasks = ["Task 1", "Task 2", "Task 3", "Task 4", "Task 5"]
      var body: some View {
          List(tasks, id: \.self) { task in
                Text(task)
              }
      }
}

struct DetailFormView: View {
    @EnvironmentObject var settings:UserSettings
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    
  var body: some View {
      NavigationView {
          Form {
              Section(header: Text("Person info")) {
                  TextField("Username", text: $settings.username)
                  TextField("email", text:$email)
              }
              
              Section(header: Text("Login")) {
                  SecureField("password", text: $password)
              }
              
              Section {
                  Button(action: {
                      Task {
                          sleep()
                          await MainActor.run {
                              
                          }
                      }
//                      do {
//                          let image = try await fetchImage()
//                      } catch {
//                          
//                      }
                      print("yes")
                  }, label: {
                      Text("Button")
                  })
              }
              
          }
      }
  }
    func sleep() {
        
    }
    
    func fetchData() async {
        do {
            try await fetchImage()
        } catch {
            
        }
    }

    func fetchImage() async throws -> Image {
        return Image("image")
    }
}




#Preview {
    ContentView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        .environmentObject(UserSettings())
}
