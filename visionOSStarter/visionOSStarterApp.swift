//
//  visionOSStarterApp.swift
//  visionOSStarter
//
//  Created by Nien Lam on 10/5/23.
//  Copyright © 2023 Line Break, LLC. All rights reserved.
//

import SwiftUI

@main
struct visionOSStarterApp: App {
    var body: some Scene {
        // Initial launch panel.
        WindowGroup(id: "launch") {
            LaunchView()
        }


        // Window A scene.
        WindowGroup(id: "windowA") {
            WindowAView()
        }
 

        // Volume A container.
        WindowGroup(id: "volumeA") {
            VolumeAView()
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 1.0, height: 0.5, depth: 1.0, in: .meters)


        // Volume B container.
        WindowGroup(id: "volumeB") {
            VolumeBView()
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 1.0, height: 0.5, depth: 1.0, in: .meters)

        // Space A container.
        ImmersiveSpace(id: "spaceA") {
            VolumeAView()
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed, .progressive, .full)
    }
}
