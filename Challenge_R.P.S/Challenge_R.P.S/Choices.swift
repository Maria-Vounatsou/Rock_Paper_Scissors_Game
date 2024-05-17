//
//  Choices.swift
//  Challenge_R.P.S
//
//  Created by Maria Vounatsou on 23/4/24.
//

import SwiftUI

struct Choices: View {
    let choice: String
    
    var body: some View {
       Image(choice)
            .resizable()
            .frame(width: 110.0, height: 150.0)
    }
}

struct Choices_Previews: PreviewProvider {
    static var previews: some View {
        Choices(choice: "rockP")
    }
}
