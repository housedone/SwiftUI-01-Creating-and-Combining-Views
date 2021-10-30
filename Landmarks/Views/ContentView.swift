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
        LandmarkList()
    }
}

// View에 대한 미리보기를 선언
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
