import SwiftUI

struct AnimatedBackgroundView: View {
    let theme: BackgroundTheme

    var body: some View {
        TimelineView(.animation(minimumInterval: 1.0 / 15.0, paused: false)) { timeline in
            let t = timeline.date.timeIntervalSinceReferenceDate
            Canvas { context, size in
                render(theme: theme, time: t, context: &context, size: size)
            }
        }
        .ignoresSafeArea()
    }

    private func render(theme: BackgroundTheme, time t: TimeInterval, context: inout GraphicsContext, size: CGSize) {
        let baseColors = theme.previewColors
        let fullRect = CGRect(origin: .zero, size: size)

        switch theme {
        // MARK: - Blue (5)
        case .blueHorizon:
            fillGradient(&context, rect: fullRect, top: baseColors[0], bottom: baseColors[1].opacity(0.65))
            drawWaves(&context, size: size, time: t, color: Color(red: 0.26, green: 0.52, blue: 0.80).opacity(0.16), count: 4, speed: 0.18, amplitude: 28)

        case .ceruleanMist:
            fillGradient(&context, rect: fullRect, top: baseColors[0], bottom: baseColors[1].opacity(0.55))
            drawDriftingClouds(&context, size: size, time: t, primary: Color(red: 0.25, green: 0.54, blue: 0.84), secondary: Color(red: 0.15, green: 0.36, blue: 0.62), intensity: 0.24, speed: 0.12)

        case .sapphireRain:
            fillGradient(&context, rect: fullRect, top: baseColors[0], bottom: Color(red: 0.08, green: 0.19, blue: 0.36))
            drawFallingDrops(&context, size: size, time: t, color: Color(red: 0.45, green: 0.70, blue: 0.96), count: 24, speed: 22)

        case .cobaltRipples:
            fillGradient(&context, rect: fullRect, top: baseColors[0], bottom: baseColors[1].opacity(0.45))
            drawRipples(&context, size: size, time: t, color: Color(red: 0.32, green: 0.56, blue: 0.90), count: 4, speed: 0.12, maxOpacity: 0.20)

        case .glacierAurora:
            fillGradient(&context, rect: fullRect, top: Color(red: 0.02, green: 0.08, blue: 0.16), bottom: baseColors[0])
            drawAuroraCurtains(&context, size: size, time: t, colorA: Color(red: 0.22, green: 0.58, blue: 0.78), colorB: Color(red: 0.24, green: 0.44, blue: 0.82), intensity: 0.24)

        // MARK: - Dark Blue (5)
        case .midnightSwell:
            fillGradient(&context, rect: fullRect, top: baseColors[0], bottom: baseColors[1])
            drawWaves(&context, size: size, time: t, color: Color(red: 0.16, green: 0.28, blue: 0.54).opacity(0.22), count: 3, speed: 0.12, amplitude: 24)

        case .abyssalStars:
            fillGradient(&context, rect: fullRect, top: Color(red: 0.01, green: 0.02, blue: 0.06), bottom: baseColors[1].opacity(0.65))
            drawStarfield(&context, size: size, time: t, starColor: Color(red: 0.72, green: 0.82, blue: 0.98), count: 34, maxOpacity: 0.45, speed: 0.35)

        case .indigoNebula:
            fillGradient(&context, rect: fullRect, top: baseColors[0], bottom: Color(red: 0.06, green: 0.05, blue: 0.18))
            drawDriftingClouds(&context, size: size, time: t, primary: Color(red: 0.24, green: 0.22, blue: 0.58), secondary: Color(red: 0.14, green: 0.22, blue: 0.48), intensity: 0.26, speed: 0.09)

        case .harborBeacon:
            fillGradient(&context, rect: fullRect, top: baseColors[0], bottom: baseColors[1].opacity(0.5))
            drawSweepingGlow(&context, size: size, time: t, color: Color(red: 0.22, green: 0.36, blue: 0.68), intensity: 0.26, speed: 0.14)

        case .nocturneDots:
            fillGradient(&context, rect: fullRect, top: baseColors[0], bottom: baseColors[1].opacity(0.45))
            drawDotMatrix(&context, size: size, time: t, color: Color(red: 0.30, green: 0.46, blue: 0.80), maxOpacity: 0.22, speed: 0.28)

        // MARK: - Red (2)
        case .crimsonEmbers:
            fillGradient(&context, rect: fullRect, top: Color(red: 0.03, green: 0.005, blue: 0.005), bottom: baseColors[1].opacity(0.55))
            drawRisingMotes(&context, size: size, time: t, color: Color(red: 0.85, green: 0.22, blue: 0.14), count: 22, speed: 14, maxOpacity: 0.36)

        case .rubyBreath:
            fillGradient(&context, rect: fullRect, top: baseColors[0], bottom: Color(red: 0.10, green: 0.02, blue: 0.03))
            drawBreathingCenter(&context, size: size, time: t, color: Color(red: 0.56, green: 0.08, blue: 0.10), minOpacity: 0.08, maxOpacity: 0.32, speed: 0.16)

        // MARK: - Gray (3)
        case .silverFog:
            fillGradient(&context, rect: fullRect, top: baseColors[0], bottom: baseColors[1].opacity(0.55))
            drawDriftingClouds(&context, size: size, time: t, primary: Color(white: 0.45), secondary: Color(white: 0.30), intensity: 0.22, speed: 0.10)

        case .pebbleRings:
            fillGradient(&context, rect: fullRect, top: baseColors[0], bottom: baseColors[1].opacity(0.45))
            drawRipples(&context, size: size, time: t, color: Color(white: 0.52), count: 4, speed: 0.10, maxOpacity: 0.18)

        case .graphiteDust:
            fillGradient(&context, rect: fullRect, top: baseColors[0], bottom: baseColors[1].opacity(0.4))
            drawFloatingMotes(&context, size: size, time: t, color: Color(white: 0.62), count: 26, maxOpacity: 0.28, speed: 0.18)

        // MARK: - Black (5)
        case .voidPulse:
            context.fill(Path(fullRect), with: .color(.black))
            drawBreathingCenter(&context, size: size, time: t, color: Color(white: 0.16), minOpacity: 0.02, maxOpacity: 0.22, speed: 0.12)

        case .obsidianStars:
            context.fill(Path(fullRect), with: .color(.black))
            drawStarfield(&context, size: size, time: t, starColor: Color(white: 0.82), count: 20, maxOpacity: 0.36, speed: 0.25)

        case .shadowPendulum:
            context.fill(Path(fullRect), with: .color(.black))
            drawSweepingGlow(&context, size: size, time: t, color: Color(white: 0.20), intensity: 0.22, speed: 0.11)

        case .coalFireflies:
            context.fill(Path(fullRect), with: .color(.black))
            drawFloatingMotes(&context, size: size, time: t, color: Color(red: 0.88, green: 0.72, blue: 0.46), count: 14, maxOpacity: 0.30, speed: 0.16)

        case .eclipseHalo:
            context.fill(Path(fullRect), with: .color(.black))
            drawEclipseRing(&context, size: size, time: t, color: Color(white: 0.34), opacity: 0.20, speed: 0.12)

        // MARK: - Green (3)
        case .forestCanopy:
            fillGradient(&context, rect: fullRect, top: baseColors[0], bottom: baseColors[1].opacity(0.5))
            drawDriftingClouds(&context, size: size, time: t, primary: Color(red: 0.22, green: 0.48, blue: 0.28), secondary: Color(red: 0.12, green: 0.32, blue: 0.20), intensity: 0.24, speed: 0.10)

        case .mossFireflies:
            fillGradient(&context, rect: fullRect, top: baseColors[0], bottom: Color(red: 0.04, green: 0.14, blue: 0.08))
            drawFloatingMotes(&context, size: size, time: t, color: Color(red: 0.56, green: 0.82, blue: 0.38), count: 20, maxOpacity: 0.34, speed: 0.20)

        case .pineAurora:
            fillGradient(&context, rect: fullRect, top: baseColors[0], bottom: Color(red: 0.04, green: 0.16, blue: 0.12))
            drawAuroraCurtains(&context, size: size, time: t, colorA: Color(red: 0.20, green: 0.58, blue: 0.40), colorB: Color(red: 0.16, green: 0.44, blue: 0.34), intensity: 0.24)

        // MARK: - Custom 7
        case .amberHearth:
            fillGradient(&context, rect: fullRect, top: Color(red: 0.04, green: 0.02, blue: 0.005), bottom: baseColors[1].opacity(0.55))
            drawBreathingCenter(&context, size: size, time: t, color: Color(red: 0.62, green: 0.28, blue: 0.06), minOpacity: 0.10, maxOpacity: 0.30, speed: 0.15)
            drawRisingMotes(&context, size: size, time: t, color: Color(red: 0.86, green: 0.48, blue: 0.14), count: 14, speed: 11, maxOpacity: 0.30)

        case .twilightPlum:
            fillGradient(&context, rect: fullRect, top: baseColors[0], bottom: baseColors[1].opacity(0.55))
            drawDriftingClouds(&context, size: size, time: t, primary: Color(red: 0.44, green: 0.24, blue: 0.56), secondary: Color(red: 0.28, green: 0.16, blue: 0.40), intensity: 0.24, speed: 0.10)

        case .midnightTeal:
            fillGradient(&context, rect: fullRect, top: baseColors[0], bottom: baseColors[1].opacity(0.6))
            drawWaves(&context, size: size, time: t, color: Color(red: 0.16, green: 0.48, blue: 0.52).opacity(0.22), count: 4, speed: 0.14, amplitude: 22)

        case .sepiaSand:
            fillGradient(&context, rect: fullRect, top: baseColors[0], bottom: baseColors[1].opacity(0.55))
            drawWaves(&context, size: size, time: t, color: Color(red: 0.44, green: 0.32, blue: 0.18).opacity(0.20), count: 3, speed: 0.10, amplitude: 26)

        case .softRosewood:
            fillGradient(&context, rect: fullRect, top: baseColors[0], bottom: Color(red: 0.14, green: 0.05, blue: 0.07))
            drawBreathingCenter(&context, size: size, time: t, color: Color(red: 0.50, green: 0.18, blue: 0.24), minOpacity: 0.08, maxOpacity: 0.28, speed: 0.14)

        case .moonlitLavender:
            fillGradient(&context, rect: fullRect, top: baseColors[0], bottom: baseColors[1].opacity(0.55))
            drawDriftingClouds(&context, size: size, time: t, primary: Color(red: 0.38, green: 0.36, blue: 0.60), secondary: Color(red: 0.24, green: 0.22, blue: 0.44), intensity: 0.22, speed: 0.09)
            drawStarfield(&context, size: size, time: t, starColor: Color(red: 0.80, green: 0.78, blue: 0.96), count: 16, maxOpacity: 0.28, speed: 0.25)

        case .bronzeHorizon:
            fillGradient(&context, rect: fullRect, top: baseColors[0], bottom: Color(red: 0.12, green: 0.08, blue: 0.03))
            drawSweepingGlow(&context, size: size, time: t, color: Color(red: 0.54, green: 0.40, blue: 0.16), intensity: 0.24, speed: 0.12)
        }
    }

