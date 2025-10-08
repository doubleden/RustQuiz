//
//  CrabsAnimation.swift
//  RustQuiz
//
//  Created by Denis Denisov on 8/10/25.
//

import SwiftUI

struct CrabsAnimation: View {
    @State private var crabs: [Crab] = []
    @State private var lastSpawnTime: TimeInterval = 0
    @State private var lastTickDate: Date? = nil
    
    private let spawnInterval: TimeInterval = 1.0
    private let maxCrabsOnScreen = 10
    
    private let crabSpeed = 50.0
    private let crabSize = 0.2
    private let crabOpacity = 0.4
    
    var body: some View {
        GeometryReader { geometry in
            TimelineView(.animation) { context in
                let nowDate = context.date
                let now = nowDate.timeIntervalSinceReferenceDate
                let previous = lastTickDate ?? nowDate
                let deltaTime = nowDate.timeIntervalSince(previous)
                
                ZStack {
                    ForEach(crabs) { crab in
                        CrabView(
                            geometry: geometry,
                            crab: crab
                        )
                    }
                    .onChange(of: context.date) { _, newDate in
                        step(
                            deltaTime: max(0, deltaTime),
                            geometry: geometry,
                            now: now
                        )
                        lastTickDate = newDate
                    }
                }
            }
        }
    }
}

// MARK: - Private Methods
extension CrabsAnimation {
    private func step(
        deltaTime: TimeInterval,
        geometry: GeometryProxy,
        now: TimeInterval
    ) {
        let width = geometry.size.width
        let height = geometry.size.height
        let crabWidth = width * crabSize
        let halfCrab = crabWidth / 2
        
        for i in crabs.indices {
            let sign: Double = (crabs[i].direction == .left) ? -1 : 1
            crabs[i].x += sign * crabs[i].speed * deltaTime
        }
        
        crabs.removeAll { crab in
            switch crab.direction {
            case .left:
                return crab.x + halfCrab < 0
            case .right:
                return crab.x - halfCrab > width
            }
        }
        
        if now - lastSpawnTime >= spawnInterval, crabs.count < maxCrabsOnScreen {
            spawnCrab(geometry: geometry)
            lastSpawnTime = now
        }
        
        for i in crabs.indices {
            crabs[i].y = min(max(crabs[i].y, halfCrab), height - halfCrab)
        }
    }
    
    private func spawnCrab(geometry: GeometryProxy) {
        let width = geometry.size.width
        let height = geometry.size.height
        let crabWidth = width * crabSize
        let halfCrab = crabWidth / 2
        
        let sideIsLeft = Bool.random()
        let direction: Crab.Direction = sideIsLeft ? .right : .left
        
        let x: CGFloat = sideIsLeft ? (-halfCrab) : (width + halfCrab)
        
        let verticalInset = halfCrab
        let yRange = verticalInset...(height - verticalInset)
        
        let minVerticalSpacing = crabWidth * 0.9
        
        let maxAttempts = 12
        var chosenY: CGFloat? = nil
        for _ in 0..<maxAttempts {
            let candidate = Double.random(in: yRange)
            let overlaps = crabs.contains { existing in
                abs(existing.y - candidate) < minVerticalSpacing
            }
            if !overlaps {
                chosenY = candidate
                break
            }
        }
        
        guard let y = chosenY else { return }
        
        let crab = Crab(
            speed: crabSpeed,
            size: crabSize,
            opacity: crabOpacity,
            x: x,
            y: y,
            direction: direction
        )
        
        crabs.append(crab)
    }
}


#Preview {
    CrabsAnimation()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("backgroundColor"))
}
