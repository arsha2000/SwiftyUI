//
//  CustomList.swift
//  Notes Swifty
//
//  Created by Arsha Hassas on 7/29/19.
//  Copyright © 2019 Olly Taylor. All rights reserved.
//

import SwiftUI

struct CustomList<Data, Content>: View
where Data: RandomAccessCollection, Content: View, Data.Element: Identifiable & Hashable {
    
    let data: Data
    let content: (Data.Element) -> Content
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 14) {
                ForEach(data, id: \.self) { (element) in
                    self.content(element)
                }
            }
            .padding([.leading, .trailing], 16)
        }
    }
}

#if DEBUG
struct CustomList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                CustomList(data: sampleStrings) { string in
                    Row(withChevron: true) {
                        HStack {
                            Text(string)
                        }
                    }
                }
                .navigationBarTitle("Custom List")
            }
            
            NavigationView {
                CustomList(data: sampleStrings) { string in
                    Row(withChevron: true) {
                        HStack {
                            Text(string)
                        }
                    }
                    .onDelete {
                        // Delete the Row
                    }
                    .environment(\.editMode, .constant(.active))

                }
                .navigationBarTitle("Custom List")
                
            }
            .environment(\.colorScheme, .dark)
        }
        
    }
}
#endif
