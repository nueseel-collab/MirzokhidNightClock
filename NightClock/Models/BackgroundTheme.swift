import SwiftUI

enum BackgroundCategory: String, CaseIterable, Identifiable {
    case blue
    case darkBlue
    case red
    case gray
    case black
    case green
    case custom

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .blue:
            return "Blue (5)"
        case .darkBlue:
            return "Dark Blue (5)"
        case .red:
            return "Red (2)"
        case .gray:
            return "Gray (3)"
        case .black:
            return "Black (5)"
        case .green:
            return "Green (3)"
        case .custom:
            return "Sleep & Warm Custom (7)"
        }
    }
}

enum BackgroundTheme: String, CaseIterable, Identifiable {
    // Blue (5)
    case blueHorizon
    case ceruleanMist
    case sapphireRain
    case cobaltRipples
    case glacierAurora

    // Dark Blue (5)
    case midnightSwell
    case abyssalStars
    case indigoNebula
    case harborBeacon
    case nocturneDots

    // Red (2)
    case crimsonEmbers
    case rubyBreath

    // Gray (3)
    case silverFog
    case pebbleRings
    case graphiteDust

    // Black (5)
    case voidPulse
    case obsidianStars
    case shadowPendulum
    case coalFireflies
    case eclipseHalo

    // Green (3)
    case forestCanopy
    case mossFireflies
    case pineAurora

    // Custom 7
    case amberHearth
    case twilightPlum
    case midnightTeal
    case sepiaSand
    case softRosewood
    case moonlitLavender
    case bronzeHorizon

    var id: String { rawValue }

    var category: BackgroundCategory {
        switch self {
        case .blueHorizon, .ceruleanMist, .sapphireRain, .cobaltRipples, .glacierAurora:
            return .blue
        case .midnightSwell, .abyssalStars, .indigoNebula, .harborBeacon, .nocturneDots:
            return .darkBlue
        case .crimsonEmbers, .rubyBreath:
            return .red
        case .silverFog, .pebbleRings, .graphiteDust:
            return .gray
        case .voidPulse, .obsidianStars, .shadowPendulum, .coalFireflies, .eclipseHalo:
            return .black
        case .forestCanopy, .mossFireflies, .pineAurora:
            return .green
        case .amberHearth, .twilightPlum, .midnightTeal, .sepiaSand, .softRosewood, .moonlitLavender, .bronzeHorizon:
            return .custom
        }
    }

    var displayName: String {
        switch self {
        case .blueHorizon: return "Blue Horizon"
        case .ceruleanMist: return "Cerulean Mist"
        case .sapphireRain: return "Sapphire Rain"
        case .cobaltRipples: return "Cobalt Ripples"
        case .glacierAurora: return "Glacier Aurora"

        case .midnightSwell: return "Midnight Swell"
        case .abyssalStars: return "Abyssal Stars"
        case .indigoNebula: return "Indigo Nebula"
        case .harborBeacon: return "Harbor Glow"
        case .nocturneDots: return "Nocturne Matrix"

        case .crimsonEmbers: return "Crimson Embers"
        case .rubyBreath: return "Ruby Breath"

        case .silverFog: return "Silver Fog"
        case .pebbleRings: return "Pebble Rings"
        case .graphiteDust: return "Graphite Dust"

        case .voidPulse: return "Pure Void Pulse"
        case .obsidianStars: return "Obsidian Sky"
        case .shadowPendulum: return "Shadow Arc"
        case .coalFireflies: return "Coal Fireflies"
        case .eclipseHalo: return "Eclipse Halo"

        case .forestCanopy: return "Forest Canopy"
        case .mossFireflies: return "Moss Fireflies"
        case .pineAurora: return "Pine Aurora"

        case .amberHearth: return "Warm Amber Hearth"
        case .twilightPlum: return "Twilight Plum"
        case .midnightTeal: return "Midnight Teal"
        case .sepiaSand: return "Sepia Sand"
        case .softRosewood: return "Soft Rosewood"
        case .moonlitLavender: return "Moonlit Lavender"
        case .bronzeHorizon: return "Bronze Horizon"
        }
    }

    var subtitle: String {
        switch self {
        case .blueHorizon: return "Slow ocean-blue wave bands"
        case .ceruleanMist: return "Soft breathing sky-blue clouds"
        case .sapphireRain: return "Gentle drifting blue light drops"
        case .cobaltRipples: return "Calm expanding blue rings"
        case .glacierAurora: return "Soft vertical northern blue curtains"

        case .midnightSwell: return "Deep navy rolling tide"
        case .abyssalStars: return "Sparse slow-fading night stars"
        case .indigoNebula: return "Drifting dark indigo cosmos"
        case .harborBeacon: return "Slow deep-navy pendulum glow"
        case .nocturneDots: return "Subtle breathing dot grid"

        case .crimsonEmbers: return "Rising low-light warm red embers"
        case .rubyBreath: return "Ultra-calm dark red vignette"

        case .silverFog: return "Drifting muted slate mist"
        case .pebbleRings: return "Quiet gray water ripples"
        case .graphiteDust: return "Slow floating neutral dust motes"

        case .voidPulse: return "Near-black 20-second soft pulse"
        case .obsidianStars: return "Pitch-black with faint pinprick stars"
        case .shadowPendulum: return "Pitch-black with drifting charcoal arc"
        case .coalFireflies: return "Black floor with tiny warm specs"
        case .eclipseHalo: return "Dark rotating eclipse ring"

        case .forestCanopy: return "Muted sage breathing light"
        case .mossFireflies: return "Deep pine with gentle fireflies"
        case .pineAurora: return "Slow emerald night ribbons"

        case .amberHearth: return "Blue-light-free warm ember glow"
        case .twilightPlum: return "Muted dusty-violet drifting clouds"
        case .midnightTeal: return "Deep sea-glass night wave"
        case .sepiaSand: return "Soft shifting warm-brown dunes"
        case .softRosewood: return "Gentle dark dusty-rose breath"
        case .moonlitLavender: return "Soft slate-lavender mist drift"
        case .bronzeHorizon: return "Faint warm-gold shimmer on black"
        }
    }

