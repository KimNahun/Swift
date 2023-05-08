//
//  ContentView.swift
//  appUI
//
//  Created by 김나훈 on 2023/04/27.
//

import SwiftUI

struct ContentView: View {
    @State private var word = ""
    @State private var showingContentView = false
    @State private var showingSelectView = false
    var body: some View {
        
        NavigationView{
            VStack{
                HStack {
                    Button(action : {
                        showingSelectView=true
                    }) {
                        Image(systemName:"line.3.horizontal")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 20)
                    }.padding(30).fullScreenCover(isPresented: $showingSelectView, content: {
                        SelectView()
                    })
                    
                    Spacer()
                    HStack {
                       Text("검색: ")
                        TextField("",text: $word,onCommit: {
                                searchWord = word
                              
                           }).frame(width: 70)
                        
                        Button(action: {
                            searchWord = word
                            searchingWord = true
                            showingContentView = true
                        }) {
                            Image(systemName:"pencil.line")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                        }
                        .fullScreenCover(isPresented: $showingContentView, content: {
                          
                         
                            ContentView()
                        })
                        
                    }
                }
                
              
                ScrollView{
                    
                    ForEach(0..<myArray.count) { index in
                        HStack{
                            NoticeItem(num: index)
                        }
                    }
                    
                }
                
                
                
                ButtonItem()
                
            }

            
        }
        
    }
}

struct ButtonItem: View {
    @State var bookMark: Bool = false
    @State private var showingContentView = false
    @State private var showingSearchView = false
    @State private var showingConvenienceView = false
    var body: some View {
        HStack {
            
            Button(action: {
             
                showingSearchView = true
            }) {
                Image(systemName:"magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
            }
            .fullScreenCover(isPresented: $showingSearchView, content: {
           
                SearchView()
            })
            .padding(20)
            
            
            Button(action: {
                showingContentView = true
                searchingWord=false
            }) {
                Image(systemName:"house")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
            }
            .fullScreenCover(isPresented: $showingContentView, content: {
                ContentView()
            })
            .padding(20)
            
            Button(action: {
                showingConvenienceView = true
            }) {
                Image(systemName:"line.3.horizontal")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
            }
            .fullScreenCover(isPresented: $showingConvenienceView, content: {
                ConvenienceView()
            })
            .padding(20)
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
