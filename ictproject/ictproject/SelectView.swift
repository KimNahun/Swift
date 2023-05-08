//
//  SelectView.swift
//  appUI
//
//  Created by 김나훈 on 2023/05/01.
//

import SwiftUI
var temp = FireBaseViewController()


struct SelectView: View {
    @State private var num = 1
    @State private var showingContentView = false
    var body: some View {
          VStack {
              VStack(spacing:70){
                  Button("일반공지") {
                      tempTitle = tempTitle1
                      myArray=myArray1
                      print(myArray)
                      showingContentView=true
                      searchingWord=false
                  }.fullScreenCover(isPresented: $showingContentView, content: {
                      ContentView()
                  })
                  
                  Button("장학공지") {
                      tempTitle = tempTitle2
                      myArray=myArray2
                      print(myArray)
                      showingContentView=true
                      searchingWord=false
                  }.fullScreenCover(isPresented: $showingContentView, content: {
                      ContentView()
                  })
                  
                  Button("학사공지") {
                      tempTitle = tempTitle3
                      myArray=myArray3
                      print(myArray)
                      showingContentView=true
                      searchingWord=false
                  }.fullScreenCover(isPresented: $showingContentView, content: {
                      ContentView()
                  })
                  
                  Button("채용공지") {
                      temp.readFireBaseData1()
                      temp.readFireBaseData2()
                      temp.readFireBaseData3()
                      selectNoticeType=num
               //       tempTitle = tempTitle3
                      showingContentView=true
                      searchingWord=false
                  }.fullScreenCover(isPresented: $showingContentView, content: {
                      ContentView()
                  })
                  
              }
              Spacer()
              ButtonItem()
              
          }
      }
}



struct SelectView_Previews: PreviewProvider {
    static var previews: some View {
        SelectView()
    }
}