    var previewColors: [Color] {
        switch self {
        case .blueHorizon: return [Color(red: 0.05, green: 0.14, blue: 0.28), Color(red: 0.12, green: 0.30, blue: 0.52)]
        case .ceruleanMist: return [Color(red: 0.06, green: 0.18, blue: 0.32), Color(red: 0.15, green: 0.36, blue: 0.56)]
        case .sapphireRain: return [Color(red: 0.04, green: 0.11, blue: 0.24), Color(red: 0.18, green: 0.38, blue: 0.66)]
        case .cobaltRipples: return [Color(red: 0.05, green: 0.12, blue: 0.26), Color(red: 0.14, green: 0.28, blue: 0.58)]
        case .glacierAurora: return [Color(red: 0.04, green: 0.15, blue: 0.26), Color(red: 0.16, green: 0.40, blue: 0.56)]

        case .midnightSwell: return [Color(red: 0.02, green: 0.04, blue: 0.11), Color(red: 0.06, green: 0.11, blue: 0.24)]
        case .abyssalStars: return [Color(red: 0.01, green: 0.03, blue: 0.09), Color(red: 0.08, green: 0.14, blue: 0.28)]
        case .indigoNebula: return [Color(red: 0.02, green: 0.03, blue: 0.10), Color(red: 0.11, green: 0.10, blue: 0.30)]
        case .harborBeacon: return [Color(red: 0.02, green: 0.04, blue: 0.10), Color(red: 0.09, green: 0.16, blue: 0.32)]
        case .nocturneDots: return [Color(red: 0.02, green: 0.04, blue: 0.09), Color(red: 0.07, green: 0.13, blue: 0.26)]

        case .crimsonEmbers: return [Color(red: 0.07, green: 0.01, blue: 0.01), Color(red: 0.34, green: 0.06, blue: 0.05)]
        case .rubyBreath: return [Color(red: 0.05, green: 0.01, blue: 0.02), Color(red: 0.26, green: 0.04, blue: 0.06)]

        case .silverFog: return [Color(red: 0.08, green: 0.09, blue: 0.10), Color(red: 0.22, green: 0.24, blue: 0.26)]
        case .pebbleRings: return [Color(red: 0.07, green: 0.08, blue: 0.09), Color(red: 0.20, green: 0.21, blue: 0.23)]
        case .graphiteDust: return [Color(red: 0.06, green: 0.06, blue: 0.07), Color(red: 0.18, green: 0.19, blue: 0.20)]

        case .voidPulse: return [Color.black, Color(red: 0.06, green: 0.06, blue: 0.08)]
        case .obsidianStars: return [Color.black, Color(red: 0.10, green: 0.11, blue: 0.14)]
        case .shadowPendulum: return [Color.black, Color(red: 0.08, green: 0.08, blue: 0.10)]
        case .coalFireflies: return [Color.black, Color(red: 0.14, green: 0.12, blue: 0.09)]
        case .eclipseHalo: return [Color.black, Color(red: 0.12, green: 0.12, blue: 0.15)]

        case .forestCanopy: return [Color(red: 0.02, green: 0.08, blue: 0.04), Color(red: 0.10, green: 0.24, blue: 0.14)]
        case .mossFireflies: return [Color(red: 0.02, green: 0.07, blue: 0.04), Color(red: 0.16, green: 0.30, blue: 0.14)]
        case .pineAurora: return [Color(red: 0.02, green: 0.08, blue: 0.06), Color(red: 0.10, green: 0.28, blue: 0.20)]

        case .amberHearth: return [Color(red: 0.06, green: 0.03, blue: 0.01), Color(red: 0.32, green: 0.15, blue: 0.04)]
        case .twilightPlum: return [Color(red: 0.06, green: 0.03, blue: 0.09), Color(red: 0.20, green: 0.11, blue: 0.26)]
        case .midnightTeal: return [Color(red: 0.02, green: 0.08, blue: 0.09), Color(red: 0.08, green: 0.24, blue: 0.26)]
        case .sepiaSand: return [Color(red: 0.07, green: 0.05, blue: 0.03), Color(red: 0.22, green: 0.16, blue: 0.10)]
        case .softRosewood: return [Color(red: 0.07, green: 0.03, blue: 0.04), Color(red: 0.24, green: 0.10, blue: 0.13)]
        case .moonlitLavender: return [Color(red: 0.05, green: 0.05, blue: 0.10), Color(red: 0.18, green: 0.17, blue: 0.29)]
        case .bronzeHorizon: return [Color(red: 0.03, green: 0.02, blue: 0.01), Color(red: 0.24, green: 0.18, blue: 0.08)]
        }
    }

    static func themes(in category: BackgroundCategory) -> [BackgroundTheme] {
        allCases.filter { $0.category == category }
    }
}
