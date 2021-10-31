//
//  MapView.swift
//  Landmarks
//
//  Created by 김우성 on 2021/10/30.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    // @State 속성을 사용하면 두개 이상의 View에서 수정을 할 수 있는 앱의 데이터에 대한 source of truth를 설정할 수 있다. SwiftUI는 기본 스토리지를 관리하고 값에 따라 View를 자동으로 업데이트한다.
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region) // 상태 변수에 $를 붙이면, 기본 값에 대한 참조와 같은 바인딩을 전달한다. 사용자가 지도와 상호 작용할 때, 지도는 현재 사용자 인터페이스에 보이는 지도의 일부와 일치하도록 지역 값을 업데이트한다.
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.116_868))
    }
}
