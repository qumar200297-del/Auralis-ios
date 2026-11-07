import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house.fill") }
            SearchView()
                .tabItem { Label("Search", systemImage: "magnifyingglass") }
            LibraryView()
                .tabItem { Label("Library", systemImage: "square.stack.fill") }
            CapsuleView()
                .tabItem { Label("Capsule", systemImage: "chart.bar.fill") }
        }
        .tint(.white)
    }
}
