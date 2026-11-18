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

    func displayName(for language: AppLanguage) -> String {
        switch (self, language) {
        case (.blue, .english): return "Blue (5)"
        case (.blue, .russian): return "Синие (5)"
        case (.darkBlue, .english): return "Dark Blue (5)"
        case (.darkBlue, .russian): return "Тёмно-синие (5)"
        case (.red, .english): return "Red (2)"
        case (.red, .russian): return "Красные (2)"
        case (.gray, .english): return "Gray (3)"
        case (.gray, .russian): return "Серые (3)"
        case (.black, .english): return "Black (5)"
        case (.black, .russian): return "Чёрные (5)"
        case (.green, .english): return "Green (3)"
        case (.green, .russian): return "Зелёные (3)"
        case (.custom, .english): return "Sleep & Warm Custom (7)"
        case (.custom, .russian): return "Тёплые для сна (7)"
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

    func displayName(for language: AppLanguage) -> String {
        switch language {
        case .english:
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

        case .russian:
            switch self {
            case .blueHorizon: return "Синий горизонт"
            case .ceruleanMist: return "Лазурный туман"
            case .sapphireRain: return "Сапфировый дождь"
            case .cobaltRipples: return "Кобальтовые круги"
            case .glacierAurora: return "Ледяное сияние"

            case .midnightSwell: return "Полуночная волна"
            case .abyssalStars: return "Глубокие звёзды"
            case .indigoNebula: return "Туманность индиго"
            case .harborBeacon: return "Свет гавани"
            case .nocturneDots: return "Ночная матрица"

            case .crimsonEmbers: return "Алые искры"
            case .rubyBreath: return "Рубиновое дыхание"

            case .silverFog: return "Серебристый туман"
            case .pebbleRings: return "Тихая рябь"
            case .graphiteDust: return "Графитовая пыль"

            case .voidPulse: return "Пульс пустоты"
            case .obsidianStars: return "Обсидиановое небо"
            case .shadowPendulum: return "Теневая дуга"
            case .coalFireflies: return "Угольные светлячки"
            case .eclipseHalo: return "Кольцо затмения"

            case .forestCanopy: return "Лесной полог"
            case .mossFireflies: return "Лесные светлячки"
            case .pineAurora: return "Изумрудное сияние"

            case .amberHearth: return "Тёплый очаг"
            case .twilightPlum: return "Сумеречная слива"
            case .midnightTeal: return "Ночная бирюза"
            case .sepiaSand: return "Ночные дюны"
            case .softRosewood: return "Пыльная роза"
            case .moonlitLavender: return "Лунная лаванда"
            case .bronzeHorizon: return "Бронзовый горизонт"
            }
        }
    }

    func subtitle(for language: AppLanguage) -> String {
        switch language {
        case .english:
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

        case .russian:
            switch self {
            case .blueHorizon: return "Плавные синие морские волны"
            case .ceruleanMist: return "Мягкие плывущие облака"
            case .sapphireRain: return "Медленные падающие капли света"
            case .cobaltRipples: return "Спокойные расходящиеся круги"
            case .glacierAurora: return "Мягкое северное сияние"

            case .midnightSwell: return "Глубокий тёмно-синий прилив"
            case .abyssalStars: return "Редкие мерцающие звёзды"
            case .indigoNebula: return "Плывущий космос оттенка индиго"
            case .harborBeacon: return "Медленный маятник мягкого света"
            case .nocturneDots: return "Незаметно дышащая сетка точек"

            case .crimsonEmbers: return "Тёплые красные искорки вверх"
            case .rubyBreath: return "Очень спокойное бордовое свечение"

            case .silverFog: return "Плывущая серая дымка"
            case .pebbleRings: return "Тихие круги по тёмной воде"
            case .graphiteDust: return "Медленные нейтральные пылинки"

            case .voidPulse: return "Почти чёрный 20-секундный пульс"
            case .obsidianStars: return "Чёрное небо и слабые звёздочки"
            case .shadowPendulum: return "Чёрный фон с мягкой тенью"
            case .coalFireflies: return "Чёрный фон и тёплые огоньки"
            case .eclipseHalo: return "Тёмное вращающееся кольцо"

            case .forestCanopy: return "Мягкий приглушённый лесной свет"
            case .mossFireflies: return "Тёмная хвоя и тихие светлячки"
            case .pineAurora: return "Плавные изумрудные ленты"

            case .amberHearth: return "Без синего света — тёплый уют"
            case .twilightPlum: return "Пыльно-фиолетовые облака"
            case .midnightTeal: return "Глубокая волна морского стекла"
            case .sepiaSand: return "Плавные тёпло-коричневые дюны"
            case .softRosewood: return "Мягкое дыхание тёмной розы"
            case .moonlitLavender: return "Спокойная лавандовая дымка"
            case .bronzeHorizon: return "Лёгкий золотистый отблеск"
            }
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
