import SwiftUI
import NCMB

extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView: View {
    var body: some View {
        TabView {
            UploaderView()
                .tabItem {
                    VStack {
                        Image(systemName: "photo")
                        Text("Photo")
                    }
            }.tag(1)
            ImageView()
                .tabItem {
                    VStack {
                        Image(systemName: "rectangle.grid.2x2")
                        Text("Photos")
                    }
            }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
