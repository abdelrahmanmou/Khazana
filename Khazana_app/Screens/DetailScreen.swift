//
//  DetailScreen.swift
//  Furniture_app
//
//  Created by Abu Anwar MD Abdullah on 15/2/21.
//

import SwiftUI

struct DetailScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
                
            ScrollView  {
                //            Product Image
                
                BookCardDetailView(image: Image("book1"))                
                DescriptionView()
                
            }
            //.edgesIgnoringSafeArea(.top)
            
            HStack {
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Buy Used")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Primary"))
                        .padding()
                        .padding(.horizontal, 8)
                        .background(Color.white)
                        .cornerRadius(10.0)
                })
                Spacer()
                
                
            }
            .padding()
            .padding(.horizontal)
            .background(Color("Primary"))
            .cornerRadius(60.0, corners: .topLeft)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot"))
    }
}


struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen()
    }
}


struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct DescriptionView: View {
    var body: some View {
        VStack (alignment: .leading) {
            //                Title
            Text("The Song Of Ice and Fire")
                .font(.title)
                .fontWeight(.bold)
            //                Rating
            HStack (spacing: 4) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
            }
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Text("A Song of Ice and Fire is a series of high fantasy novels written by George R. R. Martin. The series is set in the fictional world of Westeros and follows the political and military struggles of various noble houses vying for control of the Iron Throne, the seat of the King of the Seven Kingdoms. The series is known for its complex characters, intricate world-building, and unpredictable plot twists, as well as its graphic depiction of violence and social issues.")
                .lineSpacing(8.0)
                .opacity(0.6)
            
            //                Info
            HStack (alignment: .firstTextBaseline) {
                
                VStack (alignment: .leading) {
                    Text("Author")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    Text("George R. R. Martin")
                        .opacity(0.6)
                   
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.trailing)
                Spacer()
                
                VStack (alignment: .leading) {
                    Text("Published")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    
                    Text("August 1, 1996")
                        .opacity(0.6)
                }
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            
            
            
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .offset(x: 0, y: -30.0)
    }
}


struct BackButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.black)
                .padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8.0)
        }
    }
}

struct BookCardDetailView: View {
    let image: Image
    
    var body: some View {
        
        VStack{
            image
                .resizable()
                .frame(width: 190, height: 270)
                .shadow(color: .black, radius: 10, x: -5, y: 2)
                .padding(.bottom)
        }
        .frame(width: .infinity, height: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(30.0)
    }
}
