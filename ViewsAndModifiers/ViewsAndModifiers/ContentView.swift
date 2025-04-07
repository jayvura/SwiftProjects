//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Jayden on 4/5/25.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        Color.blue
//            .frame(width: 300, height: 200)
//            .watermarked(with: "Hi my name is jayden")
//    }
//}
//
//struct CapsuleText: View {
//    var text: String
//    var body: some View {
//        Text(text)
//            .font(.largeTitle)
//            .padding()
//            .background(.blue)
//            .clipShape(.capsule)
//    }
//}
//
//struct Title: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .font(.largeTitle)
//            .foregroundStyle(.white)
//            .padding()
//            .background(.blue)
//            .clipShape(.rect(cornerRadius: 10))
//    }
//}
//
//extension View {
//    func titleStyle() -> some View {
//        modifier(Title())
//    }
//}
//
//struct Watermark: ViewModifier {
//    var text: String
//    
//    func body(content: Content) -> some View {
//        ZStack(alignment: .bottomTrailing) {
//            content
//            Text(text)
//                .font(.caption)
//                .foregroundStyle(.white)
//                .padding(5)
//                .background(.black)
//        }
//    }
//}
//
//extension View {
//    func watermarked(with text: String) -> some View {
//        modifier(Watermark(text: text))
//    }
//}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
        
    }
    
}

struct ContentView: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row), C\(col)")

            
        }
    }
}

#Preview {
    ContentView()
}
