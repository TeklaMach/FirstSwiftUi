//
//  File.swift
//  FirstSwiftUI
//
//  Created by Tekla Matcharashvili on 07.12.23.
//

import SwiftUI

struct UserProfile {
    var email: String
    var password: String
    var dateOfBirth: String
    var country: String
    
    init(email: String, password: String, dateOfBirth: String, country: String) {
        self.email = email
        self.password = password
        self.dateOfBirth = dateOfBirth
        self.country = country
    }
}

struct EditProfileView: View {
    @Binding var profile: ChatItem
    
    @State private var editedName: String
    @State private var userProfile: UserProfile
    
    init(profile: Binding<ChatItem>) {
        _profile = profile
        _editedName = State(initialValue: profile.wrappedValue.name)
        _userProfile = State(initialValue: UserProfile(email: "", password: "", dateOfBirth: "", country: ""))
    }
    
    var body: some View {
        VStack {
            Image($profile.wrappedValue.imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding()
            
            TextField("Name", text: $editedName)
            applyCustomTextFieldStyle()
            
            TextField("Email", text: $userProfile.email)
            applyCustomTextFieldStyle()
            
            TextField("Password", text: $userProfile.password)
            applyCustomTextFieldStyle()
            
            TextField("Date of Birth", text: $userProfile.dateOfBirth)
            applyCustomTextFieldStyle()
            
            TextField("Country/Region", text: $userProfile.country)
            applyCustomTextFieldStyle()
            
            Spacer()
            
            Button("Save Changes") {
                updateProfile()
            }
            .padding()
            applyCustomButtonStyle()
        }
        .navigationTitle("Edit Profile")
        .padding()
        
    }
    
    private func updateProfile() {
        
        profile.name = editedName
        _ = userProfile.email
        _ = userProfile.password
        _ = userProfile.dateOfBirth
        _ = userProfile.country
        
    }
}
extension View {
    func applyCustomTextFieldStyle() -> some View {
        self
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal)
    }
    
    func applyCustomButtonStyle() -> some View {
        self
            .padding()
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(10)
    }
}
