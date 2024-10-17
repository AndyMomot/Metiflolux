// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit.NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "FontConvertible.Font", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias Font = FontConvertible.Font

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
internal enum Fonts {
  internal enum Inter {
    internal static let black = FontConvertible(name: "Inter-Black", family: "Inter", path: "Inter-Black.otf")
    internal static let blackItalic = FontConvertible(name: "Inter-BlackItalic", family: "Inter", path: "Inter-BlackItalic.otf")
    internal static let bold = FontConvertible(name: "Inter-Bold", family: "Inter", path: "Inter-Bold.otf")
    internal static let boldItalic = FontConvertible(name: "Inter-BoldItalic", family: "Inter", path: "Inter-BoldItalic.otf")
    internal static let extraBold = FontConvertible(name: "Inter-ExtraBold", family: "Inter", path: "Inter-ExtraBold.otf")
    internal static let extraBoldItalic = FontConvertible(name: "Inter-ExtraBoldItalic", family: "Inter", path: "Inter-ExtraBoldItalic.otf")
    internal static let extraLight = FontConvertible(name: "Inter-ExtraLight", family: "Inter", path: "Inter-ExtraLight.otf")
    internal static let extraLightItalic = FontConvertible(name: "Inter-ExtraLightItalic", family: "Inter", path: "Inter-ExtraLightItalic.otf")
    internal static let italic = FontConvertible(name: "Inter-Italic", family: "Inter", path: "Inter-Italic.otf")
    internal static let light = FontConvertible(name: "Inter-Light", family: "Inter", path: "Inter-Light.otf")
    internal static let lightItalic = FontConvertible(name: "Inter-LightItalic", family: "Inter", path: "Inter-LightItalic.otf")
    internal static let medium = FontConvertible(name: "Inter-Medium", family: "Inter", path: "Inter-Medium.otf")
    internal static let mediumItalic = FontConvertible(name: "Inter-MediumItalic", family: "Inter", path: "Inter-MediumItalic.otf")
    internal static let regular = FontConvertible(name: "Inter-Regular", family: "Inter", path: "Inter-Regular.otf")
    internal static let semiBold = FontConvertible(name: "Inter-SemiBold", family: "Inter", path: "Inter-SemiBold.otf")
    internal static let semiBoldItalic = FontConvertible(name: "Inter-SemiBoldItalic", family: "Inter", path: "Inter-SemiBoldItalic.otf")
    internal static let thin = FontConvertible(name: "Inter-Thin", family: "Inter", path: "Inter-Thin.otf")
    internal static let thinItalic = FontConvertible(name: "Inter-ThinItalic", family: "Inter", path: "Inter-ThinItalic.otf")
    internal static let all: [FontConvertible] = [black, blackItalic, bold, boldItalic, extraBold, extraBoldItalic, extraLight, extraLightItalic, italic, light, lightItalic, medium, mediumItalic, regular, semiBold, semiBoldItalic, thin, thinItalic]
  }
  internal enum InterV {
    internal static let regular = FontConvertible(name: "InterV", family: "Inter V", path: "Inter-V.ttf")
    internal static let black = FontConvertible(name: "InterV_Black", family: "Inter V", path: "Inter-V.ttf")
    internal static let blackItalic = FontConvertible(name: "InterV_Black-Italic", family: "Inter V", path: "Inter-V.ttf")
    internal static let bold = FontConvertible(name: "InterV_Bold", family: "Inter V", path: "Inter-V.ttf")
    internal static let boldItalic = FontConvertible(name: "InterV_Bold-Italic", family: "Inter V", path: "Inter-V.ttf")
    internal static let extraBold = FontConvertible(name: "InterV_Extra-Bold", family: "Inter V", path: "Inter-V.ttf")
    internal static let extraBoldItalic = FontConvertible(name: "InterV_Extra-Bold-Italic", family: "Inter V", path: "Inter-V.ttf")
    internal static let extraLight = FontConvertible(name: "InterV_Extra-Light", family: "Inter V", path: "Inter-V.ttf")
    internal static let extraLightItalic = FontConvertible(name: "InterV_Extra-Light-Italic", family: "Inter V", path: "Inter-V.ttf")
    internal static let italic = FontConvertible(name: "InterV_Italic", family: "Inter V", path: "Inter-V.ttf")
    internal static let light = FontConvertible(name: "InterV_Light", family: "Inter V", path: "Inter-V.ttf")
    internal static let lightItalic = FontConvertible(name: "InterV_Light-Italic", family: "Inter V", path: "Inter-V.ttf")
    internal static let medium = FontConvertible(name: "InterV_Medium", family: "Inter V", path: "Inter-V.ttf")
    internal static let mediumItalic = FontConvertible(name: "InterV_Medium-Italic", family: "Inter V", path: "Inter-V.ttf")
    internal static let semiBold = FontConvertible(name: "InterV_Semi-Bold", family: "Inter V", path: "Inter-V.ttf")
    internal static let semiBoldItalic = FontConvertible(name: "InterV_Semi-Bold-Italic", family: "Inter V", path: "Inter-V.ttf")
    internal static let thin = FontConvertible(name: "InterV_Thin", family: "Inter V", path: "Inter-V.ttf")
    internal static let thinItalic = FontConvertible(name: "InterV_Thin-Italic", family: "Inter V", path: "Inter-V.ttf")
    internal static let all: [FontConvertible] = [regular, black, blackItalic, bold, boldItalic, extraBold, extraBoldItalic, extraLight, extraLightItalic, italic, light, lightItalic, medium, mediumItalic, semiBold, semiBoldItalic, thin, thinItalic]
  }
  internal static let allCustomFonts: [FontConvertible] = [Inter.all, InterV.all].flatMap { $0 }
  internal static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

internal struct FontConvertible {
  internal let name: String
  internal let family: String
  internal let path: String

