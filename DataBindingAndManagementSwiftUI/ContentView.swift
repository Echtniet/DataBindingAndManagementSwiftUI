//
//  ContentView.swift
//  DataBindingAndManagementSwiftUI
//
//  Created by student on 2/3/21.
//

import SwiftUI

struct ContentView: View {
    @State var fname = ""
    @State var lname = ""
    @State var users = [String]()
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    VStack {
                        Group {
                            TextField("fname", text: $fname).padding(8)
                        }.background(Color.white).clipShape(RoundedRectangle(cornerRadius: 5))
                        Group {
                            TextField("lname", text: $lname).padding(8)
                        }.background(Color.white).clipShape(RoundedRectangle(cornerRadius: 5))
                        Button(action: {
                            self.users.append("\(self.fname) \(self.lname)")
                            self.fname = ""
                            self.lname = ""
                        }) {
                            Group {
                                Text("Create User").foregroundColor(.white).padding(12)
                            }.background((fname.count > 0 && lname.count > 0) ? Color.blue:Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .shadow(radius: 5)
                        }
                    }.padding(12) 
                }.background(Color.gray)
                List {
                    Text("Empty row")
                    ForEach(users, id: \.self){ user in
                        Text(user)
                    }
                }
            }.navigationBarTitle(Text("Some Form"))
            .navigationBarItems(leading:
                HStack{
                    Text("FName: ")
                    Text(fname)
                    Text(" LName:")
                    Text(lname)
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
