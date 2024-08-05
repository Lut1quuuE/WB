//
//  WBAppWidget.swift
//  WBAppWidget
//
//  Created by Ramazan Nazaev on 06.07.2024.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        // В режиме placeholder отображаем эмодзи монеты
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent(), emoji: "🪙")
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        // В режиме snapshot также отображаем эмодзи монеты для быстрой загрузки
        SimpleEntry(date: Date(), configuration: configuration, emoji: "🪙")
    }

    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        let currentDate = Date()
        // Получаем текущее эмодзи из UserDefaults
        let currentEmoji = UserDefaults(suiteName: "group.com.yourcompany.WBAppWidget")?.string(forKey: "currentEmoji") ?? "🪙"
        
        let entry = SimpleEntry(date: currentDate, configuration: configuration, emoji: currentEmoji)
        entries.append(entry)

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
    let emoji: String
}

struct WBAppWidget: Widget {
    let kind: String = "WBAppWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            WBAppWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

extension UserDefaults {
    static let shared = UserDefaults(suiteName: "group.com.yourcompany.WBAppWidget")!
}

extension ConfigurationAppIntent {
    static var smiley: ConfigurationAppIntent {
        ConfigurationAppIntent()
    }
}

#Preview(as: .systemLarge) {
    WBAppWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley, emoji: "🪙")
}
