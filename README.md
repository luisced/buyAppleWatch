### 1. **Importaciones**
   ```swift
   import SwiftUI
   import SplineRuntime
   import WebKit
   ```
   - **SwiftUI**: Framework para construir interfaces de usuario.
   - **SplineRuntime**: Librería para integrar animaciones 3D creadas con Spline.
   - **WebKit**: Framework para mostrar contenido web.

---

### 2. **Estructura Principal (`ContentView`)**
   ```swift
   struct ContentView: View {
   ```
   - Define la vista principal de la aplicación.

---

### 3. **Variables de Estado**
   ```swift
   @State private var showWebView = false
   @Environment(\.scenePhase) var scenePhase
   ```
   - **`showWebView`**: Controla si se muestra la vista web.
   - **`scenePhase`**: Observa el estado de la aplicación (activa, inactiva, en segundo plano).

---

### 4. **Cuerpo de la Vista (`body`)**
   ```swift
   var body: some View {
   ```
   - Define el contenido de la vista.

---

### 5. **Fondo Negro**
   ```swift
   ZStack {
       Color.black
           .ignoresSafeArea()
   ```
   - Establece un fondo negro que cubre toda la pantalla, ignorando las áreas seguras (como la muesca).

---

### 6. **Contenido Principal (`VStack`)**
   ```swift
   VStack(spacing: 20) {
   ```
   - Organiza los elementos en una columna vertical con un espacio de 20 puntos entre ellos.

---

### 7. **Título**
   ```swift
   Text("Apple Watch SE")
       .font(.system(size: 40, weight: .bold, design: .default))
       .foregroundColor(.white)
       .padding(.top, 40)
   ```
   - Muestra el texto "Apple Watch SE" en grande, en negrita y de color blanco, con un espacio superior de 40 puntos.

---

### 8. **Animación 3D con Spline**
   ```swift
   let url = URL(string: "https://build.spline.design/sHaGIf6KD36LDDB-bQZj/scene.splineswift")!
   SplineView(sceneFileURL: url)
       .frame(height: 400)
       .ignoresSafeArea(.all)
   ```
   - Carga una animación 3D desde una URL usando Spline.
   - La animación tiene una altura fija de 400 puntos y cubre toda la pantalla.

---

### 9. **Botón "Buy Now"**
   ```swift
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
   ```
   - Muestra un botón azul con el texto "Buy Now".
   - Al presionarlo, cambia `showWebView` a `true`, lo que muestra la vista web.

---

### 10. **Vista Web (`sheet`)**
   ```swift
   .sheet(isPresented: $showWebView) {
       WebView(url: URL(string: "https://www.apple.com/shop/buy-watch")!)
   }
   ```
   - Muestra una vista web en un modal cuando `showWebView` es `true`.
   - La URL cargada es la página de compra del Apple Watch.

---

### 11. **Manejo del Ciclo de Vida de la App**
   ```swift
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
   ```
   - Observa cambios en el estado de la aplicación (activa, inactiva, en segundo plano) e imprime un mensaje en la consola.

---

### 12. **Vista Web (`WebView`)**
   ```swift
   struct WebView: UIViewRepresentable {
       let url: URL

       func makeUIView(context: Context) -> WKWebView {
           let webView = WKWebView()
           webView.load(URLRequest(url: url))
           return webView
       }

       func updateUIView(_ uiView: WKWebView, context: Context) {}
   }
   ```
   - Define una vista web usando `WKWebView` de WebKit.
   - Carga la URL proporcionada y la muestra en la vista.

---

### 13. **Vista Previa (`Preview`)**
   ```swift
   #Preview {
       ContentView()
   }
   ```
   - Muestra una vista previa de `ContentView` en Xcode.
