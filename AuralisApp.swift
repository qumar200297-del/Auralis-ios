import SwiftUI

@main
struct AuralisApp: App {
    @StateObject private var player = AudioPlayer()

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(player)
                .preferredColorScheme(.dark)
        }
    }
}
