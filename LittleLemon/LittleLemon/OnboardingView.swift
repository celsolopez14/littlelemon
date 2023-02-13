//
//  OnboardingView.swift
//  LittleLemon
//
//  Created by Celso Lopez Martinez on 2/12/23.
//

import SwiftUI




struct OnboardingView: View {
    @State var searchText:String = ""
    @State var filterText:String = ""

    var body: some View {
        NavigationView{
            VStack{
                ScrollView{
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                       filterText = ""
                    } label: {
                        Text("Menu")
                            .bold()
                            .padding(10)
                    }
                    .background(CustomColors.secondaryThree)
                    .foregroundColor(CustomColors.primaryOne)
                    .cornerRadius(10)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                       filterText = "starters"
                    } label: {
                        Text("Starters")
                            .bold()
                            .padding(10)
                    }
                    .background(CustomColors.secondaryThree)
                    .foregroundColor(CustomColors.primaryOne)
                    .cornerRadius(10)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                       filterText = "mains"
                    } label: {
                        Text("Mains")
                            .bold()
                            .padding(10)
                    }
                    .background(CustomColors.secondaryThree)
                    .foregroundColor(CustomColors.primaryOne)
                    .cornerRadius(10)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                       filterText = "desserts"
                    } label: {
                        Text("Desserts")
                            .bold()
                            .padding(10)
                    }
                    .background(CustomColors.secondaryThree)
                    .foregroundColor(CustomColors.primaryOne)
                    .cornerRadius(10)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                       filterText = "drinks"
                    } label: {
                        Text("Drinks")
                            .bold()
                            .padding(10)
                    }
                    .background(CustomColors.secondaryThree)
                    .foregroundColor(CustomColors.primaryOne)
                    .cornerRadius(10)
                }
            }
        }
}
}
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