    // MARK: - Lightweight Canvas Helpers

    private func fillGradient(_ context: inout GraphicsContext, rect: CGRect, top: Color, bottom: Color) {
        context.fill(
            Path(rect),
            with: .linearGradient(
                Gradient(colors: [top, bottom]),
                startPoint: CGPoint(x: rect.midX, y: 0),
                endPoint: CGPoint(x: rect.midX, y: rect.height)
            )
        )
    }

    private func drawDriftingClouds(_ context: inout GraphicsContext, size: CGSize, time t: TimeInterval, primary: Color, secondary: Color, intensity: Double, speed: Double) {
        let blobs = 4
        for i in 0..<blobs {
            let phase = Double(i) * 1.7
            let cx = size.width * (0.5 + 0.30 * sin(t * speed + phase))
            let cy = size.height * (0.5 + 0.26 * cos(t * (speed * 0.83) + phase * 1.2))
            let radius = max(size.width, size.height) * (0.42 + 0.08 * sin(t * 0.15 + phase))
            let color = (i % 2 == 0) ? primary : secondary
            let rect = CGRect(x: cx - radius, y: cy - radius, width: radius * 2, height: radius * 2)
            context.fill(
                Path(ellipseIn: rect),
                with: .radialGradient(
                    Gradient(colors: [color.opacity(intensity), .clear]),
                    center: CGPoint(x: cx, y: cy),
                    startRadius: 0,
                    endRadius: radius
                )
            )
        }
    }

