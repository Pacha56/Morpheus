//
//  AttributedStringExtension.swift
//  Morpheus
//
//  Created by Luis Resende on 10/12/2020.
//

import UIKit

extension NSMutableAttributedString
{
    func boldUnderline(_ value: String, _ fontSize: CGFloat, _ fontColor: UIColor) -> NSMutableAttributedString
    {
        let attributes:[NSAttributedString.Key : Any] = [
            .font : UIFont.boldSystemFont(ofSize: fontSize),
            .foregroundColor : fontColor,
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .underlineColor: fontColor
        ]

        self.append(NSAttributedString(string: value, attributes:attributes))
    
        return self
    }

    func normal(_ value: String, _ fontSize: CGFloat, _ fontColor: UIColor) -> NSMutableAttributedString
    {
        let attributes:[NSAttributedString.Key : Any] = [
            .font : UIFont.systemFont(ofSize: fontSize),
            .foregroundColor : fontColor,
            
        ]

        self.append(NSAttributedString(string: value, attributes:attributes))
        
        return self
    }
}
