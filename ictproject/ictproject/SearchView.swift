//
//  SearchView.swift
//  appUI
//
//  Created by 김나훈 on 2023/04/27.
//

import SwiftUI
import Firebase

struct SearchView: View {
    @State private var word = ""
    @State private var num = 0
    @State private var temp = keywords
    var body: some View {
        VStack {
            Text("등록된 키워드").font(.system(size: 30))
            TextField("입력", text: $word)
                .frame(width: 200, height: 40)
                .padding(.horizontal, 20)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            Button(action: {
                temp.append(word)
                keywords=temp
                Database.database().reference().child("유저정보").child("식별자").child(idfv!).child("등록된키워드").setValue(temp)
                
                
                word = ""
            }) {
                Text("추가하기")
                    .frame(width: 150, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.bottom, 20)
            
            List {
                ForEach(temp.indices, id: \.self) { index in
                    HStack {
                        Text("\(index + 1)")
                        Text(temp[index])
                        Spacer()
                        Button(action: {
                            let refKeyword = Database.database().reference().child("유저정보").child("식별자").child(idfv!).child("등록된키워드")
                               refKeyword.observeSingleEvent(of: .value) { snapshot in
                                guard var firebaseKeyword = snapshot.value as? [String] else { return }
                                temp.remove(at: index)
                                keywords=temp
                                refKeyword.setValue(temp)
                                print(temp)
                            }
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.red)
                        }
                    }
                }
                .onDelete(perform: deleteKeyword)
            }
            
            ButtonItem()
            
        }
    }
    
    func deleteKeyword(at offsets: IndexSet) {
        temp.remove(atOffsets: offsets)
    }
}




struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
