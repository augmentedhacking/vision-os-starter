//
//  ContentView.swift
//  visionOSStarter
//
//  Created by Nien Lam on 10/3/23.
//  Copyright © 2023 Line Break, LLC. All rights reserved.
//

import SwiftUI
import RealityKit

struct VolumeBView: View {
    @State var counter = 0
    
    var body: some View {
        RealityView { content, attachments in
            // Create bottom entity.
            let bottom = BoxEntity(name: "bottom", width: 1.0, height: 0.01, depth: 1.0, imageName: "checker.png")
            content.add(bottom)

            // Offset plane position.
            bottom.position.y = -0.25

            
            // Create plane entity.
            let plane = CustomModelEntity(name: "plane", usdzModelName: "toy_biplane")
            plane.position = [0, 0, 0.2]
            
            // Play animation.
            plane.animate(true)
            
            // Add plane to scene.
            content.add(plane)

            
            // Add attachements.
            
            if let videoEntity = attachments.entity(for: "video") {
                content.add(videoEntity)
                videoEntity.position = [-0.2, 0, 0]
                videoEntity.orientation = simd_quatf(angle: .pi / 6, axis: [0,1,0])
            }
            

            if let attachmentA = attachments.entity(for: "attachmentA") {
                content.add(attachmentA)
                attachmentA.position = [0.2, 0, 0]
                attachmentA.orientation = simd_quatf(angle: -.pi / 6, axis: [0,1,0])
            }

        } update: { content, attachments in

            
        } attachments: {
            Attachment(id: "video") {
                PlayerView(mp4Filename: "stars")
                    .frame(width: 600, height: 400)
            }

            Attachment(id: "attachmentA") {
                VStack {
                    Text("\(counter)")
                        .font(.system(size: 50))

                    Button("Update Counter") {
                        counter += 1
                    }
                }
                .frame(width: 600, height: 400)
                .background(Color.blue)
                .cornerRadius(10)
            }
        }

    }
}

#Preview(windowStyle: .volumetric) {
    VolumeAView()
}


