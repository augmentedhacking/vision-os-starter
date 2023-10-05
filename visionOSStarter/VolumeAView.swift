//
//  ContentView.swift
//  visionOSStarter
//
//  Created by Nien Lam on 10/3/23.
//  Copyright © 2023 Line Break, LLC. All rights reserved.
//

import SwiftUI
import RealityKit

struct VolumeAView: View {
    @Environment(\.realityKitScene) var scene
    
    var body: some View {
        RealityView { content in
            // Create bottom entity.
            let bottom = BoxEntity(name: "bottom", width: 1.0, height: 0.01, depth: 1.0, imageName: "checker.png")
            content.add(bottom)

            // Offset plane position.
            bottom.position.y = -0.25


            // Create plane entity.
            let plane = CustomModelEntity(name: "plane", usdzModelName: "toy_biplane")

            // Play animation.
            plane.animate(true)
            
            // Generate collision shape and set as input target.
            plane.generateCollisionShapes(recursive: true)
            plane.components.set(InputTargetComponent())

            // Offset plane position.
            plane.position.x = -0.1
            
            // Add plane to scene.
            content.add(plane)
    
            
            // Create sphere entity.
            let sphere = SphereEntity(name: "sphere", radius: 0.1, imageName: "checker.png")

            // Offset sphere position.
            sphere.position.x = 0.1

            // Add sphere to scene.
            content.add(sphere)
            
            let moveDown = Transform(translation: [0, -0.1, 0])

            let upDown = FromToByAnimation<Transform>(
                name: "upDown",
                by: moveDown,
                duration: 2,
                timing: .easeInOut,
                bindTarget: .transform,
                repeatMode: .autoReverse)

            if let upDownAnimation = try? AnimationResource.generate(with: upDown) {
                sphere.playAnimation(upDownAnimation)
            }
            
            
            // Respond to collision events.
            content.subscribe(to: CollisionEvents.Began.self) { event in
                print("💥 entityA: ", event.entityA.name)
                print("💥 entityB: ", event.entityB.name)
            }
            .subscribe(to: scene!)
        } update: { content in

        }
        .gesture(TapGesture()
            .targetedToAnyEntity()
            .onEnded { value in
                print("tapping", value.entity.name)
            }
        )
        .gesture(DragGesture()
            .targetedToAnyEntity()
            .onChanged { value in
                value.entity.position = value.convert(value.location3D,
                                                      from: .local,
                                                      to: value.entity.parent!)
            }
        )
    }
}

#Preview(windowStyle: .volumetric) {
    VolumeAView()
}


