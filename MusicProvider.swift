import Foundation

/// Native provider contract. Each provider is implemented and shipped with the app;
/// Android .eapk packages are not executable on iOS.
protocol MusicProvider {
    var id: String { get }
    var displayName: String { get }
    func search(query: String) async throws -> [Track]
}

enum ProviderError: Error {
    case notConfigured
    case unsupportedSource
}
