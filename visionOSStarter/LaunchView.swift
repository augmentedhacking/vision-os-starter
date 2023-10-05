//
//  ContentView.swift
//  visionOSStarter
//
//  Created by Nien Lam on 10/4/23.
//  Copyright © 2023 Line Break, LLC. All rights reserved.
//

import SwiftUI

struct LaunchView: View {
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        VStack(spacing: 30) {
            Text("Launch View")
                .font(.system(size: 44))

            HStack {
                Button("Show Window A") {
                    openWindow(id: "windowA")
                }

                Button("Show Volume A") {
                    openWindow(id: "volumeA")
                }

                Button("Show Volume B") {
                    openWindow(id: "volumeB")
                }
            }
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    LaunchView()
}


struct PlayerView: UIViewRepresentable {
    let mp4Filename: String

    func makeUIView(context: Context) -> UIView {
        return LoopingPlayerUIView(frame: .zero, mp4Filename: mp4Filename)
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }
}


