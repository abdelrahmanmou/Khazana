//
//  AccountScreen.swift
//  Khazana
//
//  Created by Abdelrahman Moustafa on 06/02/2023.
//

import SwiftUI

struct AccountScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var selectedSectionIndex: Int = 1
    let gradient = LinearGradient(gradient: Gradient(colors: [Color("Primary"), Color.white]), startPoint: .top, endPoint: .center)
    private let sections = ["Classic", "Action", "Mystery", "Fantasy"]
    
    var body: some View {
        
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("Primary"), Color.white]), startPoint: .top, endPoint: .center)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    AppBarView()
                    Spacer()
                    BookCardView(image: Image("Home"), text: Text("Ajshdjaskd"))
                }
                
            }
           
        }
        
    }
}


struct AccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountScreen()
    }
}

struct Sections {
    
    let name: String
    let imageName: String
    let color: Color
}

