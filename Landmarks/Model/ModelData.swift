//
//  ModelData.swift
//  Landmarks
//
//  Created by 김우성 on 2021/10/30.
//

import Foundation
import Combine

// SwiftUI는 관찰 가능한 오브젝트를 구독하고 데이터가 변경될 때 새로 고쳐야 하는 모든 뷰를 업데이트한다.
final class ModelData: ObservableObject {
    // landmarkData.json에서 초기화한 랜드마크 배열
    // 관찰 가능한 오브젝트는 구독자가 변경 사항을 픽업할 수 있도록 데이터에 대한 변경 사항을 @Published 해야 한다.
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    
    var hikes: [Hike] = load("hikeData.json")
}


// 앱의 기본 번들에서 주어진 파일명으로 json 데이터를 가져오는 load(_:) 메서드 생성
// load 메서드는 Codable 프로토콜의 구성 요소 중 하나인 Decodable 프로토콜에 대한 리턴 타입의 적합성에 의존한다.
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) in main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
