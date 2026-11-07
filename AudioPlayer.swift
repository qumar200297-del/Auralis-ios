import AVFoundation
import MediaPlayer
import SwiftUI

@MainActor
final class AudioPlayer: ObservableObject {
    @Published private(set) var currentTrack: Track?
    @Published private(set) var isPlaying = false
    @Published private(set) var currentTime: TimeInterval = 0

    private var player: AVPlayer?

    init() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Audio session setup failed: \(error)")
        }
        configureRemoteCommands()
    }

    func play(_ track: Track) {
        guard let url = track.streamURL else {
            currentTrack = track
            isPlaying = false
            return
        }
        currentTrack = track
        player = AVPlayer(url: url)
        player?.play()
        isPlaying = true
        updateNowPlaying()
    }

    func togglePlayback() {
        guard let player else { return }
        if isPlaying {
            player.pause()
        } else {
            player.play()
        }
        isPlaying.toggle()
        updateNowPlaying()
    }

    private func configureRemoteCommands() {
        let center = MPRemoteCommandCenter.shared()
        center.playCommand.addTarget { [weak self] _ in
            Task { @MainActor in self?.player?.play(); self?.isPlaying = true }
            return .success
        }
        center.pauseCommand.addTarget { [weak self] _ in
            Task { @MainActor in self?.player?.pause(); self?.isPlaying = false }
            return .success
        }
    }

    private func updateNowPlaying() {
        guard let track = currentTrack else { return }
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [
            MPMediaItemPropertyTitle: track.title,
            MPMediaItemPropertyArtist: track.artist
        ]
    }
}
