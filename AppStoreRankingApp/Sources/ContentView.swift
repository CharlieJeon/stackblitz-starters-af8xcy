import SwiftUI

struct AppResult: Codable, Identifiable {
    let id: String
    let name: String
    let artistName: String
    let url: String
}

struct Feed: Codable {
    let results: [AppResult]
}

struct AppResponse: Codable {
    let feed: Feed
}

struct ContentView: View {
    @State private var apps: [AppResult] = []

    var body: some View {
        NavigationView {
            List(apps) { app in
                VStack(alignment: .leading) {
                    Text(app.name).font(.headline)
                    Text(app.artistName).font(.subheadline)
                }
                .onTapGesture {
                    if let url = URL(string: app.url) {
                        UIApplication.shared.open(url)
                    }
                }
            }
            .navigationTitle("Top Apps")
            .onAppear(perform: fetchData)
        }
    }

    func fetchData() {
        guard let url = URL(string: "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/10/apps.json") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                if let decoded = try? JSONDecoder().decode(AppResponse.self, from: data) {
                    DispatchQueue.main.async {
                        self.apps = decoded.feed.results
                    }
                }
            }
        }
        task.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
