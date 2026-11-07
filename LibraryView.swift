import SwiftUI

struct LibraryView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                AuralisStyle.background.ignoresSafeArea()
                VStack(alignment: .leading, spacing: 18) {
                    Text("Your Library").font(.largeTitle.bold())
                    GlassCard {
                        Label("Playlists", systemImage: "music.note.list")
                        Divider().overlay(.white.opacity(0.1))
                        Label("Downloads", systemImage: "arrow.down.circle")
                        Divider().overlay(.white.opacity(0.1))
                        Label("Liked songs", systemImage: "heart")
                        Divider().overlay(.white.opacity(0.1))
                        Label("Recently played", systemImage: "clock")
                    }
                    Text("Your library will appear here after importing or adding music.")
                        .font(.subheadline).foregroundStyle(.secondary)
                    Spacer()
                }.padding()
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}
