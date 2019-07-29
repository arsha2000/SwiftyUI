//
//  EmtyListView.swift
//  Dumm
//
//  Created by Arsha Hassas on 7/23/19.
//  Copyright © 2019 Olly Taylor. All rights reserved.
//

import SwiftUI

struct EmtyListView: View {
    
    let title: String
    var subtitle: String?
    
    var body: some View {
        VStack {
            Text(title.capitalized)
                .font(.headline)
                .bold()
            
            if subtitle != nil {
                Text(subtitle!.capitalized)
                    .font(.body)
                    .bold()
                    .foregroundColor(.secondary)
            }
        }
            .lineLimit(nil)
            .multilineTextAlignment(.center)
            .padding()
    }
}

#if DEBUG
struct EmtyListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EmtyListView(title: "You are not connected to the internet", subtitle: "XxXx XxXx XxXx")
                .navigationBarTitle("No Internet")
        }
    }
}
#endif
