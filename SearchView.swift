import SwiftUI

struct SearchView: View {
    @State private var query = ""
    var body: some View {
        NavigationStack {
            ZStack {
                AuralisStyle.background.ignoresSafeArea()
                VStack(alignment: .leading, spacing: 18) {
                    Text("Search").font(.largeTitle.bold())
                    HStack {
                        Image(systemName: "magnifyingglass").foregroundStyle(.secondary)
                        TextField("Songs, artists, albums or sources", text: $query)
                    }
                    .padding(14)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
                    GlassCard {
                        ContentUnavailableView("Search is being connected",
                            systemImage: "music.magnifyingglass",
                            description: Text("The native provider system will power cross-source search."))
                    }
                    Spacer()
                }.padding()
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}
