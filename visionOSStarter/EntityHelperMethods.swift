//
//  EntityHelperMethods.swift
//  visionOSStarter
//
//  Created by Nien Lam on 10/4/23.
//  Copyright © 2023 Line Break, LLC. All rights reserved.
//

import SwiftUI
import RealityKit

/// Classes for custom entities.

// MARK: - Create entity with USDZ model.

class CustomModelEntity: Entity {
    let model: Entity
    
    init(name: String, usdzModelName: String) {
        model = try! Entity.load(named: usdzModelName)
        model.name = name

        super.init()

        self.addChild(model)
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }

    // Play or stop animation.
    func animate(_ animate: Bool) {
        if animate {
            if let animation = model.availableAnimations.first {
                model.playAnimation(animation.repeat())
            }
        } else {
            model.stopAllAnimations()
        }
    }
}

// MARK: - Create box entity with width, height, depth and color or image.

class BoxEntity: Entity {
    let model: ModelEntity
    
    init(name: String, width: Float, height: Float, depth: Float, color: UIColor) {
        let material = SimpleMaterial(color: color, isMetallic: false)
        model = ModelEntity(mesh: .generateBox(width: width, height: height, depth: depth), materials: [material])
        model.name = name

        super.init()

        self.addChild(model)
    }

    init(name: String, width: Float, height: Float, depth: Float, imageName: String) {
        var material = SimpleMaterial()
        material.color = .init(tint: .white.withAlphaComponent(0.999),
                            texture: .init(try! .load(named: imageName)))

        model = ModelEntity(mesh: .generateBox(width: width, height: height, depth: depth), materials: [material])
        model.name = name

        super.init()

        self.addChild(model)
    }

    required init() {
        fatalError("init() has not been implemented")
    }
}


// MARK: - Create sphere entity with radius and color or image.

class SphereEntity: Entity {
    let model: ModelEntity
    
    init(name: String, radius: Float, color: UIColor) {
        let material = SimpleMaterial(color: color, isMetallic: false)
        model = ModelEntity(mesh: .generateSphere(radius: radius), materials: [material])
        model.name = name

        super.init()

        self.addChild(model)
    }

    init(name: String, radius: Float, imageName: String) {
        var material = SimpleMaterial()
        material.color = .init(tint: .white.withAlphaComponent(0.999),
                            texture: .init(try! .load(named: imageName)))

        model = ModelEntity(mesh: .generateSphere(radius: radius), materials: [material])
        model.name = name

        super.init()

        self.addChild(model)
    }

    required init() {
        fatalError("init() has not been implemented")
    }
}
