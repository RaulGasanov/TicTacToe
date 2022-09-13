//
//  SquareView.swift
//  TicTac
//
//  Created by Raul_Gasanov on 19.08.2022.
//

import Foundation
import SwiftUI

enum SquareStatus {
    case empty
    case home
    case visitor
}

class Square: ObservableObject {
    @Published var squareStatus: SquareStatus
    
    init(status: SquareStatus) {
        self.squareStatus = status
    }
}

struct SquareView: View {
    @ObservedObject var dataSource: Square
    var action: () -> Void
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            Text(self.dataSource.squareStatus == .home ?
                 "X": self.dataSource.squareStatus == .visitor ? "0": " ")
            .font(.largeTitle)
            .bold()
            .foregroundColor(.red)
            .frame(width: 70, height: 70, alignment: .center)
            .background(Color.gray.opacity(0.3).cornerRadius(10))
            .padding(4)
        })
    }
}