    private func drawWaves(_ context: inout GraphicsContext, size: CGSize, time t: TimeInterval, color: Color, count: Int, speed: Double, amplitude: CGFloat) {
        for layer in 0..<count {
            let baseY = size.height * (0.38 + CGFloat(layer) * 0.16)
            var path = Path()
            path.move(to: CGPoint(x: 0, y: size.height))
            let steps = 28
            for step in 0...steps {
                let progress = CGFloat(step) / CGFloat(steps)
                let x = size.width * progress
                let angle = Double(progress) * .pi * 2.2 + t * speed + Double(layer) * 1.3
                let y = baseY + CGFloat(sin(angle)) * amplitude
                path.addLine(to: CGPoint(x: x, y: y))
            }
            path.addLine(to: CGPoint(x: size.width, y: size.height))
            path.closeSubpath()
            context.fill(path, with: .color(color))
        }
    }

    private func drawStarfield(_ context: inout GraphicsContext, size: CGSize, time t: TimeInterval, starColor: Color, count: Int, maxOpacity: Double, speed: Double) {
        for i in 0..<count {
            let fx = pseudoUnit(seed: i * 31 + 7)
            let fy = pseudoUnit(seed: i * 53 + 13)
            let radius = 1.0 + pseudoUnit(seed: i * 17 + 3) * 1.8
            let twinkle = 0.25 + 0.75 * (0.5 + 0.5 * sin(t * speed + Double(i) * 1.9))
            let x = size.width * CGFloat(fx)
            let y = size.height * CGFloat(fy)
            let rect = CGRect(x: x - radius, y: y - radius, width: radius * 2, height: radius * 2)
            context.fill(Path(ellipseIn: rect), with: .color(starColor.opacity(maxOpacity * twinkle)))
        }
    }

