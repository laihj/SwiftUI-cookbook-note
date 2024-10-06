////
////  Rdetact.swift
////  cookbook
////
////  Created by laihj on 2024/1/9.
////
//
//import SwiftUI
//
//struct Rdetact: View {
//    var body: some View {
//        HStack {
//            RepoView(repo: .mock)
//            Divider()
//            RepoView(repo: .mock)
//                .redacted(reason: .placeholder)
//        }
//    }
//}
//
//struct Repo: Hashable, Decodable {
//    let name: String
//    let description: String
//    let stars: Int
//}
//
//struct RepoView: View {
//    let repo: Repo
//
//    var body: some View {
//        HStack {
//            VStack(alignment: .center) {
//                Image(systemName: "star.fill")
//                    .resizable()
//                    .frame(width: 44, height: 44)
//                Text(String(repo.stars))
//                    .font(.title)
//            }.foregroundColor(.red)
//
//            VStack(alignment: .leading) {
//                Text(repo.name)
//                    .font(.headline)
//                Text(repo.description)
//                    .foregroundColor(.secondary)
//            }
//        }
//    }
//}
//
//extension Repo {
//    static let mock = Repo(
//        name: "SwiftUICharts",
//        description: "A simple line and bar charting library that support accessibility written using SwiftUI. ",
//        stars: 579
//    )
//}
//
//final class Store: ObservableObject {
//    @Published private(set) var repos: [Repo]
//    @Published private(set) var isLoading = false
//
//    private let service: GithubService
//    init(
//        service: GithubService,
//        initialState: [Repo] = Array(repeating: .mock, count: 5)
//    ) {
//        self.repos = initialState
//        self.service = service
//    }
//
//    func fetch() {
//        isLoading = true
//        service
//            .fetchRepos(matching: "SwiftUI")
//            .replaceError(with: [])
//            .receive(on: DispatchQueue.main)
//            .handleEvents(receiveCompletion: { [weak self] _ in self?.isLoading = false})
//            .assign(to: &$repos)
//    }
//}
//
//#Preview {
//    Rdetact()
//}
