//
//  SwiftUIView.swift
//  cookbook
//
//  Created by laihj on 2023/12/9.
//

import SwiftUI

struct Product {
    let title: String
    let price: Decimal
    let oldPrice: Decimal?
}

extension Product {
    func formatted<Style: FormatStyle>(_ style: Style) -> Style.FormatOutput where Style.FormatInput == Self {
        style.format(self)
    }
}

struct ProductPriceFormat: FormatStyle {
    func format(_ value: Product) -> AttributedString {
        guard let oldPrice = value.oldPrice else {
            return value.price.formatted(.number.attributed)
        }

        let priceFormatted = value.price.formatted() //.formatted()
        let oldPriceFormatted = oldPrice.formatted()

        var string = AttributedString("\(priceFormatted) \(oldPriceFormatted)")

        if let range = string.range(of: oldPriceFormatted) {
            string[range].inlinePresentationIntent = .strikethrough
        }

        return string
    }
}

extension FormatStyle where Self == ProductPriceFormat {
    static var price: ProductPriceFormat { .init() }
}

struct SwiftUIView: View {
    @State private var enteredText = ""

      var body: some View {
        VStack {
            
            let product = Product(title: "App", price: 0.99, oldPrice: 1.99)
            
            Text(product.formatted(.price))
            
            
            TextEditor(text: $enteredText)
                  .padding()
                  .font(.title)
                  .foregroundColor(.gray)
          Text(verbatim: "yes")
        }
      }
}

#Preview {
    SwiftUIView()
}
