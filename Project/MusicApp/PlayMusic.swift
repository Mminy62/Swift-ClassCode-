//
//  MusicDetail.swift
//  iOS-Music
//
//  Created by 김소혜 on 11/2/23.
//

import SwiftUI

struct PlayMusic: View {
   // @State private var position : BottomSheetPosition
    @StateObject var musicStore: MusicStore = MusicStore(musics: musicData)
    @Binding var selectedIdx: Int
    
    @Binding var PlayList : [MusicElement]
    
    
    var body: some View {
        ZStack{
            VStack{
                headerView
                musicImageView
                musicSlider
                musicController
                Spacer()
                    .scaleEffect(0)
            }
            .padding(.horizontal)
        }
        
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(Color.white.edgesIgnoringSafeArea(.bottom))
        .bottomDrawerView( // EdgesBottomDrawer
            bottomDrawerHeight: 80, /* Drawer height when closed*/
            drawerTopCornersRadius: 16 /*Top corners radius*/,
            ignoreTopSafeAres: false /* Ignore safe areas? */) {
                // Drawer content
                ZStack {
                    Color.gray.opacity(0.9)
                    NavigationView {
                        VStack{
                            List {
                                ForEach(0..<PlayList.count, id: \.self) { i in
                                    HStack{
                                        AsyncImage(url: URL(string: PlayList[i].image.first?.text ?? ""))
                                            .frame(width: 50, height: 50)
                                        VStack(alignment: .leading){
                                            Text(PlayList[i].name)
                                                .font(.headline)
                                                .foregroundStyle(.white)
                                            Text(PlayList[i].name)
                                                .font(.body)
                                                .foregroundStyle(.gray)
                                        }
                                    }
                                    .listRowBackground(Color.gray.opacity(0.9))
                                }
                                .onMove(perform: moveArtist)
                                .onDelete(perform: deleteArtist)
                            }
                            .scrollContentBackground(.hidden)
                            
                        }
                        .background(Color.gray.opacity(0.9))
                        .toolbar {
                            ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                                EditButton()
                            }
                        }
                    }
                    
                    
                }
                
            } pullUpView: { shouldGoUp in
                // Drawer pull up view
                ZStack {
                    Color.gray.opacity(0.9)
                    if shouldGoUp {
                        Image(systemName: "chevron.down")
                            .foregroundColor(Color.white)
                    } else {
                        Image(systemName: "chevron.up")
                            .foregroundColor(Color.white)
                    }
                }
            }
    }
    
    func moveArtist(from source: IndexSet, to destination: Int) {
        PlayList.move(fromOffsets: source, toOffset: destination)
    }
     
    func deleteArtist(at offsets: IndexSet) {
        PlayList.remove(atOffsets: offsets)
    }
}

extension PlayMusic{
    
    
    private var headerView: some View{
        HStack(spacing: 20){
            Image(systemName: "chevron.down")
                .resizable()
                .scaledToFit()
                .frame(height: 10)
            Spacer()
            Image(systemName: "dot.radiowaves.up.forward")
                .resizable()
                .scaledToFit()
                .frame(height: 20)
            Image(systemName: "magnifyingglass")
                .resizable()
                .scaledToFit()
                .frame(height: 20)
        }
        .frame(height: 20)
        .scaleEffect(1)
        .padding(.top,80)
        .padding(.bottom, 20)
        .padding(.horizontal, 12)
    }
    
    private var musicImageView: some View{
        VStack{
            AsyncImage(url: URL(string: musicStore.musics[selectedIdx].image.first?.text ?? "" ))
                .frame(width: 50, height: 50)
//            Image(musicStore.musics[selectedIdx].image)
//                .resizable()
                .scaledToFill()
                .frame(maxWidth:340, maxHeight: 340)
               // .padding()
                .clipShape(Rectangle())
                .cornerRadius(10)
                //.padding(.top, 10)
                .scaleEffect(1)
                //.padding(.horizontal,15)
                
            HStack{
                VStack{
                    Text("ETA")
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity,alignment: .leading)
                    Text("NewJeans")
                        .font(.system(size: 18))
                        .frame(maxWidth: .infinity,alignment: .leading)
                }
            }.padding(.vertical,24)
            .padding(.horizontal)
            
            HStack{
                Image(systemName: "hand.thumbsup")
                    .resizable()
                    .scaledToFit()
                    .frame(width:20,height: 20)
                    .scaleEffect(1)
                Image(systemName: "hand.thumbsdown")
                    .resizable()
                    .scaledToFit()
                    .frame(width:20,height: 20)
                    .scaleEffect(1)
                Spacer()
            }.padding()
            
            HStack{
                Image(systemName: "shuffle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 22)
                Spacer()
                Image(systemName: "backward.end.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 24)
                Spacer()
                Image(systemName: "play.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                Spacer()
                Image(systemName: "forward.end.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 24)
                Spacer()
                Image(systemName: "repeat")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 22)
                
            }.padding()
        }
        //.padding()
        
    }
    private var musicSlider: some View{
        ZStack{
            HStack{
                Text("00:00")
                Spacer()
                Text("00:00")
            }
            .scaleEffect(0)
            .font(.system(size: 16))
            .fontWeight(.semibold)
            
        }
        .padding(.top, 14)
        .padding(.horizontal, 0)
    }
    private var musicController:some View{
        VStack{
            HStack{
                
                
            }
        }
    }
    private var bottomDrawer:some View{
        ZStack{
//            BottomSheet()
        }
    }
    
}

#Preview {
    PlayMusic(selectedIdx: .constant(1), PlayList: .constant([]) )
}
