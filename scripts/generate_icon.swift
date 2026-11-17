import AppKit
import CoreGraphics
import Foundation
import ImageIO
import UniformTypeIdentifiers

let size = 1024
let outputPath = "NightClock/Assets.xcassets/AppIcon.appiconset/AppIcon.png"

if FileManager.default.fileExists(atPath: outputPath) {
    print("Found custom AppIcon.png — keeping existing icon.")
    exit(0)
}

guard let rep = NSBitmapImageRep(
    bitmapDataPlanes: nil,
    pixelsWide: size,
    pixelsHigh: size,
    bitsPerSample: 8,
    samplesPerPixel: 4,
    hasAlpha: true,
    isPlanar: false,
    colorSpaceName: .deviceRGB,
    bytesPerRow: 0,
    bitsPerPixel: 0
) else {
    fatalError("Failed to create bitmap")
}

guard let gfx = NSGraphicsContext(bitmapImageRep: rep) else {
    fatalError("Failed to create graphics context")
}

NSGraphicsContext.saveGraphicsState()
NSGraphicsContext.current = gfx

let fullRect = NSRect(x: 0, y: 0, width: size, height: size)

// 1. Deep midnight-blue background gradient
let bgGradient = NSGradient(colors: [
    NSColor(calibratedRed: 0.02, green: 0.03, blue: 0.09, alpha: 1.0),
    NSColor(calibratedRed: 0.05, green: 0.11, blue: 0.25, alpha: 1.0),
    NSColor(calibratedRed: 0.02, green: 0.04, blue: 0.11, alpha: 1.0)
])
bgGradient?.draw(in: fullRect, angle: -90)

// 2. Soft ambient glow behind the clock
if let glow = NSGradient(colors: [
    NSColor(calibratedRed: 0.18, green: 0.36, blue: 0.68, alpha: 0.35),
    NSColor(calibratedRed: 0.04, green: 0.08, blue: 0.20, alpha: 0.0)
]) {
    glow.draw(
        fromCenter: NSPoint(x: 512, y: 460),
        radius: 0,
        toCenter: NSPoint(x: 512, y: 460),
        radius: 470,
        options: []
    )
}

// 3. Subtle night stars
let starPoints: [(CGFloat, CGFloat, CGFloat, CGFloat)] = [
    (175, 835, 5.0, 0.55), (290, 885, 3.5, 0.40), (390, 840, 4.0, 0.35),
    (735, 855, 4.5, 0.45), (855, 765, 3.5, 0.40), (160, 680, 3.0, 0.30),
    (835, 185, 4.0, 0.35), (195, 175, 3.5, 0.30)
]
for (x, y, r, alpha) in starPoints {
    NSColor(calibratedRed: 0.85, green: 0.90, blue: 1.0, alpha: alpha).setFill()
    NSBezierPath(ovalIn: NSRect(x: x - r, y: y - r, width: r * 2, height: r * 2)).fill()
}

// 4. Warm crescent moon above the clock
let cg = gfx.cgContext
cg.saveGState()
cg.beginTransparencyLayer(auxiliaryInfo: nil)
cg.setFillColor(NSColor(calibratedRed: 0.96, green: 0.84, blue: 0.55, alpha: 1.0).cgColor)
cg.fillEllipse(in: CGRect(x: 512 - 84, y: 730 - 84, width: 168, height: 168))
cg.setBlendMode(.destinationOut)
cg.fillEllipse(in: CGRect(x: 512 - 32, y: 730 - 60, width: 152, height: 152))
cg.endTransparencyLayer()
cg.restoreGState()

// 5. Soft dark clock display card
let cardRect = NSRect(x: 122, y: 230, width: 780, height: 330)
let cardPath = NSBezierPath(roundedRect: cardRect, xRadius: 68, yRadius: 68)
NSColor(calibratedRed: 0.03, green: 0.05, blue: 0.12, alpha: 0.65).setFill()
cardPath.fill()
NSColor(calibratedRed: 0.65, green: 0.78, blue: 0.96, alpha: 0.18).setStroke()
cardPath.lineWidth = 4
cardPath.stroke()

// 6. Centered rounded digital clock numerals
let baseFont = NSFont.systemFont(ofSize: 210, weight: .bold)
let roundedDesc = baseFont.fontDescriptor.withDesign(.rounded) ?? baseFont.fontDescriptor
let clockFont = NSFont(descriptor: roundedDesc, size: 210) ?? baseFont

let text = "10:45" as NSString
let paragraph = NSMutableParagraphStyle()
paragraph.alignment = .center
let attrs: [NSAttributedString.Key: Any] = [
    .font: clockFont,
    .foregroundColor: NSColor(calibratedRed: 0.96, green: 0.92, blue: 0.83, alpha: 1.0),
    .paragraphStyle: paragraph
]
let textSize = text.size(withAttributes: attrs)
let textRect = NSRect(
    x: cardRect.minX,
    y: cardRect.minY + (cardRect.height - textSize.height) / 2.0 - 6,
    width: cardRect.width,
    height: textSize.height
)
text.draw(in: textRect, withAttributes: attrs)

NSGraphicsContext.restoreGraphicsState()

guard let cgImage = rep.cgImage else {
    fatalError("Failed to get CGImage")
}

// Flatten onto an opaque RGBX context (iOS icons should have no transparency)
let colorSpace = CGColorSpaceCreateDeviceRGB()
guard let opaqueCtx = CGContext(
    data: nil,
    width: size,
    height: size,
    bitsPerComponent: 8,
    bytesPerRow: size * 4,
    space: colorSpace,
    bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue
) else {
    fatalError("Failed to create opaque CGContext")
}
opaqueCtx.draw(cgImage, in: CGRect(x: 0, y: 0, width: size, height: size))

guard let finalImage = opaqueCtx.makeImage() else {
    fatalError("Failed to create final CGImage")
}

let url = URL(fileURLWithPath: outputPath)
try FileManager.default.createDirectory(at: url.deletingLastPathComponent(), withIntermediateDirectories: true)

guard let dest = CGImageDestinationCreateWithURL(url as CFURL, UTType.png.identifier as CFString, 1, nil) else {
    fatalError("Failed to create PNG destinatio
