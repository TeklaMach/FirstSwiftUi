//
//  ContentView.swift
//  FirstSwiftUI
//
//  Created by Tekla Matcharashvili on 07.12.23.
//

import SwiftUI

struct ChatView: View {
    @State private var chatData: [ChatItem] = [
        ChatItem(imageName: "avatar1", name:"Francisco Miles", quote:"I went there yesterday", time: "18:14"),
        ChatItem(imageName: "avatar2", name: "Arlene Fisher", quote: "IDK what else is there to do", time: "22:31"),
        ChatItem(imageName: "avatar3", name: "Darlene Hawkins", quote: "No, I can't come tomorrow.", time: "09:18"),
        ChatItem(imageName: "avatar4", name: "Eduardo Mckinney", quote: "Go to hell", time: "Yesterday"),
        ChatItem(imageName: "avatar5", name: "Aubrey Cooper", quote: "I hope it goes well.", time: "Friday"),
        ChatItem(imageName: "avatar6", name: "Jorge Nguyen", quote: "So, what's your plan this weekend?", time: "Thursday"),
        ChatItem(imageName: "avatar7", name: "Cody Cooper", quote: "What's the progress on that task?", time: "Tuesday"),
        ChatItem(imageName: "avatar8", name: "Kristin Pena", quote: "Yeah! You're right.", time: "7/22/20"),
        ChatItem(imageName: "avatar9", name: "Brandie Watson", quote: "I went there yesterday", time: "8/19/20"),
        ChatItem(imageName: "avatar10",name: "Stella Henry", quote: "Martinique", time: "9/15/20"),
    ]
    var body: some View {
        NavigationView {
            VStack {
                List(chatData.indices, id: \.self) { index in
                    NavigationLink(destination: EditProfileView(profile: $chatData[index])) {
                        ChatCell(chatItem: chatData[index])
                    }
                }
                .navigationTitle("Chat")
                
                Button("Clear Data") {
                    chatData.removeAll()
                }
                .padding()
                .frame(width: 200, height: 50)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
            }
        }
    }
}

struct ChatCell: View {
    var chatItem: ChatItem
    
    var body: some View {
        HStack {
            Image(chatItem.imageName)
                .resizable()
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("\(chatItem.name)")
                    .font(.headline)
                
                Text(chatItem.quote)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text(chatItem.time)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(8)
    }
}

struct ChatItem: Identifiable {
    var id = UUID()
    var imageName: String
    var name: String
    var quote: String
    var time: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
