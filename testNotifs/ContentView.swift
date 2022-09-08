import SwiftUI

struct Ocean: Identifiable {
    let name: String
    let id = UUID()
}

class OceanStore: ObservableObject {
     @Published var oceans = [Ocean]()
     func loadStats() async {}
     func add(ocean: Ocean){
        oceans.append(ocean)
     }
 }

struct ContentView: View {
    @ObservedObject var store: OceanStore
    
    func signIn() {
      print("Request notifications access:")
      let center = UNUserNotificationCenter.current()
      // set the type as sound or badge
      center.requestAuthorization(options: [.sound,.alert,.badge]) { (granted, error) in
          if granted {
              print("Notification Enable Successfully!")
          }else{
              print("Some Error Occured.")
          }
      }
      UIApplication.shared.registerForRemoteNotifications()
        store.add(ocean: Ocean(name: "Notification access requested."))
        store.add(ocean: Ocean(name: "See logs for device token and messages."))
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("APNs notification checker").padding()
            Button(action: signIn) {
                Text("Request notifications access")
            }.padding()
            List(){
                        ForEach(store.oceans) { ocean in
                            Text(ocean.name)
                        }
            }.navigationTitle("APNs messages")
        }
    }
}
