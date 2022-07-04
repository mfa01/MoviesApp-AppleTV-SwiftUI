//
//  CustomMovieComponentCell.swift
//  MoviesPlayer-AppleTv+SwiftUI
//
//  Created by Mabed on 02/07/2022.
//

import SwiftUI
import Kingfisher

struct CustomMovieComponentCell: View {
    @Environment(\.isFocused) var isFocused
    
    var imagePath: String?
    let size = CGSize(width: 260, height: 260)

    var body: some View {
       
        ZStack {
            Image(imagePath ?? "")
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
        .frame(width: isFocused ? size.width*3.3 : size.width, height: size.height, alignment: .center)
        .background(.white)
        .padding(EdgeInsets(top: 12, leading: 10, bottom: 12, trailing: 10))
        .cornerRadius(10)
        .scaleEffect(isFocused ? 1.1 : 1)
        .animation(.linear(duration: 0.4), value: isFocused)
        .clipped()
    }
}

struct CustomMovieComponentCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieComponentCell()
    }
}
