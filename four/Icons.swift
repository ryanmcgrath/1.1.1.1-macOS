//
//  Icons.swift
//  four
//
//  Created by Ryan McGrath on 12/23/18.
//  Copyright © 2018 Ryan McGrath. All rights reserved.
//

import Foundation
import Cocoa

struct Icons {
    public static func statusBarIcon(frame targetFrame: NSRect = NSRect(x: 0, y: 0, width: 32, height: 32), resizing: ResizingBehavior = .aspectFit) -> NSImage {
        let resizedFrame: NSRect = resizing.apply(rect: NSRect(x: 0, y: 0, width: 64, height: 64), target: targetFrame)
        return NSImage(size: resizedFrame.size, flipped: false, drawingHandler: { (destRect: NSRect) -> Bool in
            let context = NSGraphicsContext.current?.cgContext
            NSGraphicsContext.saveGraphicsState()
            context?.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context?.scaleBy(x: resizedFrame.size.width / 64.0, y: resizedFrame.size.height / 64.0)
            
            //// Color Declarations
            let fillColor = NSColor(red: 1, green: 1, blue: 1, alpha: 1)

            //// Bezier Drawing
            let bezierPath = NSBezierPath()
            bezierPath.move(to: NSPoint(x: 43.62, y: 16))
            bezierPath.line(to: NSPoint(x: 18.53, y: 16))
            bezierPath.line(to: NSPoint(x: 18.52, y: 16))
            bezierPath.curve(to: NSPoint(x: 9.01, y: 25.46), controlPoint1: NSPoint(x: 13.27, y: 16), controlPoint2: NSPoint(x: 9.01, y: 20.24))
            bezierPath.curve(to: NSPoint(x: 15.11, y: 34.29), controlPoint1: NSPoint(x: 9.01, y: 29.38), controlPoint2: NSPoint(x: 11.44, y: 32.89))
            bezierPath.line(to: NSPoint(x: 15.08, y: 34.24))
            bezierPath.curve(to: NSPoint(x: 23.86, y: 42.68), controlPoint1: NSPoint(x: 15.16, y: 38.98), controlPoint2: NSPoint(x: 19.09, y: 42.76))
            bezierPath.curve(to: NSPoint(x: 25.51, y: 42.49), controlPoint1: NSPoint(x: 24.41, y: 42.67), controlPoint2: NSPoint(x: 24.97, y: 42.6))
            bezierPath.line(to: NSPoint(x: 25.56, y: 42.52))
            bezierPath.curve(to: NSPoint(x: 42.59, y: 44.3), controlPoint1: NSPoint(x: 29.77, y: 47.68), controlPoint2: NSPoint(x: 37.39, y: 48.48))
            bezierPath.curve(to: NSPoint(x: 47.03, y: 35.99), controlPoint1: NSPoint(x: 45.14, y: 42.24), controlPoint2: NSPoint(x: 46.74, y: 39.24))
            bezierPath.line(to: NSPoint(x: 47, y: 36.08))
            bezierPath.curve(to: NSPoint(x: 53.43, y: 22.96), controlPoint1: NSPoint(x: 52.42, y: 34.22), controlPoint2: NSPoint(x: 55.3, y: 28.35))
            bezierPath.curve(to: NSPoint(x: 43.62, y: 16), controlPoint1: NSPoint(x: 51.99, y: 18.8), controlPoint2: NSPoint(x: 48.05, y: 16))
            bezierPath.line(to: NSPoint(x: 43.62, y: 16))
            bezierPath.close()
            bezierPath.move(to: NSPoint(x: 44.84, y: 33.2))
            bezierPath.line(to: NSPoint(x: 44.83, y: 33.21))
            bezierPath.curve(to: NSPoint(x: 43.67, y: 34.68), controlPoint1: NSPoint(x: 44.19, y: 33.43), controlPoint2: NSPoint(x: 43.73, y: 34))
            bezierPath.line(to: NSPoint(x: 43.59, y: 35.6))
            bezierPath.line(to: NSPoint(x: 43.59, y: 35.6))
            bezierPath.curve(to: NSPoint(x: 35.03, y: 43.54), controlPoint1: NSPoint(x: 43.2, y: 40.03), controlPoint2: NSPoint(x: 39.5, y: 43.46))
            bezierPath.curve(to: NSPoint(x: 27.55, y: 39.51), controlPoint1: NSPoint(x: 31.04, y: 43.58), controlPoint2: NSPoint(x: 28.92, y: 41.23))
            bezierPath.line(to: NSPoint(x: 27.54, y: 39.5))
            bezierPath.curve(to: NSPoint(x: 25.82, y: 38.91), controlPoint1: NSPoint(x: 27.13, y: 38.99), controlPoint2: NSPoint(x: 26.46, y: 38.76))
            bezierPath.line(to: NSPoint(x: 25.83, y: 38.9))
            bezierPath.curve(to: NSPoint(x: 23.49, y: 39.23), controlPoint1: NSPoint(x: 25.07, y: 39.12), controlPoint2: NSPoint(x: 24.29, y: 39.23))
            bezierPath.line(to: NSPoint(x: 23.55, y: 39.23))
            bezierPath.curve(to: NSPoint(x: 18.53, y: 34.16), controlPoint1: NSPoint(x: 20.79, y: 39.14), controlPoint2: NSPoint(x: 18.58, y: 36.91))
            bezierPath.line(to: NSPoint(x: 18.51, y: 33.06))
            bezierPath.line(to: NSPoint(x: 18.51, y: 33.06))
            bezierPath.curve(to: NSPoint(x: 17.43, y: 31.51), controlPoint1: NSPoint(x: 18.5, y: 32.38), controlPoint2: NSPoint(x: 18.07, y: 31.76))
            bezierPath.curve(to: NSPoint(x: 12.48, y: 25.17), controlPoint1: NSPoint(x: 15.18, y: 30.63), controlPoint2: NSPoint(x: 12.33, y: 29.21))
            bezierPath.line(to: NSPoint(x: 12.48, y: 25.13))
            bezierPath.curve(to: NSPoint(x: 18.61, y: 19.44), controlPoint1: NSPoint(x: 12.65, y: 21.9), controlPoint2: NSPoint(x: 15.36, y: 19.39))
            bezierPath.line(to: NSPoint(x: 43.53, y: 19.44))
            bezierPath.line(to: NSPoint(x: 43.57, y: 19.44))
            bezierPath.curve(to: NSPoint(x: 50.54, y: 26.26), controlPoint1: NSPoint(x: 47.37, y: 19.44), controlPoint2: NSPoint(x: 50.47, y: 22.47))
            bezierPath.curve(to: NSPoint(x: 44.84, y: 33.2), controlPoint1: NSPoint(x: 50.57, y: 30.89), controlPoint2: NSPoint(x: 46.96, y: 32.48))
            bezierPath.close()
            bezierPath.windingRule = .evenOdd
            fillColor.setFill()
            bezierPath.fill()

            NSGraphicsContext.restoreGraphicsState()
            return true
        })
    }

    public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: NSRect, target: NSRect) -> NSRect {
            if rect == target || target == NSRect.zero {
                return rect
            }

            var scales = NSSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}