    private func drawFallingDrops(_ context: inout GraphicsContext, size: CGSize, time t: TimeInterval, color: Color, count: Int, speed: Double) {
        let totalHeight = Double(size.height) + 80.0
        for i in 0..<count {
            let xRatio = pseudoUnit(seed: i * 41 + 5)
            let offset = pseudoUnit(seed: i * 29 + 11) * totalHeight
            let itemSpeed = speed * (0.7 + pseudoUnit(seed: i * 19 + 3) * 0.6)
            let y = (t * itemSpeed + offset).truncatingRemainder(dividingBy: totalHeight) - 40.0
            let x = Double(size.width) * xRatio
            let dropLength = 16.0 + pseudoUnit(seed: i * 13) * 20.0
            let rect = CGRect(x: x, y: y, width: 1.6, height: dropLength)
            context.fill(Path(roundedRect: rect, cornerRadius: 1), with: .color(color.opacity(0.22)))
        }
    }

    private func drawRisingMotes(_ context: inout GraphicsContext, size: CGSize, time t: TimeInterval, color: Color, count: Int, speed: Double, maxOpacity: Double) {
        let totalHeight = Double(size.height) + 60.0
        for i in 0..<count {
            let baseX = pseudoUnit(seed: i * 37 + 9) * Double(size.width)
            let offset = pseudoUnit(seed: i * 43 + 17) * totalHeight
            let itemSpeed = speed * (0.65 + pseudoUnit(seed: i * 23) * 0.7)
            let rawY = (t * itemSpeed + offset).truncatingRemainder(dividingBy: totalHeight)
            let y = Double(size.height) + 30.0 - rawY
            let sway = sin(t * 0.4 + Double(i)) * 18.0
            let r = 2.0 + pseudoUnit(seed: i * 11) * 3.0
            let verticalFade = sin(min(max(rawY / totalHeight, 0.0), 1.0) * .pi)
            let rect = CGRect(x: baseX + sway - r, y: y - r, width: r * 2, height: r * 2)
            context.fill(Path(ellipseIn: rect), with: .color(color.opacity(maxOpacity * verticalFade)))
        }
    }

    private func drawFloatingMotes(_ context: inout GraphicsContext, size: CGSize, time t: TimeInterval, color: Color, count: Int, maxOpacity: Double, speed: Double) {
        for i in 0..<count {
            let bx = pseudoUnit(seed: i * 47 + 3)
            let by = pseudoUnit(seed: i * 61 + 19)
            let x = Double(size.width) * bx + sin(t * speed + Double(i) * 1.4) * 36.0
            let y = Double(size.height) * by + cos(t * (speed * 0.8) + Double(i) * 2.1) * 28.0
            let r = 1.6 + pseudoUnit(seed: i * 15) * 2.6
            let pulse = 0.35 + 0.65 * (0.5 + 0.5 * sin(t * 0.35 + Double(i) * 1.7))
            let rect = CGRect(x: x - r, y: y - r, width: r * 2, height: r * 2)
            context.fill(Path(ellipseIn: rect), with: .color(color.opacity(maxOpacity * pulse)))
        }
    }

    private func drawRipples(_ context: inout GraphicsContext, size: CGSize, time t: TimeInterval, color: Color, count: Int, speed: Double, maxOpacity: Double) {
        let center = CGPoint(x: size.width / 2, y: size.height / 2)
        let maxRadius = hypot(size.width, size.height) * 0.55
        for i in 0..<count {
            let phase = (t * speed + Double(i) / Double(count)).truncatingRemainder(dividingBy: 1.0)
            let radius = maxRadius * CGFloat(phase)
            let fade = sin(phase * .pi)
            let rect = CGRect(x: center.x - radius, y: center.y - radius, width: radius * 2, height: radius * 2)
            context.stroke(Path(ellipseIn: rect), with: .color(color.opacity(maxOpacity * fade)), lineWidth: 1.5)
        }
    }

