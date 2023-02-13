//
//  UserProfile.swift
//  LittleLemon
//
//  Created by Celso Lopez Martinez on 2/11/23.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    let firstName:String = UserDefaults.standard.string(forKey:kFirstName) ?? ""
    let lastName:String = UserDefaults.standard.string(forKey:kLastName) ?? ""
    let email:String = UserDefaults.standard.string(forKey:kemail) ?? ""
    var body: some View {
        
        NavigationView{
        
        VStack{
            
            Text("Personal Information")
                .font(.system(size: 30))
                .bold()
            Image("Profile")
                .resizable()
                .scaledToFit()
            Text("\(firstName)")
                .padding()
            Text("\(lastName)")
                .padding()
            Text("\(email)")
                .padding()
           
            NavigationLink(destination: {Onboarding()},
                           label: {Text("Log out")
                            .padding(10)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal)
                            .background(CustomColors.primaryTwo)
                            .foregroundColor(CustomColors.primaryOne)
                            .cornerRadius(10)
                .padding()})
                .isDetailLink(false)
                .navigationBarBackButtonHidden(true)
                .simultaneousGesture(TapGesture().onEnded{
                    UserDefaults.standard.set(false, forKey: kIsLoggedIn)})
            
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading){
                Button {
                    self.presentation.wrappedValue.dismiss()
                } label: {
                    ZStack{
                        Circle().fill(CustomColors.primaryOne)
                            .frame(width:50, height: 50)
                            .padding()
                        Image(systemName: "arrow.left")
                            .foregroundColor(CustomColors.secondaryThree)
                            
                    }
                    
                }

                
            }
            
            ToolbarItem(placement: .principal){
                Image("Logo")
                    .foregroundColor(Color.white)
                    .padding()
            }
        }
        }
        
    }
        .navigationBarHidden(true)
    }
}


struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
