//
//  HeroHeading.swift
//  LittleLemon
//
//  Created by Celso Lopez Martinez on 2/12/23.
//

import SwiftUI

struct HeroHeading: View {


    var body: some View {
        VStack{
            
            
            VStack{
                Text("Little Lemon")
                    .font(.system(size: 64))
                    .fontWeight(.medium)
                    .padding()
                    .foregroundColor(CustomColors.primaryTwo)
                    .frame(maxWidth: .infinity, alignment:.leading)
                    .offset(y:40)
                
                Text("Chicago")
                    .font(.system(size: 40))
                    .padding()
                    .foregroundColor(CustomColors.secondaryThree)
                    .frame(maxWidth: .infinity, alignment:.leading)
                    
                
                HStack{
                    Text("We are a family owned Mediterranean restaurant, focuse on traditional recipes served with a modern twist")
                        .font(.system(size: 18))
                        .padding()
                        .foregroundColor(CustomColors.secondaryThree)
                        .fixedSize(horizontal: false, vertical: true)
                        .offset(y:-50)
                        
                    Image("Hero image")
                        .resizable()
                        .frame(width:140, height:171)
                        .cornerRadius(16)
                        .offset(y:-85)
                        
                        
                }
                
               
            }
            .frame(width: 430, height: 324)
            .background(CustomColors.primaryOne)
                
        }
    }
}

struct HeroHeading_Previews: PreviewProvider {
    static var previews: some View {
        HeroHeading()
    }
}
