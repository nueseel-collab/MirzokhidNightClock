import SwiftUI

enum ClockFontOption: String, CaseIterable, Identifiable {
    case rounded
    case sans
    case monospaced
    case serif
    case boldDisplay

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .rounded:
            return "Soft Rounded"
        case .sans:
            return "Classic Clean"
        case .monospaced:
            return "Digital Mono"
        case .serif:
            return "Editorial Serif"
        case .boldDisplay:
            return "Bold Display"
        }
    }

    var subtitle: String {
        switch self {
        case .rounded:
            return "Gentle, smooth numerals"
        case .sans:
            return "Crisp modern sans-serif"
        case .monospaced:
            return "Fixed-width digital feel"
        case .serif:
            return "Classic warm typography"
        case .boldDisplay:
            return "Extra thick for easy distance reading"
        }
    }

    func font(size: CGFloat) -> Font {
        switch self {
        case .rounded:
            return .system(size: size, weight: .semibold, design: .rounded)
        case .sans:
            return .system(size: size, weight: .medium, design: .default)
        case .monospaced:
            return .system(size: size, weight: .medium, design: .monospaced)
        case .serif:
            return .system(size: size, weight: .semibold, design: .serif)
        case .boldDisplay:
            return .system(size: size, weight: .heavy, design: .rounded)
        }
    }
}

enum ClockColorOption: String, CaseIterable, Identifiable {
    case warmCream
    case softWhite
    case nightRed
    case warmAmber
    case paleBlue
    case sageGreen

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .warmCream:
            return "Warm Cream"
        case .softWhite:
            return "Soft White"
        case .nightRed:
            return "Night Red"
        case .warmAmber:
            return "Warm Amber"
        case .paleBlue:
            return "Pale Blue"
        case .sageGreen:
            return "Soft Sage"
        }
    }

    var color: Color {
        switch self {
        case .warmCream:
            return Color(red: 0.95, green: 0.91, blue: 0.82)
        case .softWhite:
            return Color(red: 0.88, green: 0.90, blue: 0.93)
        case .nightRed:
            return Color(red: 0.88, green: 0.24, blue: 0.22)
        case .warmAmber:
            return Color(red: 0.92, green: 0.58, blue: 0.24)
        case .paleBlue:
            return Color(red: 0.65, green: 0.80, blue: 0.96)
        case .sageGreen:
            return Color(red: 0.64, green: 0.84, blue: 0.68)
        }
    }
}

final class ClockSettings: ObservableObject {
    @AppStorage("selectedBackgroundID") var selectedBackgroundID: String = BackgroundTheme.abyssalStars.rawValue
    @AppStorage("selectedFontID") var selectedFontID: String = ClockFontOption.rounded.rawValue
    @AppStorage("selectedClockColorID") var selectedClockColorID: String = ClockColorOption.warmCream.rawValue
    @AppStorage("use24HourTime") var use24HourTime: Bool = false
    @AppStorage("showSeconds") var showSeconds: Bool = false
    @AppStorage("showDate") var showDate: Bool = true
    @AppStorage("veryDimMode") var veryDimMode: Bool = false
    @AppStorage("clockBrightness") var clockBrightness: Double = 0.85
    @AppStorage("backgroundBrightness") var backgroundBrightness: Double = 0.65
    @AppStorage("pixelShiftEnabled") var pixelShiftEnabled: Bool = true
    @AppStorage("clockScale") var clockScale: Double = 1.0

    var selectedBackground: BackgroundTheme {
        get { BackgroundTheme(rawValue: selectedBackgroundID) ?? .abyssalStars }
        set { selectedBackgroundID = newValue.rawValue }
    }

    var selectedFont: ClockFontOption {
        get { ClockFontOption(rawValue: selectedFontID) ?? .rounded }
        set { selectedFontID = newValue.rawValue }
    }

    var selectedClockColor: ClockColorOption {
        get { ClockColorOption(rawValue: selectedClockColorID) ?? .warmCream }
        set { selectedClockColorID = newValue.rawValue }
    }

    var effectiveClockOpacity: Double {
        let clamped = min(max(clockBrightness, 0.15), 1.0)
        return veryDimMode ? clamped * 0.34 : clamped
    }

    var effectiveBackgroundOpacity: Double {
        let clamped = min(max(backgroundBrightness, 0.0), 1.0)
        return veryDimMode ? clamped * 0.26 : clamped
    }
}
