import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var settings: ClockSettings
    @State private var showControls = true
    @State private var showSettings = false
    @State private var hideWorkItem: DispatchWorkItem?

    private var isRu: Bool {
        settings.selectedLanguage == .russian
    }

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            AnimatedBackgroundView(theme: settings.selectedBackground)
                .opacity(settings.effectiveBackgroundOpacity)
                .animation(.easeInOut(duration: 0.6), value: settings.selectedBackgroundID)
                .animation(.easeInOut(duration: 0.45), value: settings.veryDimMode)

            // Soft edge vignette so the center clock always stays easy to read
            RadialGradient(
                colors: [.clear, Color.black.opacity(0.45)],
                center: .center,
                startRadius: 160,
                endRadius: 700
            )
            .ignoresSafeArea()

            ClockDisplayView()
                .animation(.easeInOut(duration: 0.45), value: settings.veryDimMode)

            if showControls {
                VStack {
                    Spacer()
                    controlsBar
                        .padding(.bottom, 26)
                        .padding(.horizontal, 16)
                }
                .transition(.opacity)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            revealControlsTemporarily()
        }
        .onAppear {
            scheduleControlsHide()
        }
        .sheet(isPresented: $showSettings) {
            SettingsSheetView()
                .environmentObject(settings)
                .onDisappear {
                    scheduleControlsHide()
                }
        }
        .modifier(HideSystemOverlaysModifier())
    }

    private var controlsBar: some View {
        HStack(spacing: 8) {
            Button {
                withAnimation(.easeInOut(duration: 0.4)) {
                    settings.veryDimMode.toggle()
                }
                scheduleControlsHide()
            } label: {
                let dimTitle = isRu
                    ? (settings.veryDimMode ? "Тускл. вкл" : "Тускло")
                    : (settings.veryDimMode ? "Dim On" : "Very Dim")
                Label(dimTitle, systemImage: settings.veryDimMode ? "moon.fill" : "moon")
                    .font(.subheadline.weight(.medium))
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                    .background(
                        Capsule()
                            .fill(settings.veryDimMode ? Color.orange.opacity(0.28) : Color.white.opacity(0.10))
                    )
            }

            Button {
                settings.use24HourTime.toggle()
                scheduleControlsHide()
            } label: {
                let formatTitle = isRu
                    ? (settings.use24HourTime ? "24ч" : "12ч")
                    : (settings.use24HourTime ? "24h" : "12h")
                Text(formatTitle)
                    .font(.subheadline.weight(.medium))
                    .lineLimit(1)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                    .background(
                        Capsule()
                            .fill(Color.white.opacity(0.10))
                    )
            }

            Button {
                hideWorkItem?.cancel()
                showSettings = true
            } label: {
                Label(isRu ? "Настроить" : "Customize", systemImage: "slider.horizontal.3")
                    .font(.subheadline.weight(.medium))
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                    .background(
                        Capsule()
                            .fill(Color.white.opacity(0.12))
                    )
            }
        }
        .foregroundColor(Color.white.opacity(settings.veryDimMode ? 0.55 : 0.85))
        .padding(6)
        .background(
            Capsule()
                .fill(Color.black.opacity(0.55))
        )
    }

    private func revealControlsTemporarily() {
        withAnimation(.easeInOut(duration: 0.35)) {
            showControls.toggle()
        }
        if showControls {
            scheduleControlsHide()
        } else {
            hideWorkItem?.cancel()
        }
    }

    private func scheduleControlsHide() {
        hideWorkItem?.cancel()
        let item = DispatchWorkItem {
            guard !showSettings else { return }
            withAnimation(.easeInOut(duration: 0.6)) {
                showControls = false
            }
        }
        hideWorkItem = item
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0, execute: item)
    }
}

private struct HideSystemOverlaysModifier: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content.persistentSystemOverlays(.hidden)
        } else {
            content
        }
    }
}
