//
//  BlockedAppListView.swift
//  AppChadangi
//
//  Created by DOYEON JEONG on 2023/07/26.
//

import SwiftUI
import FamilyControls

struct BlockedAppListView: View {
    
    @EnvironmentObject var bm: BlockManager
    @State var isPresented = false
    
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
                    isPresented.toggle()
                } label: {
                    Text("앱 선택하기")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 45)
                        .background(Color(.init(red: 0.33, green: 0.13, blue: 0.04, alpha: 1.00)))
                        .cornerRadius(8)
                }
                .padding(12)
                .familyActivityPicker(headerText: "App Version 1.0.0 : 최대 5개까지 선택할 수 있습니다.", isPresented: $isPresented, selection: $bm.newSelection)
            }
        }
        .cornerRadius(16)
        
        .onAppear {
            bm.requestAuthorization()
        }
        
    }
}

struct BlockedAppListView_Previews: PreviewProvider {
    static var previews: some View {
        BlockedAppListView()
    }
}
