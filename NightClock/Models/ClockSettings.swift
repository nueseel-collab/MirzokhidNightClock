import SwiftUI

enum AppLanguage: String, CaseIterable, Identifiable {
    case english
    case russian

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .english:
            return "English"
        case .russian:
            return "Русский"
        }
    }
}

enum ClockFontOption: String, CaseIterable, Identifiable {
    case rounded
    case sans
    case monospaced
    case serif
    case boldDisplay

    var id: String { rawValue }

    func displayName(for language: AppLanguage) -> String {
        switch (self, language) {
        case (.rounded, .english): return "Soft Rounded"
        case (.rounded, .russian): return "Мягкий округлый"
        case (.sans, .english): return "Classic Clean"
        case (.sans, .russian): return "Классический ровный"
        case (.monospaced, .english): return "Digital Mono"
        case (.monospaced, .russian): return "Цифровой моно"
        case (.serif, .english): return "Editorial Serif"
        case (.serif, .russian): return "Книжный с засечками"
        case (.boldDisplay, .english): return "Bold Display"
        case (.boldDisplay, .russian): return "Крупный жирный"
        }
    }

    func subtitle(for language: AppLanguage) -> String {
        switch (self, language) {
        case (.rounded, .english): return "Gentle, smooth numerals"
        case (.rounded, .russian): return "Плавные и мягкие цифры"
        case (.sans, .english): return "Crisp modern sans-serif"
        case (.sans, .russian): return "Чёткий современный шрифт"
        case (.monospaced, .english): return "Fixed-width digital feel"
        case (.monospaced, .russian): return "Ровная ширина всех цифр"
        case (.serif, .english): return "Classic warm typography"
        case (.serif, .russian): return "Классический тёплый стиль"
        case (.boldDisplay, .english): return "Extra thick for easy distance reading"
        case (.boldDisplay, .russian): return "Утолщённый — легко читать издалека"
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

    func displayName(for language: AppLanguage) -> String {
        switch (self, language) {
        case (.warmCream, .english): return "Warm Cream"
        case (.warmCream, .russian): return "Тёплый кремовый"
        case (.softWhite, .english): return "Soft White"
        case (.softWhite, .russian): return "Мягкий белый"
        case (.nightRed, .english): return "Night Red"
        case (.nightRed, .russian): return "Ночной красный"
        case (.warmAmber, .english): return "Warm Amber"
        case (.warmAmber, .russian): return "Тёплый янтарь"
        case (.paleBlue, .english): return "Pale Blue"
        case (.paleBlue, .russian): return "Нежно-голубой"
        case (.sageGreen, .english): return "Soft Sage"
        case (.sageGreen, .russian): return "Мягкий шалфей"
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
    @AppStorage("appLanguage") var appLanguageID: String = AppLanguage.english.rawValue
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

    var selectedLanguage: AppLanguage {
        get { AppLanguage(rawValue: appLanguageID) ?? .english }
        set { appLanguageID = newValue.rawValue }
    }

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
