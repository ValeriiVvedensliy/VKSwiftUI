//
//  LoginView.swift
//  Vk
//
//  Created by Valera Vvedenskiy on 13.01.2022.
//

import SwiftUI

struct LoginView: View {
  @CodingStyle(typeStyle: .camelCase) private var login: String = ""
  @State private var password: String = ""
  @State private var isWrongPasswordModalShown = false
  @Binding var isAuthorized: Bool

  var body: some View {
    ZStack {
      Image("background_image")
        .resizable()
      
      ScrollView(.vertical) {
        VStack {
          Image("vk_image")
            .resizable()
            .frame(width: 100, height: 100, alignment: .center)
            .aspectRatio(contentMode: .fit)
            .padding(.bottom, 32.0)
          
          HStack {
            Text("Login:")
            Spacer()
            TextField("Enter Login", text: $login)
              .frame(maxWidth: 160)
              .textFieldStyle(.roundedBorder)
          }
          
          HStack {
            Text("Password:")
            Spacer()
            SecureField("Enter Password", text: $password)
              .frame(maxWidth: 160)
              .textFieldStyle(.roundedBorder)
          }
          Spacer(minLength: 50)
          
          Button("Sign In", action: {
            let areCredentialsRight = checkPassword(login: login, password: password)
            isWrongPasswordModalShown = !areCredentialsRight
            isAuthorized = areCredentialsRight
          })
            .foregroundColor(.white)
            .font(.title)
        }
      }
      .padding(55)
      .alert(isPresented: $isWrongPasswordModalShown) {
        Alert(
          title: Text("Error"),
          message: Text("Wrong Credentials"),
          dismissButton: .default(Text("Ok"), action: clearAll))
      }
    }
    .ignoresSafeArea()
    .alert(isPresented: $isWrongPasswordModalShown) {
      Alert(
        title: Text("Error"),
        message: Text("Wrong Credentials"),
        dismissButton: .default(Text("Ok"), action: clearAll))
    }
}
  
  private func checkPassword(login: String, password: String) -> Bool {
      return login == "Admin" && password == "12345"
  }

  private func clearAll() {
    login = ""
    password = ""
  }
}
