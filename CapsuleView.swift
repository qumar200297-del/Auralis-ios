import SwiftUI

struct CapsuleView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                AuralisStyle.background.ignoresSafeArea()
                VStack(alignment: .leading, spacing: 18) {
                    Text("Sound Capsule").font(.largeTitle.bold())
                    GlassCard {
                        Text("Your listening story").font(.title2.bold())
                        Text("Your top artists, tracks, listening time and streaks will be collected here.")
                            .font(.subheadline).foregroundStyle(.secondary)
                    }
                    GlassCard {
                        ContentUnavailableView("No listening data yet",
                            systemImage: "chart.bar.xaxis",
                            description: Text("Play tracking will begin when the audio engine is connected."))
                    }
                    Spacer()
                }.padding()
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}
