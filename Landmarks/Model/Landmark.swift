//
//  Landmark.swift
//  Landmarks
//
//  Created by 김우성 on 2021/10/30.
//

import Foundation
import SwiftUI
import CoreLocation

// Codable 적합성을 추가하면 구조체와 데이터 파일 간에 데이터를 더 쉽게 이동할 수 있다.
// Codable 프로토콜의 Decodable 컴포넌트에 의존하여 파일에서 데이터를 읽을 수 있다.
// Identifiable 프로토콜 추가
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    
    // private으로 만드는 이유는 Landmark 구조체의 사용자들은 이미지 자체에만 관심이 있고 자세한 구현은 신경쓰지 않기 때문이다.
    // 그러므로 외부에서 다른 것에 접근을 하지 못하게 막는다.
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    
    // json 데이터 구조체의 저장소를 반영하는 중첩 Coordinates(좌표) 유형을 사용해 구조체에 좌표 속성을 추가한다.
    // 다음 단계에서 public 계산된 속성을 만드는 데만 사용할 것이기 때문에 이 속성을 private으로 표시한다.
    private var coordinates: Coordinates
    // MapKit 프레임워크와 상호 작용하는 데 유용한 locationCoordinate 속성을 산출한다.
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    struct Coordinates: Hashable, Codable {
        // 위도
        var latitude: Double
        // 경도
        var longitude: Double
    }
}
