//
//  LandmarkRow.swift
//  Landmarks
//
//  LandmarkList의 한 줄을 구현한 구조체
//
//  Created by 김우성 on 2021/10/30.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        // LandmarkRow 초기화 시에 landmark 매개변수를 추가한다. 그리고 landmarks 배열의 요소를 지정한다.
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
    
}
