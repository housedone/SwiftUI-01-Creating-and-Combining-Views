//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 김우성 on 2021/10/30.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData // modelData 프로퍼티는 environmentObject(_:) 수정자가 부모에게 적용된 한, 자동으로 값을 얻는다.
    @State private var showFavoritesOnly = false // @State는 시간이 지남에 따라 바뀔 수 있는 값 또는 값들이며, View의 행동, 컨텐츠 또는 레이아웃에 영향을 미친다. View에 상태를 추가하기 위해 이 속성을 사용한다.
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            // List는 identifiable(식별 가능한) 데이터로 작동한다. 데이터를 식별하는 두 가지 방법이 있다.
            // 1. 데이터와 함께 각 요소를 고유하게 식별하는 속성의 키 경로를 전달한다.
            // 2. 데이터 유형이 식별 가능한 프로토콜을 준수하도록 한다.
            List {
                Toggle(isOn: $showFavoritesOnly) { // $ 접두사를 사용해 상태 변수 또는 속성에 대한 바인딩에 액세스한다.
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
        
//        ForEach(["iPhone SE (2nd generation)", "iPhone 13 Pro Max"], id: \.self) { deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
    }
}