  #if os(macOS)
  internal typealias Font = NSFont
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Font = UIFont
  #endif

  internal func font(size: CGFloat) -> Font {
    guard let font = Font(font: self, size: size) else {
      fatalError("Unable to initialize font '\(name)' (\(family))")
    }
    return font
  }

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal func swiftUIFont(size: CGFloat) -> SwiftUI.Font {
    return SwiftUI.Font.custom(self, size: size)
  }

  @available(iOS 14.0, tvOS 14.0, watchOS 7.0, macOS 11.0, *)
  internal func swiftUIFont(fixedSize: CGFloat) -> SwiftUI.Font {
    return SwiftUI.Font.custom(self, fixedSize: fixedSize)
  }

  @available(iOS 14.0, tvOS 14.0, watchOS 7.0, macOS 11.0, *)
  internal func swiftUIFont(size: CGFloat, relativeTo textStyle: SwiftUI.Font.TextStyle) -> SwiftUI.Font {
    return SwiftUI.Font.custom(self, size: size, relativeTo: textStyle)
  }
  #endif

  internal func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate func registerIfNeeded() {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: family).contains(name) {
      register()
    }
    #elseif os(macOS)
    if let url = url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      register()
    }
    #endif
  }

  fileprivate var url: URL? {
    // swiftlint:disable:next implicit_return
    return BundleToken.bundle.url(forResource: path, withExtension: nil)
  }
}

internal extension FontConvertible.Font {
  convenience init?(font: FontConvertible, size: CGFloat) {
    font.registerIfNeeded()
    self.init(name: font.name, size: size)
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Font {
  static func custom(_ font: FontConvertible, size: CGFloat) -> SwiftUI.Font {
    font.registerIfNeeded()
    return custom(font.name, size: size)
  }
}

@available(iOS 14.0, tvOS 14.0, watchOS 7.0, macOS 11.0, *)
internal extension SwiftUI.Font {
  static func custom(_ font: FontConvertible, fixedSize: CGFloat) -> SwiftUI.Font {
    font.registerIfNeeded()
    return custom(font.name, fixedSize: fixedSize)
  }

  static func custom(
    _ font: FontConvertible,
    size: CGFloat,
    relativeTo textStyle: SwiftUI.Font.TextStyle
  ) -> SwiftUI.Font {
    font.registerIfNeeded()
    return custom(font.name, size: size, relativeTo: textStyle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
