//
//  ContentView.swift
//  Furniture_app
//
//  Created by Abdelrahman Moustafa on 14/2/21.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTabIndex: Int = 0
    @State var presented = false
    let icons = ["Home", "fav", "newpost","shop","User"]
    var body: some View {
        ZStack {
            switch selectedTabIndex {
            case 0:
                VStack {
                    HomeScreen()
                }
            case 1:
                ExploreScreen()
            case 2:
                Text("Add Book")
            case 3:
                CartScreen()
            case 4:
                AccountScreen()
            default:
                VStack {
                    Text("Unknown Screen")
                }
}
            VStack {
            Spacer()
            HStack {
                ForEach(0..<5 , id: \.self){ number in
                        Button(action: {selectedTabIndex = number}, label: {
                            VStack {
                            Image(icons[number])
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.green)
                            Text("Home")
                            }
                            
                        })
                    
                    
                }
}
            .padding()
            .background(Color.white.opacity(0.9))
            .clipShape(Capsule())
            .padding(.horizontal)
            .shadow(color: Color.blue.opacity(0.15), radius: 8, x: 2, y: 6)
}
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//struct BottomNavBarView: View {
//
//    var body: some View {
//        HStack {
//            ForEach(0..<5 , id: \.self){ number in
//                Button(action: selectedTabIndex = number, label: {
//                    Image(systemName: "Home")
//                })
//
//            }
//            BottomNavBarItem(image: Image("Home"), action: {})
//            BottomNavBarItem(image: Image("fav"), action: {})
//            BottomNavBarItem(image: Image("shop"), action: {})
//            BottomNavBarItem(image: Image("User"), action: {})
//        }
//        .padding()
//        .background(Color.white)
//        .clipShape(Capsule())
//        .padding(.horizontal)
//        .shadow(color: Color.blue.opacity(0.15), radius: 8, x: 2, y: 6)
//    }
//}
//
//struct BottomNavBarItem: View {
//    let image: Image
//    let action: () -> Void
//    var body: some View {
//        Button(action: action) {
//            image
//                .frame(maxWidth: .infinity)
//        }
//    }
//}
