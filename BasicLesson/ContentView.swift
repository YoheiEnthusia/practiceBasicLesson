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
        /*
        AsyncImage(url: URL(string: imageURL)) { image in
            image.imageModifier()
        } placeholder: {
            Image(systemName: "photo.circle.fill").iconModifier()
        }
        .padding(40)

        */
        
        // MARK: - フェーズを使用して、エラーハンドリング
        /*
        AsyncImage(url: URL(string: imageURL)) { phase in
            if let image = phase.image {
                image.imageModifier()
            } else if phase.error != nil {
                Image(systemName: "ant.circle.fill").iconModifier()
            } else {
                Image(systemName: "photo.circle.fill").iconModifier()
            }
        }.padding(40)
        */
        
        // MARK: - アニメーションを追加
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
            switch phase {
            case .success(let image) :
                image
                    .imageModifier()
                    .transition(.scale)
            case .failure(_) :
                Image(systemName: "ant.circle.fill").iconModifier()
            case .empty :
                Image(systemName: "photo.circle.fill").iconModifier()
            @unknown default:
                ProgressView()
            }
        }
        .padding(40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
