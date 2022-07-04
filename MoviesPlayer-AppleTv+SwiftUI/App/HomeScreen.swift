//
//  HomeScreen.swift
//  MoviesPlayer-AppleTv+SwiftUI
//
//  Created by Mabed on 02/07/2022.
//

import SwiftUI

struct HomeScreen: View {
    
    @State var movies: [MovieModel] = []
    @State var customMovies: [MovieModel] = []

    @State private var isVideoPlayerPresented = false

    var body: some View {
        List {
            Section("Our newest movies") {
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 20) {
                        ForEach(movies) { movie in
                            Button(action: {
                                isVideoPlayerPresented.toggle()
                            }, label: {
                                MovieComponentCell(imagePath: movie.poster)
                            })
                            .foregroundColor(Color.clear)
                            .background(Color.clear)
                            .buttonStyle(PlainButtonStyle())
                            .fullScreenCover(isPresented: $isVideoPlayerPresented) {
                                MoviePlayerView(movie: movie)
                            }

                        }
                    }}
            }
            Section("Custom Movies") {
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(0..<10) { index in
                            ZStack {
                                CustomMovieComponentCell(imagePath: "movie\(index)")
                            }.focusable()
                        }
                    }}
            }
            Section("Classic Movies") {
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 20) {
                        ForEach(movies) { movie in
                            ZStack {
                                MovieComponentCell(imagePath: movie.poster)
                            }.focusable()
                        }
                    }}
            }
        }.onAppear {
            NetworkManager.shared.fetchMovies { movies in
                self.movies = movies
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}


