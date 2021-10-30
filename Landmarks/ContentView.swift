//
//  ContentView.swift
//  Landmarks
//
//  Created by 김우성 on 2021/10/29.
//

import SwiftUI

// View 프로토콜을 준수하고 View의 내용과 레이아웃을 설명
struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .ignoresSafeArea(edges: .top) // 화면의 맨 위쪽 엣지까지 맵 컨텐츠를 확장하는 것을 허가
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                    //.foregroundColor(.green)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            .padding()
            
            Spacer()
        }
    }
}

// View에 대한 미리보기를 선언
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
