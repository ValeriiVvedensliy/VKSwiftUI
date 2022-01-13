//
//  LoginView.swift
//  Vk
//
//  Created by Valera Vvedenskiy on 13.01.2022.
//

import SwiftUI

struct LoginView: View {
  @State private var login: String = ""
  @State private var password: String = ""
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
              
            })
              .foregroundColor(.white)
              .font(.title)
          }
        }
        .padding(55)
      }
      .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
