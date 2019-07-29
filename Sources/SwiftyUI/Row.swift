//
//  Row.swift
//  Notes Swifty
//
//  Created by Arsha Hassas on 7/28/19.
//  Copyright © 2019 Olly Taylor. All rights reserved.
//

import SwiftUI


struct Row<Content>: View
where Content: View {
    
    @Environment(\.editMode) private var editMode
    @Environment(\.colorScheme) private var colorScheme
    
    typealias Action = () -> ()
    private var deleteAction: Action? = nil
    
    var withChevron: Bool = false
    let content: () -> Content
    
    private var rowHeight: Length { 52 }
    private var backColor: Color { colorScheme == .light ? .white : Color.white.opacity(0.15) }
    private var shouldDisplayDeleteButton: Bool {
        return deleteAction != nil && self.editMode!.wrappedValue.isEditing
    }
    
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(backColor)
                .frame(height: rowHeight)
                .shadow(radius: 2, y: 1)
            
            
            HStack {
                if shouldDisplayDeleteButton {
                    deleteButton
                }
                
                content()
                
                
                if withChevron {
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right.circle")
                        .foregroundColor(.secondary)
                    
                }
                
            }
            .padding([.leading, .trailing])
            
        }
    }
    
    private var deleteButton: some View {
        Button(action: { self.deleteAction?() }) {
            Image(systemName: "minus.circle.fill")
                .imageScale(.large)
                .foregroundColor(.red)
                .background(Color.white.clipShape(Circle()))
                .transition(.asymmetric(insertion: .move(edge: .trailing),
                                        removal: .move(edge: .leading)))
        }
    }
    
    
    
    
    
    init(withChevron: Bool = false,
         content: @escaping () -> Content) {
        
        self.withChevron = withChevron
        self.content = content
    }
}

extension Row {
    func onDelete(_ action: @escaping Action) -> Self {
        var copy = self
        copy.deleteAction = action
        return copy
    }
}

#if DEBUG
struct Row_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Row(withChevron: true) {
                HStack {
                    Text("Goodbye")
                }
            }
            .onDelete {
                
            }
        }
        .environment(\.colorScheme, .light)
            .environment(\.editMode, .constant(.active))
        
    }
}
#endif
