import SwiftUI

@main
struct InputBarApp: App {
        var body: some Scene {
                WindowGroup {
                        ContentView()
                }
        }
}

private struct ContentView: View {

        @State private var text: String = ""

        var body: some View {
                TextField("", text: $text)
                        .autocorrectionDisabled(true)
                        .textFieldStyle(.plain)
                        .font(.title3)
                        .padding()
                        .background(VisualEffect())
                        .cornerRadius(12)
                        .background(TransparentWindow())
        }
}

private struct VisualEffect: NSViewRepresentable {
        func makeNSView(context: Self.Context) -> NSView {
                let view = NSVisualEffectView()
                view.material = .hudWindow
                view.blendingMode = .behindWindow
                view.state = .active
                return view
        }
        func updateNSView(_ nsView: NSView, context: Context) { }
}

private final class NSTransparentWindowView: NSView {
        override func viewDidMoveToWindow() {
                window?.backgroundColor = .clear
                super.viewDidMoveToWindow()
        }
}
private struct TransparentWindow: NSViewRepresentable {
        func makeNSView(context: Context) -> NSView {
                return NSTransparentWindowView()
        }
        func updateNSView(_ nsView: NSView, context: Context) { }
}
