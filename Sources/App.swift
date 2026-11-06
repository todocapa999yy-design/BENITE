import SwiftUI
import WebKit

@main
struct BeniteApp: App {
    var body: some Scene {
        WindowGroup {
            PanelView()
                .ignoresSafeArea()
                .preferredColorScheme(.dark)
        }
    }
}

struct PanelView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let cfg = WKWebViewConfiguration()
        cfg.allowsInlineMediaPlayback = true
        cfg.websiteDataStore = .default()

        let wv = WKWebView(frame: .zero, configuration: cfg)
        wv.isOpaque = false
        wv.backgroundColor = .black
        wv.scrollView.backgroundColor = .black
        wv.scrollView.bounces = false
        wv.allowsBackForwardNavigationGestures = false

        if let url = Bundle.main.url(forResource: "index", withExtension: "html") {
            wv.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }
        return wv
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
