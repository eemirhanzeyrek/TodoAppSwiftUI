import SwiftUI

@main
struct ToDoAppUserDefaultsApp: App {
    @StateObject var vm: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(vm)
        }
    }
}
