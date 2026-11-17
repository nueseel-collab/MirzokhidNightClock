import SwiftUI

struct ClockDisplayView: View {
    @EnvironmentObject private var settings: ClockSettings

    var body: some View {
        TimelineView(.periodic(from: .now, by: 1.0)) { timeline in
            let now = timeline.date
            let shift = pixelShiftOffset(for: now)

            GeometryReader { geometry in
                let baseSize = min(geometry.size.width * 0.24, geometry.size.height * 0.38)
                let scaledFontSize = max(56, min(baseSize * CGFloat(settings.clockScale), 230))

                VStack(spacing: 12) {
                    HStack(alignment: .firstTextBaseline, spacing: 14) {
                        Text(formattedTime(from: now))
                            .font(settings.selectedFont.font(size: scaledFontSize))
                            .monospacedDigit()
                            .lineLimit(1)
                            .minimumScaleFactor(0.35)

                        if !settings.use24HourTime {
                            Text(formattedMeridiem(from: now))
                                .font(.system(size: max(20, scaledFontSize * 0.20), weight: .semibold, design: .rounded))
                                .opacity(0.75)
                        }
                    }

                    if settings.showDate {
                        Text(formattedDate(from: now))
                            .font(.system(size: max(18, scaledFontSize * 0.16), weight: .medium, design: .rounded))
                            .opacity(0.72)
                    }
                }
                .foregroundColor(settings.selectedClockColor.color)
                .opacity(settings.effectiveClockOpacity)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.horizontal, 28)
                .offset(shift)
                .animation(.easeInOut(duration: 1.5), value: shift)
            }
        }
    }

    private func pixelShiftOffset(for date: Date) -> CGSize {
        guard settings.pixelShiftEnabled else { return .zero }
        let t = date.timeIntervalSinceReferenceDate
        // Smooth, unnoticeable multi-minute drift (~6-8 min cycle) to prevent static image retention.
        let dx = sin(t * 0.017) * 14.0
        let dy = cos(t * 0.013) * 10.0
        return CGSize(width: dx, height: dy)
    }

    private func formattedTime(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        if settings.use24HourTime {
            formatter.dateFormat = settings.showSeconds ? "HH:mm:ss" : "HH:mm"
        } else {
            formatter.dateFormat = settings.showSeconds ? "h:mm:ss" : "h:mm"
        }
        return formatter.string(from: date)
    }

    private func formattedMeridiem(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "a"
        return formatter.string(from: date)
    }

    private func formattedDate(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d"
        return formatter.string(from: date)
    }
}
