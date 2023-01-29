//
//  ContentView.swift
//  BasicLesson
//
//  Created by yohei shimizu on 2023/01/28.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 120)
            .opacity(0.5)
    }
}

struct ContentView: View {
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    
    
    var body: some View {
        // MARK: - 1. スケール修正。scaleが大きいほど縮小される
//        AsyncImage(url: URL(string: imageURL), scale: 3.0)
        
        // MARK: - 2. プレースホルダー
        AsyncImage(url: URL(string: imageURL)) { image in
            image.imageModifier()
        } placeholder: {
            Image(systemName: "photo.circle.fill").iconModifier()
        }
        .padding(40)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
