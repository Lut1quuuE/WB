//
//  AppIntent.swift
//  WBAppWidget
//
//  Created by Ramazan Nazaev on 09.07.2024.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")
    
    // An example configurable parameter.
    @Parameter(title: "CoinFlip", default: "🪙")
    var coinFlip: String
}
