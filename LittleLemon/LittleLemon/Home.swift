//
//  Home.swift
//  LittleLemon
//
//  Created by Celso Lopez Martinez on 2/11/23.
//

import SwiftUI

struct Home: View {
    let persistence = PersistenceController.shared
    var body: some View {
        NavigationView {
            
            VStack{
                 Spacer()
                
                Menu()
                    .environment(\.managedObjectContext, persistence.container.viewContext)
                
                    .toolbar{
                        
                        ToolbarItem(placement: .principal){
                            Image("Logo")
                                .foregroundColor(Color.white)
                                .padding()
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: UserProfile()
                                            .navigationBarBackButtonHidden(true)) {
                                Image("Profile")
                                    .resizable()
                                    .frame(width:60, height:60)
                            }
                            
                            
                            
                        }
                    }
                  
                
            }
            .frame(maxHeight:.infinity, alignment: .top)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            
        }
        .navigationBarHidden(true)
    }
    
}



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
