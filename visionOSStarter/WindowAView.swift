//
//  WindowAView.swift
//  visionOSStarter
//
//  Created by Nien Lam on 10/5/23.
//  Copyright © 2023 Line Break, LLC. All rights reserved.
//

import SwiftUI
import RealityKit

struct WindowAView: View {
    @State var counter = 0
    
    var body: some View {
        VStack(spacing: 30) {
            HStack(spacing: 20) {
                Image(uiImage: UIImage(named: "smile")!)
                    .resizable()
                    .frame(width: 100, height: 100)
                
                Model3D(named: "toy_biplane")
            }

            Text("\(counter)")
                .font(.system(size: 50))

            Button("Update Counter") {
                counter += 1
            }
        }
    }
}

#Preview {
    WindowAView()
}
