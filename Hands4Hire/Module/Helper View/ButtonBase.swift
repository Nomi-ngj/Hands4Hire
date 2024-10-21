//
//  ButtonBase.swift
//
//
//  Created by Nouman Gul Junejo on 29/07/2023.
//

import SwiftUI

struct ButtonBase: View {
    let action: () -> Void
    let label: String
    let foregroundColor: Color
    let backgroundColor: Color
    var width: CGFloat = 180
    
    var body: some View {
        VStack{
            Button(action: action) {
                Text(label)
                    .foregroundColor(foregroundColor)
                    .padding()
                    .frame(width: width)
            }
            .background(backgroundColor)
            .cornerRadius(30)
        }
    }
}

#if DEBUG
#Preview{
    
    VStack {
        ButtonBase(action: {
            print("on Button Tapped")
        }, label: "Button", foregroundColor: .white, backgroundColor: Color.orange)
    }
}
#endif



