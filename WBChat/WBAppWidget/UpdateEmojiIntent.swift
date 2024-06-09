//
//  UpdateEmojiIntent.swift
//  WBAppWidgetExtension
//
//  Created by Ramazan Nazaev on 09.07.2024.
//

import AppIntents
import WidgetKit

@available(iOS 16.0, macOS 13.0, watchOS 9.0, tvOS 16.0, *)
struct UpdateEmojiIntent: AppIntent {
    static var title: LocalizedStringResource = "Flip Coin"
    static var description = IntentDescription("Flip the coin to display either an eagle or the number one.")

    func perform() async throws -> some IntentResult {
        // Генерация случайного эмодзи
        let newEmoji = Bool.random() ? "🦅" : "1️⃣"
        
        // Сохранение нового эмодзи в UserDefaults
        UserDefaults(suiteName: "group.com.yourcompany.WBAppWidget")?.set(newEmoji, forKey: "currentEmoji")
        
        // Перезагрузка таймлайна виджета
        WidgetCenter.shared.reloadTimelines(ofKind: "WBAppWidget")
        
        return .result()
    }
}