    private func drawAuroraCurtains(_ context: inout GraphicsContext, size: CGSize, time t: TimeInterval, colorA: Color, colorB: Color, intensity: Double) {
        let ribbons = 5
        for i in 0..<ribbons {
            let fraction = Double(i) / Double(ribbons - 1)
            let xCenter = size.width * CGFloat(0.14 + 0.72 * fraction) + CGFloat(sin(t * 0.14 + Double(i)) * 45.0)
            let ribbonWidth = size.width * 0.28
            let yShift = CGFloat(cos(t * 0.11 + Double(i) * 1.5) * 40.0)
            let rect = CGRect(x: xCenter - ribbonWidth / 2, y: -60 + yShift, width: ribbonWidth, height: size.height * 0.88)
            let color = (i % 2 == 0) ? colorA : colorB
            context.fill(
                Path(ellipseIn: rect),
                with: .radialGradient(
                    Gradient(colors: [color.opacity(intensity), .clear]),
                    center: CGPoint(x: rect.midX, y: rect.midY),
                    startRadius: 0,
                    endRadius: ribbonWidth * 0.85
                )
            )
        }
    }

    private func drawBreathingCenter(_ context: inout GraphicsContext, size: CGSize, time t: TimeInterval, color: Color, minOpacity: Double, maxOpacity: Double, speed: Double) {
        let breath = 0.5 + 0.5 * sin(t * speed)
        let opacity = minOpacity + (maxOpacity - minOpacity) * breath
        let radius = max(size.width, size.height) * CGFloat(0.45 + 0.08 * breath)
        let center = CGPoint(x: size.width / 2, y: size.height / 2)
        let rect = CGRect(x: center.x - radius, y: center.y - radius, width: radius * 2, height: radius * 2)
        context.fill(
            Path(ellipseIn: rect),
            with: .radialGradient(
                Gradient(colors: [color.opacity(opacity), .clear]),
                center: center,
                startRadius: 0,
                endRadius: radius
            )
        )
    }

    private func drawSweepingGlow(_ context: inout GraphicsContext, size: CGSize, time t: TimeInterval, color: Color, intensity: Double, speed: Double) {
        let cx = size.width * CGFloat(0.5 + 0.28 * sin(t * speed))
        let cy = size.height * CGFloat(0.55 + 0.12 * cos(t * speed * 2.0))
        let radius = max(size.width, size.height) * 0.48
        let rect = CGRect(x: cx - radius, y: cy - radius, width: radius * 2, height: radius * 2)
        context.fill(
            Path(ellipseIn: rect),
            with: .radialGradient(
                Gradient(colors: [color.opacity(intensity), .clear]),
                center: CGPoint(x: cx, y: cy),
                startRadius: 0,
                endRadius: radius
            )
        )
    }

    private func drawDotMatrix(_ context: inout GraphicsContext, size: CGSize, time t: TimeInterval, color: Color, maxOpacity: Double, speed: Double) {
        let spacing: CGFloat = 54
        let cols = Int(size.width / spacing) + 1
        let rows = Int(size.height / spacing) + 1
        for row in 0..<rows {
            for col in 0..<cols {
                let wave = 0.5 + 0.5 * sin(t * speed + Double(col) * 0.45 + Double(row) * 0.45)
                let x = CGFloat(col) * spacing + spacing * 0.5
                let y = CGFloat(row) * spacing + spacing * 0.5
                let r: CGFloat = 1.8
                let rect = CGRect(x: x - r, y: y - r, width: r * 2, height: r * 2)
                context.fill(Path(ellipseIn: rect), with: .color(color.opacity(maxOpacity * wave)))
            }
        }
    }

    private func drawEclipseRing(_ context: inout GraphicsContext, size: CGSize, time t: TimeInterval, color: Color, opacity: Double, speed: Double) {
        let center = CGPoint(x: size.width / 2, y: size.height / 2)
        let radius = min(size.width, size.height) * 0.36
        let rect = CGRect(x: center.x - radius, y: center.y - radius, width: radius * 2, height: radius * 2)
        let startDeg = (t * speed * 18.0).truncatingRemainder(dividingBy: 360.0)
        context.stroke(
            Path(ellipseIn: rect),
            with: .conicGradient(
                Gradient(colors: [color.opacity(opacity), .clear, color.opacity(opacity * 0.35), .clear]),
                center: center,
                angle: .degrees(startDeg)
            ),
            lineWidth: 3.0
        )
    }

    private func pseudoUnit(seed: Int) -> Double {
        let x = sin(Double(seed) * 12.9898 + 78.233) * 43758.5453
        return x - floor(x)
    }
}
