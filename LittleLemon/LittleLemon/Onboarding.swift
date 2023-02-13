//
//  Onboarding.swift
//  LittleLemon
//
//  Created by Celso Lopez Martinez on 2/11/23.
//

let kFirstName = "first name key"
let kLastName = "last name key"
let kemail = "email key"
let kIsLoggedIn = "kIsLoggedIn"
let allInputsAlert = Alert(title: Text("The following information is missing"),message: Text("First Name \n Last Name \n Email"))

import SwiftUI

struct Onboarding: View {
    @State var firstName:String=""
    @State var lastName:String=""
    @State var email:String=""
    @State var emptyInput:String=""
    @State var showAlerts:Bool=false
    @State var isLoggedIn:Bool=false
    var body: some View {
        NavigationView{
            
            VStack{
                NavigationLink(isActive: $isLoggedIn, destination: {Home()}, label: {})
                    .isDetailLink(false)
                    .navigationBarBackButtonHidden(true)
                ScrollView{
                    
                    HeroHeading()
                    
                    
                    VStack{
                        Text("First Name*")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(CustomColors.secondaryFour)
                            .padding()
                            .offset(y:10)
                        
                        
                        TextField("First name", text: $firstName)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(CustomColors.secondaryFour))
                            .padding()
                            .offset(y:-10)
                        
                        Text("Last Name*")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(CustomColors.secondaryFour)
                            .padding()
                            .offset(y:-20)
                        
                        
                        TextField("Last name", text: $lastName)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(CustomColors.secondaryFour))
                            .padding()
                            .offset(y:-40)
                        
                        
                        Text("Email*")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(CustomColors.secondaryFour)
                            .padding()
                            .offset(y:-50)
                        
                        TextField("Email", text: $email)
                            .padding()
                            .textInputAutocapitalization(.never)
                            .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(CustomColors.secondaryFour))
                            .padding()
                            .offset(y:-70)
                    }
                    .frame(maxHeight:.infinity, alignment: .top)
                    
                    Button(action:{
                        
                        if((firstName.isEmpty || lastName.isEmpty || email.isEmpty) || !isValidEmail(email)){
                            emptyInput=""
                            if(firstName.isEmpty){
                                emptyInput.append("First Name\n")
                            }
                            if(lastName.isEmpty){
                                emptyInput.append("Last Name\n")
                            }
                            if(email.isEmpty || !isValidEmail(email)){
                                emptyInput.append("Email\n")
                            }
                            if(!showAlerts){showAlerts.toggle()}
                            
                        } else{
                            UserDefaults.standard.set(email, forKey: kemail)
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            isLoggedIn=true
                            UserDefaults.standard.set(isLoggedIn, forKey: kIsLoggedIn)
                        }
                        
                    },label:{
                        Text("Register")
                            .padding(10)
                    })
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                        .background(CustomColors.primaryTwo)
                        .foregroundColor(CustomColors.primaryOne)
                        .cornerRadius(10)
                        .padding()
                        .offset(y:-60)
                        .alert(isPresented:$showAlerts){
                            Alert(title: Text("The following information is missing"),message: Text("\(emptyInput)"))
                        }
                    
                    
               
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal){
                    Image("Logo")
                        .foregroundColor(Color.white)
                }
            }
            .onAppear {
                if(UserDefaults.standard.bool(forKey: kIsLoggedIn)){
                    isLoggedIn=true
                } else {
                    isLoggedIn=false
                }
            }
        }
        .navigationBarHidden(true)
    }
}


func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "(?:[a-zA-Z0-9!#$%\\&‘*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}" +
    "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
    "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-" +
    "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5" +
    "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
    "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
    "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
    let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
    return emailTest.evaluate(with: email)
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

