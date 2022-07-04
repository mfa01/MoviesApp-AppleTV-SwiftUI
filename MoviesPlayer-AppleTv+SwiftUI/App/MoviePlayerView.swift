//
//  MoviePlayerView.swift
//  MoviesPlayer-AppleTv+SwiftUI
//
//  Created by Mabed on 03/07/2022.
//

import SwiftUI
import AVKit
struct MoviePlayerView: View {

    @Environment(\.presentationMode) private var presentationMode
    var movie: MovieModel?
    var body: some View {
        ZStack {
            VideoPlayer(player: AVPlayer(url:  URL(string: movie?.moviePath ?? "")!))    

        }
    }
}

struct MoviePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MoviePlayerView()
    }
}
