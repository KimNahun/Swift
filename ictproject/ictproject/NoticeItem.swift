//
//  NoticeItem.swift
//  appUI
//
//  Created by 김나훈 on 2023/04/27.
//

import SwiftUI

struct NoticeItem: View {
    var num: Int
    var body: some View {
        VStack {
            if(searchingWord){
                if(myArray[num][0].contains(searchWord)){
                    VStack(spacing:0){
                        Text(String(myArray[num][0])).lineLimit(nil)
                        Text(String(myArray[num][1])).lineLimit(nil)
                        Text(String(myArray[num][2])).lineLimit(nil)
                        Text(String(myArray[num][3])).lineLimit(nil)
                        Text(String(myArray[num][4])).lineLimit(nil)

                    } .frame(width: 350, height: 160).border(Color.black, width: 1)
                    
                }
                
            }
            else{
                VStack(spacing:0){
                    Text(String(myArray[num][0])).lineLimit(nil)
                    Text(String(myArray[num][1])).lineLimit(nil)
                    Text(String(myArray[num][2])).lineLimit(nil)
                    Text(String(myArray[num][3])).lineLimit(nil)
                    Text(String(myArray[num][4])).lineLimit(nil)
                    
                } .frame(width: 350, height: 160).border(Color.black, width: 1)
                   
            }
            
        }
    }
}
