//
//  ContentView.swift
//  Calendar
//
//  Created by Ramazan Nazaev on 15.07.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedDate = Date()
    @State private var selectedFlag = 0
    
    let flags = ["🇺🇸", "🇫🇷", "🇷🇺", "🇪🇸", "🇯🇵"]
    let locales: [Locale] = [
        Locale(identifier: "en_US"),
        Locale(identifier: "fr_FR"),
        Locale(identifier: "ru_RU"),
        Locale(identifier: "es_ES"),
        Locale(identifier: "ja_JP")
    ]
    
    let translations: [String: [String]] = [
        "Сегодня": ["Today", "Aujourd'hui", "Сегодня", "Hoy", "今日"],
        "Завтра": ["Tomorrow", "Demain", "Завтра", "Mañana", "明日"],
        "Послезавтра": ["The day after tomorrow", "Après-demain", "Послезавтра", "Pasado mañana", "明後日"],
        "Вчера": ["Yesterday", "Hier", "Вчера", "Ayer", "昨日"],
        "Позавчера": ["The day before yesterday", "Avant-hier", "Позавчера", "Anteayer", "一昨日"]
    ]
    
    var body: some View {
        VStack {
            DatePicker("Выберите дату", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
            
            Picker("Выберите флаг", selection: $selectedFlag) {
                ForEach(0..<flags.count) { index in
                    Text(flags[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            VStack(alignment: .leading) {
                Text(formatDate(date: Calendar.current.date(byAdding: .day, value: -2, to: selectedDate)!, label: "Позавчера"))
                    .font(.subheadline)
                Text(formatDate(date: Calendar.current.date(byAdding: .day, value: -1, to: selectedDate)!, label: "Вчера"))
                    .font(.subheadline)
                Text(formatDate(date: selectedDate, label: "Сегодня"))
                    .font(.headline)
                Text(formatDate(date: Calendar.current.date(byAdding: .day, value: 1, to: selectedDate)!, label: "Завтра"))
                    .font(.subheadline)
                Text(formatDate(date: Calendar.current.date(byAdding: .day, value: 2, to: selectedDate)!, label: "Послезавтра"))
                    .font(.subheadline)
            }
            .font(.title)
            .padding()
        }
    }
    
    private func formatDate(date: Date, label: String) -> String {
        let calendar = Calendar.current
        let formatter = DateFormatter()
        formatter.locale = locales[selectedFlag]
        
        let dayFormatter = NumberFormatter()
        dayFormatter.numberStyle = .spellOut
        dayFormatter.locale = locales[selectedFlag]
        
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "MMMM"
        monthFormatter.locale = locales[selectedFlag]
        
        let yearFormatter = NumberFormatter()
        yearFormatter.numberStyle = .spellOut
        yearFormatter.locale = locales[selectedFlag]
        
        let day = calendar.component(.day, from: date)
        let month = monthFormatter.string(from: date)
        let year = calendar.component(.year, from: date)
        
        let dayString = dayFormatter.string(from: NSNumber(value: day)) ?? ""
        let yearString = yearFormatter.string(from: NSNumber(value: year)) ?? ""
        
        let fullDateString = "\(dayString) \(month) \(yearString)"
        
        let languageIndex = selectedFlag
        let translatedLabel = translations[label]![languageIndex]
        return String(format: "\(translatedLabel): %@", fullDateString)
    }
}



#Preview {
    ContentView()
}
