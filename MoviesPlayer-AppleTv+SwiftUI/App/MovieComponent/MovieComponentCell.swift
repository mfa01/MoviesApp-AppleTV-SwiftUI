//
//  MovieComponentCell.swift
//  MoviesPlayer-AppleTv+SwiftUI
//
//  Created by Mabed on 02/07/2022.
//

import SwiftUI
import Kingfisher

struct MovieComponentCell: View {
    @Environment(\.isFocused) var isFocused
    
    var imagePath: String?
    
    let size = CGSize(width: 160, height: 260)

    var body: some View {
        ZStack {
            KFImage(URL(string: imagePath ?? ""))
                .placeholder {
                    Image("placeholderImage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .background(.white)
                }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
                .padding(EdgeInsets(top: 12, leading: 10, bottom: 12, trailing: 10))
            
        }
        .cornerRadius(10)
        .scaleEffect(isFocused ? 1.1 : 1)
        .animation(.easeInOut, value: isFocused)
        .frame(width: size.width, height: size.height, alignment: .center)

    }
}

struct MovieComponentCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieComponentCell()
    }
}
