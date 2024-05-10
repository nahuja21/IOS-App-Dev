import SwiftUI

private struct SensitiveDataVisible: EnvironmentKey {
static let defaultValue: Bool = false
}

extension EnvironmentValues {
var sensitiveVisible: Bool {
get { self[SensitiveDataVisible.self] }
set { self[SensitiveDataVisible.self] = newValue }
}
}

extension View {
func sensitiveVisible(_ value: Bool) -> some View {
environment(\.sensitiveVisible, value)
}
}

struct ViewOne: View {
@Environment(\.sensitiveVisible) private var showSensitive
var body: some View {
VStack(alignment: .center) {
if showSensitive {
Text("Secret 123")
} else {
Text("**********")
}
}
.padding()
}
}
struct ViewTwo: View {
@Environment(\.sensitiveVisible) private var showSensitive
var body: some View {
VStack(alignment: .center) {
if showSensitive {
Text("Secret ABC")
} else {
Text("**********")
}
}
.padding()
}
}
struct ContentView: View {
@State private var showSensitive = false
var body: some View {
VStack(alignment: .center) {
Toggle("Show sensitive data", isOn: $showSensitive)
ViewOne()
.sensitiveVisible(showSensitive)
ViewTwo()
.sensitiveVisible(showSensitive)
}
.padding()
}
}
