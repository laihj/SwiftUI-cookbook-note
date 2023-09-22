//
//  TheTextView.swift
//  cookbook
//
//  Created by laihj on 2023/9/18.
//

import SwiftUI

struct TheTextView: View {
    
    //原来 Text 默认支持 markdown
    let quote = """
    **"Be yourself;** everyone else is _already taken._"
    - **Oscar Wilde**
    """
    
    
    
    var body: some View {
        let attributedQuote = try! AttributedString(markdown: quote)
        Text(attributedQuote)
            .font(.system(size: 16, weight: .medium, design: .serif))
            .foregroundColor(.blue)
        
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        //            .font(.largeTitle)
            .font(.custom("Papyrus", size: 24))
            .foregroundStyle(.purple)
            .frame(maxWidth:.infinity,alignment: .leading)
            .padding()
        Text("Hello!\nWelcome to our app. \nWe're so glad you're here. \n\nYou will love everything we have to offer.")
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.center)
            .lineLimit(1)
            .padding()
        VStack {
            Text("Welcome to my app!")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding()
            
            Text("Explore the world")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.green)
                .padding()
            
            Text("Discover new places and experiences")
                .font(.headline)
                .padding()
            
            Text("Get inspired")
                .font(.subheadline)
                .foregroundColor(.purple)
                .padding()
            
            Text("Join our community")
                .font(.callout)
                .foregroundColor(.orange)
                .padding()
            
            Text("Share your adventures with us")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding()
            
            Text("Follow us on social media")
                .font(.caption)
                .foregroundColor(.black)
                .padding()
        }
        Text("Hello ")
            .fontWeight(.bold)
            .italic()
        + Text("World")
            .underline()
        
        Text("**Bold** and _italic_ text!")
            .foregroundStyle(.blue)
    }
}

#Preview {
    TheTextView()
}
