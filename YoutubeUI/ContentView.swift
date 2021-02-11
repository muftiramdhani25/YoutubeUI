//
//  ContentView.swift
//  YoutubeUI
//
//  Created by abdullah irianda on 01/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            TabView{
                Home()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Beranda")
                    }
                Home()
                    .tabItem {
                        Image(systemName: "paperplane.fill")
                        Text("Explore")
                    }
                Home()
                    .tabItem {
                        Image(systemName: "tray.fill")
                        Text("Subscription")
                    }
                Home()
                    .tabItem {
                        Image(systemName: "envelope.fill")
                        Text("Kotak Masuk")
                    }
                Home()
                    .tabItem {
                        Image(systemName: "play.rectangle.fill")
                        Text("Koleksi")
                    }
            }.accentColor(Color.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    var body: some View{
        NavigationView{
            Content()
                .navigationBarItems(
                    leading:
                        HStack{
                            Button(action: {print("Hello Button")}){
                                Image("youtube_logo")
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 90, height: 20)
                            }
                        },
                    trailing:
                        HStack(spacing: 20){
                            Button(action: {print("Hello Button")}){
                                Image(systemName: "tray")
                                    .foregroundColor(Color.black)
                            }
                            
                            Button(action: {print("Hello Button")}){
                                Image(systemName: "video.fill")
                                    .foregroundColor(Color.black)
                            }
                            
                            Button(action: {print("Hello Button")}){
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(Color.black)
                            }
                            
                            Button(action: {print("Hello Button")}){
                                Image("profile")
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .clipShape(Circle())
                            }
                        }
                )
                .navigationBarTitle("", displayMode: .inline)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Content: View {
    var body: some View{
        List{
            
            ComponentContent(imageContent: "kokbisa_bola", profileContent: "kok_bisa", title: "Kenapa sepak bola yang paling popular?", description: "ini adalah deskripsi video kita - 300x ditonton - 9 jam yang lalu", duration: "15:00")
            
            ComponentContent(imageContent: "kokbisa_kesehatan", profileContent: "kok_bisa", title: "Apa itu ilmu kesehatan / kedokteran sebenarnya?", description: "ini adalah deskripsi video kita - 300x ditonton - 9 jam yang lalu", duration: "15:00")
            
            ComponentContent(imageContent: "kokbisa_kimia", profileContent: "kok_bisa", title: "Apa itu ilmu kimia? apa pentingnya untuk hidup kita?", description: "ini adalah deskripsi video kita - 300x ditonton - 9 jam yang lalu", duration: "15:00")
        }
    }
}

// Component untuk cell
struct ComponentContent: View {
    
    var imageContent : String
    var profileContent : String
    var title: String
    var description: String
    var duration: String
    
    var body: some View{
        VStack{
            ZStack(alignment: .bottomTrailing){
                Image(imageContent)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                Text(duration)
                    .padding(.all, 5)
                    .foregroundColor(Color.white)
                    .font(.caption)
                    .background(Color.black)
                    .cornerRadius(5)
                    .padding(.trailing, 5)
                    .padding(.bottom, 5)
            }
            
            HStack(spacing:20){
                Image(profileContent)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                VStack(alignment: .leading){
                    Text(title)
                        .font(.headline)
                    HStack{
                        Text(description)
                            .font(.caption)
                    }
                }
                Spacer()
                Image(systemName: "list.bullet")
            }
        }
    }
}
