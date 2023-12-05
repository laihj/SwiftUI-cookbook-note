//
//  UserLanguage.swift
//  cookbook
//
//  Created by laihj on 2023/9/22.
//

import SwiftUI

struct UserLanguage: View {

      var userPreferredLanguage: String {
        return Locale.preferredLanguages.first ?? "Language preference not found"
      }

      var userPrimaryLanguage: String {
        let locale = Locale.autoupdatingCurrent
        guard let primaryLanguage = locale.language.languageCode?.identifier else { return "Language code not found" }
        return NSLocale.current.localizedString(forLanguageCode: primaryLanguage) ?? "Language not found"
      }

      var body: some View {
        VStack {
          Text("Your preferred language is \(userPreferredLanguage)")
          Text("Your primary language is \(userPrimaryLanguage)")
        }.padding()
      }
}

#Preview {
    UserLanguage()
}
