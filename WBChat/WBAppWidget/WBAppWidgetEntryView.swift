//
//  WBAppWidgetEntryView.swift
//  WBAppWidgetExtension
//
//  Created by Ramazan Nazaev on 09.07.2024.
//

import SwiftUI
import WidgetKit

struct WBAppWidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var family
    
    @State var time: Date = .now
    
    var body: some View {
        VStack {
            Text("Подкинуть монетку?")
                .font(.title)
            Spacer()
            Text(entry.emoji)
                .font(.largeTitle)
            Spacer()
            
            switch family {
            case .systemSmall: EmptyView()
                
            case .systemMedium: EmptyView()
                
            case .systemLarge:
                if #available(iOS 17.0, *) {
                    HStack(alignment: .top) {
                        Button(intent: UpdateEmojiIntent()) {
                            Text("🔄 FLIP")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(15)
                        }
                        .background(Color.blue)
                        .cornerRadius(30)
                    }
                }
                
            case .systemExtraLarge: EmptyView()
                
            case .accessoryCorner: EmptyView()
                
            case .accessoryCircular: EmptyView()
                
            case .accessoryRectangular:  EmptyView()
                
            case .accessoryInline: EmptyView()
                
            @unknown default: EmptyView()
            }
        }
    }
}
