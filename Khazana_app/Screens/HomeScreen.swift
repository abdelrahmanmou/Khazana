//
//  HomeScreen.swift
//  Furniture_app
//
//  Created by Abu Anwar MD Abdullah on 14/2/21.
//

import SwiftUI

struct HomeScreen: View {
    @State private var search: String = ""
    @State private var selectedIndex: Int = 1
    private let bookName = ["The Song Of Ice and Fire" , "Chronicles Of Narnia", "The Great Gatsby", "African Europeans"]
    private let categories = ["Classic", "Action", "Mystery", "Fantasy", "Fiction", "Horror", "Romance"]
    var body: some View {
        NavigationView {
            ZStack {
                
                Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))
                    .ignoresSafeArea()
                
                VStack {
                    VStack{
                        ScrollView (showsIndicators: false) {
                            VStack (alignment: .leading) {
                                
                                AppBarView()
                                
                                TagLineView()
                                    .padding()
                                
                                SearchAndScanView(search: $search)
                                
                            }
                            
                            ScrollView (.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(0 ..< categories.count) { i in
                                        Button(action: {selectedIndex = i}) {
                                            CategoryView(isActive: selectedIndex == i, text: categories[i])
                                        }
                                    }
                                }
                                .padding()
                            }
                            
                    
                    }
                    .frame(width: .infinity, height: 250)
}
                    
                    ScrollView (.vertical, showsIndicators: false, content: {
                        VStack (alignment: .center, spacing: 20) {
                            ForEach(0 ..< 4) { i in
                                NavigationLink(
                                    destination: DetailScreen(),
                                    label: {
                                        BookCardView(image: Image("book\(i+1)"), text: Text("\(bookName[i])"))
                                    })
                                    .navigationBarHidden(true)
                                    .foregroundColor(.black)
                            }
                            .padding()
                        }
                       
})
                    .padding(.bottom)
}
            }
        }

    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}



struct AppBarView: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image("menu")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10.0)
            }
            
            Spacer()
            
            Button(action: {}) {
                Image(uiImage: #imageLiteral(resourceName: "Profile"))
                    .resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find your next ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
            + Text("Read!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .fontWeight(.bold)
            .foregroundColor(Color("Primary"))
    }
}

struct SearchAndScanView: View {
    @Binding var search: String
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search For Books", text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing, 8)
            
            Button(action: {}) {
                Image("Scan")
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary") : Color.black.opacity(0.6))
            if (isActive) { Color("Primary")
                .frame(width: 20, height: 2)
                .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct BookCardView: View {
    let image: Image
    let text: Text
    var body: some View {
        VStack{
            
            image
                .resizable()
                .frame(width: 190, height: 270)
                .shadow(color: .black, radius: 10, x: -5, y: 2)
                .padding(.bottom)
            text
                .font(.title3)
                .fontWeight(.bold)
            
            HStack(spacing: 2){
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                
                Spacer()
                
                Text("E£500")
                    .font(.title3)
                    .fontWeight(.bold)
                
            }
            
            
        }
        .frame(width: .infinity, height: 400)
        .padding()
        .background(Color.white)
        .cornerRadius(30.0)
    }
}



