import SwiftUI
import UIKit

@main
struct NightClockApp: App {
    @Environment(\.scenePhase) private var scenePhase
    @StateObject private var settings = ClockSettings()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settings)
                .preferredColorScheme(.dark)
                .onAppear {
                    updateIdleTimer(active: true)
                }
                .onChange(of: scenePhase) { newPhase in
                    updateIdleTimer(active: newPhase == .active)
                }
        }
    }

    private func updateIdleTimer(active: Bool) {
        DispatchQueue.main.async {
            UIApplication.shared.isIdleTimerDisabled = active
        }
    }
}
