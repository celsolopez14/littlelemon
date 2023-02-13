//
//  Menu.swift
//  LittleLemon
//
//  Created by Celso Lopez Martinez on 2/11/23.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var searchText:String = ""
    @State var filterText:String = ""
    @State var didAppear:Bool = false
    var body: some View {
        VStack{
            HeroHeading()
                
            TextField("Search menu", text: $searchText)
                .foregroundColor(CustomColors.secondaryFour)
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 10).fill(CustomColors.secondaryThree))
                .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(CustomColors.secondaryFour))
                .padding(5)
                .offset(y:-60)
                .padding(.bottom, -60)
            Text("ORDER FOR DELIVERY!")
                .bold()
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .leading)
            ScrollView(.horizontal){
                HStack(spacing:40){
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
            
            FetchedObjects(
                predicate:buildPredicate(filter:filterText), sortDescriptors:buildSortDescriptors()) {
                    (dishes: [Dish]) in
                List{
                    VStack{
                        ForEach(dishes, id: \.self) {dish in
                            HStack{
                                VStack{
                                    Text("\(dish.title ?? "")")
                                        .font(.system(size: 18))
                                        .bold()
                                        .foregroundColor(CustomColors.secondaryFour)
                                        .frame(maxWidth:.infinity, alignment: .leading)
                                    Text("\(dish.itemDescription ?? "")")
                                        .font(.system(size: 16))
                                        .foregroundColor(CustomColors.secondaryFour)
                                        .frame(maxWidth:.infinity, alignment: .leading)
                                    Text("$\(dish.price ?? "")")
                                        .font(.system(size: 18))
                                        .bold()
                                        .foregroundColor(CustomColors.secondaryFour)
                                        .frame(maxWidth:.infinity, alignment: .leading)
                                    
                                }
                                Spacer()
                                AsyncImage(url: URL(string: dish.image ?? "")) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 82, height: 80)
                                
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight:.infinity)
                    .foregroundColor(CustomColors.secondaryThree)
                }
            }
        }
        .position(x: 215, y: 400)
        .onAppear{
            onLoad()
        }
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor]{
            return [
                NSSortDescriptor(key:"title",
                                 ascending: true,
                                 selector: #selector(NSString.localizedStandardCompare))
            ]
        
    }
    
    func buildPredicate(filter:String) -> NSPredicate{
        if(!filter.isEmpty && searchText == ""){
            return NSPredicate(format: "category CONTAINS[cd] %@", filter)
        } else {
        return searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        
    }
    }
    
    func onLoad(){
        if !didAppear {
           getMenuData()
            didAppear.toggle()
        }
    }
    
    
    
    func getMenuData(){
        PersistenceController.shared.clear()
        let urlString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let url = URL(string: urlString)!
        let request = URLRequest(url:url)
        let dataTask = URLSession.shared.dataTask(with: request)
        { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                let MenuList = try? decoder.decode(MenuList.self, from: data)
                if let menuItem = MenuList?.menu {
                    for item in menuItem{
                        let dish = Dish(context: viewContext)
                        dish.category = item.category
                        dish.id = String(item.id)
                        dish.price = item.price
                        dish.image = item.image
                        dish.itemDescription = item.itemDescription
                        dish.title = item.title
                    }
                    try? viewContext.save()
                }
                
            }
        }
        dataTask.resume()
        
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
