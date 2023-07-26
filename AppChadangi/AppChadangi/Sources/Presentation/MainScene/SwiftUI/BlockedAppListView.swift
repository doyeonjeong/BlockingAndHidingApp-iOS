//
//  BlockedAppListView.swift
//  AppChadangi
//
//  Created by DOYEON JEONG on 2023/07/26.
//

import SwiftUI

struct BlockedAppListView: View {
    var body: some View {
        ZStack {
            Color(.init(red: 0.27, green: 0.27, blue: 0.27, alpha: 0.2))
            
            VStack {
                Text("차단 앱 목록")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 26, alignment: .leading)
                    .padding(12)
                
                Spacer()
                
                Text("아직 앱을 선택하지 않았습니다.\n앱을 선택하고 차단해보세요.")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                
                Spacer()
                
                Button {
                    print("button pressed")
                } label: {
                    Text("앱 선택하기")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 45)
                        .background(Color(.init(red: 0.33, green: 0.13, blue: 0.04, alpha: 1.00)))
                        .cornerRadius(8)
                }
                .padding(12)
            }
        }
        .cornerRadius(16)
        
    }
}

struct BlockedAppListView_Previews: PreviewProvider {
    static var previews: some View {
        BlockedAppListView()
    }
}
