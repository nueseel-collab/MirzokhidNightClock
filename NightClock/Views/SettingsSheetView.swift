import SwiftUI

struct SettingsSheetView: View {
    @EnvironmentObject private var settings: ClockSettings
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    brightnessCard
                    timeDisplayCard
                    clockFontCard
                    clockColorCard
                    backgroundsCard
                    overnightTipsCard
                }
                .padding(20)
            }
            .background(Color(red: 0.07, green: 0.07, blue: 0.09).ignoresSafeArea())
            .navigationTitle("Night Clock Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                    .font(.headline)
                }
            }
        }
        .navigationViewStyle(.stack)
        .preferredColorScheme(.dark)
    }

    // MARK: - Cards

    private var brightnessCard: some View {
        SettingsCard(title: "Bedroom Brightness & Protection") {
            Toggle(isOn: $settings.veryDimMode) {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Very Dim Mode")
                        .font(.headline)
                    Text("Ultra-low-light mode for a pitch-black bedroom")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .tint(.orange)

            Divider().opacity(0.3)

            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text("Clock Brightness")
                    Spacer()
                    Text("\(Int(settings.clockBrightness * 100))%")
                        .foregroundColor(.secondary)
                        .monospacedDigit()
                }
                Slider(value: $settings.clockBrightness, in: 0.15...1.0, step: 0.05)
                    .tint(.orange)
            }

            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text("Background Brightness")
                    Spacer()
                    Text("\(Int(settings.backgroundBrightness * 100))%")
                        .foregroundColor(.secondary)
                        .monospacedDigit()
                }
                Slider(value: $settings.backgroundBrightness, in: 0.0...1.0, step: 0.05)
                    .tint(.blue)
            }

            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text("Clock Size")
                    Spacer()
                    Text("\(Int(settings.clockScale * 100))%")
                        .foregroundColor(.secondary)
                        .monospacedDigit()
                }
                Slider(value: $settings.clockScale, in: 0.70...1.30, step: 0.05)
                    .tint(.gray)
            }

            Divider().opacity(0.3)

            Toggle(isOn: $settings.pixelShiftEnabled) {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Gentle Pixel Shift")
                        .font(.subheadline.weight(.medium))
                    Text("Subtly drifts the clock to reduce overnight image retention")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .tint(.green)
        }
    }

    private var timeDisplayCard: some View {
        SettingsCard(title: "Time Format") {
            Toggle("24-Hour Time", isOn: $settings.use24HourTime)
                .tint(.blue)
            Divider().opacity(0.3)
            Toggle("Show Seconds", isOn: $settings.showSeconds)
                .tint(.blue)
            Divider().opacity(0.3)
            Toggle("Show Day & Date", isOn: $settings.showDate)
                .tint(.blue)
        }
    }

    private var clockFontCard: some View {
        SettingsCard(title: "Clock Font") {
            VStack(spacing: 10) {
                ForEach(ClockFontOption.allCases) { option in
                    let isSelected = settings.selectedFont == option
                    Button {
                        settings.selectedFont = option
                    } label: {
                        HStack(spacing: 14) {
                            Text("10:45")
                                .font(option.font(size: 28))
                                .monospacedDigit()
                                .frame(width: 96, alignment: .leading)
                                .foregroundColor(.white)

                            VStack(alignment: .leading, spacing: 2) {
                                Text(option.displayName)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(option.subtitle)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }

                            Spacer()

                            if isSelected {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.title3)
                            }
                        }
                        .padding(12)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(isSelected ? Color.blue.opacity(0.20) : Color.white.opacity(0.05))
                        )
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }

    private var clockColorCard: some View {
        SettingsCard(title: "Clock Color") {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 140), spacing: 10)], spacing: 10) {
                ForEach(ClockColorOption.allCases) { option in
                    let isSelected = settings.selectedClockColor == option
                    Button {
                        settings.selectedClockColor = option
                    } label: {
                        HStack(spacing: 10) {
                            Circle()
                                .fill(option.color)
                                .frame(width: 18, height: 18)
                            Text(option.displayName)
                                .font(.subheadline.weight(.medium))
                                .foregroundColor(.white)
                            Spacer()
                            if isSelected {
                                Image(systemName: "checkmark")
                                    .font(.caption.bold())
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 10)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(isSelected ? Color.white.opacity(0.14) : Color.white.opacity(0.05))
                        )
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }

    private var backgroundsCard: some View {
        SettingsCard(title: "Animated Backgrounds (30)") {
            VStack(alignment: .leading, spacing: 18) {
                ForEach(BackgroundCategory.allCases) { category in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(category.displayName)
                            .font(.subheadline.weight(.semibold))
                            .foregroundColor(.secondary)
                            .padding(.top, 4)

                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 190), spacing: 10)], spacing: 10) {
                            ForEach(BackgroundTheme.themes(in: category)) { theme in
                                let isSelected = settings.selectedBackground == theme
                                Button {
                                    withAnimation(.easeInOut(duration: 0.45)) {
                                        settings.selectedBackground = theme
                                    }
                                } label: {
                                    HStack(spacing: 12) {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(
                                                LinearGradient(
                                                    colors: theme.previewColors,
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing
                                                )
                                            )
                                            .frame(width: 42, height: 42)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 8)
                                                    .stroke(Color.white.opacity(0.18), lineWidth: 1)
                                            )

                                        VStack(alignment: .leading, spacing: 2) {
                                            Text(theme.displayName)
                                                .font(.subheadline.weight(.semibold))
                                                .foregroundColor(.white)
                                                .lineLimit(1)
                                            Text(theme.subtitle)
                                                .font(.caption2)
                                                .foregroundColor(.secondary)
                                                .lineLimit(2)
                                        }

                                        Spacer(minLength: 4)

                                        if isSelected {
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundColor(.blue)
                                        }
                                    }
                                    .padding(10)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(isSelected ? Color.blue.opacity(0.22) : Color.white.opacity(0.05))
                                    )
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                }
            }
        }
    }

    private var overnightTipsCard: some View {
        SettingsCard(title: "Overnight iPad Tips") {
            VStack(alignment: .leading, spacing: 8) {
                Text("• Keep the iPad plugged into its charger overnight—this app keeps the screen awake while open.")
                Text("• If the room is still too bright, lower the iPad Control Center brightness slider and turn on Very Dim Mode above.")
                Text("• Optional: Turn on Night Shift in iPad Settings → Display & Brightness for warmer evening colors.")
            }
            .font(.caption)
            .foregroundColor(.secondary)
        }
    }
}

private struct SettingsCard<Content: View>: View {
    let title: String
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)

            VStack(alignment: .leading, spacing: 12) {
                content
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.opacity(0.06))
            )
        }
    }
}
