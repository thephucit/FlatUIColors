//
//  FlatUIColors.swift
//  FlatUIColors
//
//  Created by bryn austin bellomy on 6.16.14.
//  Copyright (c) 2014 bryn austin bellomy. All rights reserved.
//

import Foundation


/**
    Contains helpers for generating color values from the Flat UI color palette (see http://flatuicolors.com/).
 */
public struct FlatUIColors
{
#if os(iOS)
    public typealias OSColor = UIColor
#elseif os(OSX)
    public typealias OSColor = NSColor
#endif

    /**
        Generates an NS- or UIColor from a hex color string.

        - parameter hex: The hex color string from which to create the color object.  '#' sign is optional.
     */
    public static func colorFromHexCode(_ hex:String) -> OSColor!
    {
        var colorString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if colorString.hasPrefix("#") {
            colorString = colorString.fui_substringFromIndex(1)
        }

        let stringLength = colorString.characters.count
        if stringLength != 6 && stringLength != 8 {
            return nil
        }

        let rString = colorString.fui_substringToIndex(2)
        let gString = colorString.fui_substringFromIndex(2).fui_substringToIndex(2)
        let bString = colorString.fui_substringFromIndex(4).fui_substringToIndex(2)
        var aString : String?
        if stringLength == 8 { aString = colorString.fui_substringFromIndex(6).fui_substringToIndex(2) }

        var r: CUnsignedInt = 0
        var g: CUnsignedInt = 0
        var b: CUnsignedInt = 0
        var a: CUnsignedInt = 1

        Scanner(string:rString).scanHexInt32(&r)
        Scanner(string:gString).scanHexInt32(&g)
        Scanner(string:bString).scanHexInt32(&b)
        if let aString = aString {
            Scanner(string:aString).scanHexInt32(&a)
        }

        let red     = CGFloat(r) / 255.0
        let green   = CGFloat(g) / 255.0
        let blue    = CGFloat(b) / 255.0
        let alpha   = CGFloat(a) / 255.0
        return OSColor(red:red, green:green, blue:blue, alpha:alpha)
    }

    fileprivate static func alphaHEX(_ alpha: CGFloat) -> String {
        
        if alpha <= 1 {
            return String(Int(alpha * 255), radix: 16, uppercase: true)
        } else { return "FF" }
    }

    public static func turquoiseColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.turquoise + alphaHEX(alpha)) }
    public static func greenSeaColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.greenSea + alphaHEX(alpha)) }
    public static func mediumTurquoiseColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.mediumTurquoise + alphaHEX(alpha)) }
    public static func lightSeaGreenColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.lightSeaGreen + alphaHEX(alpha)) }
    public static func emeraldColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.emerald + alphaHEX(alpha)) }
    public static func nephritisColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.nephritis + alphaHEX(alpha)) }
    public static func gossipColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.gossip + alphaHEX(alpha)) }
    public static func salemColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.salem + alphaHEX(alpha)) }
    public static func peterRiverColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.peterRiver + alphaHEX(alpha)) }
    public static func belizeHoleColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.belizeHole + alphaHEX(alpha)) }
    public static func riptideColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.riptide + alphaHEX(alpha)) }
    public static func dodgerBlueColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.dodgerBlue + alphaHEX(alpha)) }
    public static func amethystColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.amethyst + alphaHEX(alpha)) }
    public static func wisteriaColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.wisteria + alphaHEX(alpha)) }
    public static func lightWisteriaColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.lightWisteria + alphaHEX(alpha)) }
    public static func plumColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.plum + alphaHEX(alpha)) }
    public static func wetAsphaltColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.wetAsphalt + alphaHEX(alpha)) }
    public static func midnightBlueColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.midnightBlue + alphaHEX(alpha)) }
    public static func hokiColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.hoki + alphaHEX(alpha)) }
    public static func ebonyClayColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.ebonyClay + alphaHEX(alpha)) }
    public static func sunflowerColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.sunflower + alphaHEX(alpha)) }
    public static func tangerineColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.tangerine + alphaHEX(alpha)) }
    public static func confettiColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.confetti + alphaHEX(alpha)) }
    public static func capeHoneyColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.capeHoney + alphaHEX(alpha)) }
    public static func carrotColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.carrot + alphaHEX(alpha)) }
    public static func pumpkinColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.pumpkin + alphaHEX(alpha)) }
    public static func ecstasyColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.ecstasy + alphaHEX(alpha)) }
    public static func jaffaColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.jaffa + alphaHEX(alpha)) }
    public static func alizarinColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.alizarin + alphaHEX(alpha)) }
    public static func pomegranateColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.pomegranate + alphaHEX(alpha)) }
    public static func monzaColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.monza + alphaHEX(alpha)) }
    public static func thunderBirdColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.thunderbird + alphaHEX(alpha)) }
    public static func cloudsColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.clouds + alphaHEX(alpha)) }
    public static func silverColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.silver + alphaHEX(alpha)) }
    public static func galleryColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.gallery + alphaHEX(alpha)) }
    public static func ironColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.iron + alphaHEX(alpha)) }
    public static func concreteColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.concrete + alphaHEX(alpha)) }
    public static func asbestosColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.asbestos + alphaHEX(alpha)) }
    public static func pumiceColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.pumice + alphaHEX(alpha)) }
    public static func lynchColor(_ alpha: CGFloat = 1.0) -> OSColor! { return FlatUIColors.colorFromHexCode(ColorCodes.lynch + alphaHEX(alpha)) }

    /**
        Contains hex color code strings for the Flat UI color palette.
     */
    public struct ColorCodes
    {
        public static let turquoise = "1abc9c"
        public static let greenSea  = "16a085"
        public static let mediumTurquoise = "4ECDC4"
        public static let lightSeaGreen = "1BA39C"
        public static let emerald  = "2ecc71"
        public static let nephritis = "27ae60"
        public static let gossip = "87D37C"
        public static let salem = "1E824C"
        public static let peterRiver = "3498D8"
        public static let belizeHole = "2980b9"
        public static let riptide = "86E2D5"
        public static let dodgerBlue = "19B5FE"
        public static let amethyst = "9b59b6"
        public static let wisteria = "8e44ad"
        public static let lightWisteria = "BE90D4"
        public static let plum = "913D88"
        public static let wetAsphalt = "34495e"
        public static let midnightBlue = "2C3E50"
        public static let hoki = "67809F"
        public static let ebonyClay = "22313F"
        public static let sunflower = "F1C40F"
        public static let tangerine = "F39C12"
        public static let confetti = "E9D460"
        public static let capeHoney = "FDE3A7"
        public static let carrot = "E67E22"
        public static let pumpkin = "D35400"
        public static let ecstasy = "F9690E"
        public static let jaffa = "F27935"
        public static let alizarin = "E74C3C"
        public static let pomegranate = "C0392B"
        public static let monza = "CF000F"
        public static let thunderbird = "D91E18"
        public static let clouds = "ECF0F1"
        public static let silver = "BDC3C7"
        public static let gallery = "EEEEEE"
        public static let iron = "DADFE1"
        public static let concrete = "95A5A6"
        public static let asbestos = "7F8C8D"
        public static let pumice = "D2D7D3"
        public static let lynch = "6C7A89"
    }
}


private extension String
{
    func fui_substringFromIndex(_ index: Int) -> String
    {
        let newStart = characters.index(startIndex, offsetBy: index)
        return self[newStart ..< endIndex]
    }



    func fui_substringToIndex(_ index: Int) -> String
    {
        let newEnd = characters.index(startIndex, offsetBy: index)
        return self[startIndex ..< newEnd]
    }
}


