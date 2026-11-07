import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var player: AudioPlayer

    var body: some View {
        NavigationStack {
            ZStack {
                AuralisStyle.background.ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading, spacing: 22) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("AURALIS").font(.caption.weight(.bold)).tracking(3).foregroundStyle(.white.opacity(0.6))
                                Text("Good evening").font(.largeTitle.bold())
                            }
                            Spacer()
                            Image(systemName: "waveform").font(.title2)
                                .padding(13).background(.ultraThinMaterial, in: Circle())
                        }

                        GlassCard {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("YOUR SOUND, YOUR SPACE").font(.caption2.bold()).tracking(1.5).foregroundStyle(.white.opacity(0.6))
                                Text("Music without limits.").font(.title2.bold())
                                Text("Your local library and connected music sources, together.")
                                    .font(.subheadline).foregroundStyle(.white.opacity(0.7))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }

                        Text("Your library").font(.title2.bold())
                        GlassCard {
                            Label("Import music from Files", systemImage: "folder.badge.plus")
                                .font(.headline)
                            Text("Local audio import will be connected in the next milestone.")
                                .font(.caption).foregroundStyle(.secondary)
                        }

                        Text("Listening").font(.title2.bold())
                        GlassCard {
                            HStack(spacing: 12) {
                                Image(systemName: "music.note").font(.title2)
                                    .frame(width: 48, height: 48)
                                    .background(.white.opacity(0.08), in: RoundedRectangle(cornerRadius: 12))
                                VStack(alignment: .leading) {
                                    Text(player.currentTrack?.title ?? "Nothing playing")
                                        .font(.headline)
                                    Text(player.currentTrack?.artist ?? "Choose a track to begin")
                                        .font(.caption).foregroundStyle(.secondary)
                                }
                                Spacer()
                                Button { player.togglePlayback() } label: {
                                    Image(systemName: player.isPlaying ? "pause.fill" : "play.fill")
                                        .font(.title3).padding(12)
                                }
                                .disabled(player.currentTrack == nil)
                            }
                        }
                    }
                    .padding()
                }
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}
