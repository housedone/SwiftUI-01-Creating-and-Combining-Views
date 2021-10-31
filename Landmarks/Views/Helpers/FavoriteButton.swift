//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by 김우성 on 2021/10/31.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool // @Binding : 값에 대한 스토리지를 제어하므로 데이터를 읽거나 작성해야 하는 다른 View로 전달할 수 있다.
    
    var body: some View {
        Button(action: {
            isSet.toggle()
        }) {
            Image(systemName: isSet ? "star.fill" : "star")
                .foregroundColor(isSet ? Color.yellow : Color.gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
