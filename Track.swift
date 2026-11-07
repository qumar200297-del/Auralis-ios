import Foundation

struct Track: Identifiable, Codable, Hashable {
    let id: String
    var title: String
    var artist: String
    var album: String?
    var artworkURL: URL?
    var duration: TimeInterval?
    var sourceName: String
    var streamURL: URL?

    init(id: String = UUID().uuidString,
         title: String,
         artist: String,
         album: String? = nil,
         artworkURL: URL? = nil,
         duration: TimeInterval? = nil,
         sourceName: String = "Local",
         streamURL: URL? = nil) {
        self.id = id
        self.title = title
        self.artist = artist
        self.album = album
        self.artworkURL = artworkURL
        self.duration = duration
        self.sourceName = sourceName
        self.streamURL = streamURL
    }
}
