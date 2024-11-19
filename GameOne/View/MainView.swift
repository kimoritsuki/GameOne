import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Jouer", systemImage: "gamecontroller")
                }
            
            StatsView()
                .tabItem {
                    Label("Stats", systemImage: "chart.bar")
                }
            
            AccountView()
                .tabItem {
                    Label("Compte", systemImage: "person.crop.circle")
                }
            
            SettingsView()
                .tabItem {
                    Label("Paramètres", systemImage: "gear")
                }
        }
    }
}

#Preview {
    MainView()
}
