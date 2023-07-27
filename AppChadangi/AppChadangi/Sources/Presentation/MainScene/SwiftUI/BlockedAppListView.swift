//
//  BlockedAppListView.swift
//  AppChadangi
//
//  Created by DOYEON JEONG on 2023/07/26.
//

import SwiftUI
import FamilyControls
import DeviceActivity

struct BlockedAppListView: View {
    
    @EnvironmentObject var bm: BlockManager
    @State var isPresented = false
    @State var selection = FamilyActivitySelection()
    
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
                
                if bm.isEmpty {
                    Text("아직 앱을 선택하지 않았습니다.\n앱을 선택하고 차단해보세요.")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                } else {
                    ZStack {
                        Color.clear
                        
                        ScrollView {
                            LazyVStack(alignment: .leading) {
                                ForEach(Array(selection.applicationTokens), id: \.self) { selected in
                                    Label(selected)
                                        .padding(.horizontal, 20)
                                        .padding(.bottom, 8)
                                }
                            }
                        }
                    }
                }
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
                .familyActivityPicker(isPresented: $isPresented, selection: $bm.newSelection)
                .onChange(of: bm.newSelection) { newValue in
                    selection = newValue
                }
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

