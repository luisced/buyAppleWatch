import SwiftUI
import SplineRuntime
import WebKit

struct ContentView: View {
    @State private var showWebView = false
    @Environment(\.scenePhase) var scenePhase

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            VStack(spacing: 20) {
                
                Text("Apple Watch SE")
                    .font(.system(size: 40, weight: .bold, design: .default))
                    .foregroundColor(.white)
                    .padding(.top, 40)

                let url = URL(string: "https://build.spline.design/sHaGIf6KD36LDDB-bQZj/scene.splineswift")!
                SplineView(sceneFileURL: url)
                    .frame(height: 400)
                    .ignoresSafeArea(.all)

                Button(action: {
                    showWebView = true
                }) {
                    Text("Buy Now")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.bottom, 40)
            }
        }
        .sheet(isPresented: $showWebView) {
            WebView(url: URL(string: "https://www.apple.com/shop/buy-watch")!)
        }
        .onChange(of: scenePhase) { newPhase in
            switch newPhase {
            case .active:
                print("La app está activa")
            case .inactive:
                print("La app está inactiva")
            case .background:
                print("La app está en segundo plano")
            @unknown default:
                print("Estado desconocido")
            }
        }
    }
}

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

#Preview {
    ContentView()
}
