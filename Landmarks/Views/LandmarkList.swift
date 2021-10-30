//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 김우성 on 2021/10/30.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            // List는 identifiable(식별 가능한) 데이터로 작동한다. 데이터를 식별하는 두 가지 방법이 있다.
            // 1. 데이터와 함께 각 요소를 고유하게 식별하는 속성의 키 경로를 전달한다.
            // 2. 데이터 유형이 식별 가능한 프로토콜을 준수하도록 한다.
            List(landmarks) { landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone 13 Pro Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
