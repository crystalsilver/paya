//
//  Paya.swift
//  paya
//
//  Created by stephenw on 2017/6/27.
//

let PAYA_DEFAULT_THEME_NAME = "paya-classic"
public typealias PayaRenderAction = ([String: AnyObject?], Int) -> Void

public class Paya {
  private static let sharedInstance = Paya()
  private var generators = [PayaGenerator]()
  private var theme: PayaTheme = PayaTheme(name: PAYA_DEFAULT_THEME_NAME, folder: PAYA_DEFAULT_THEME_NAME)
  private var workerDIR = "./"
  private var payaConfig = [String: AnyObject?]()
  
  private init() {}
  
  /// load new generator
  ///
  /// - Parameter generator: your custom generator instance
  public static func loadGenerator(generator: PayaGenerator) {
    sharedInstance.generators.append(generator)
  }
  
  public static func setTheme(theme: PayaTheme) {
    sharedInstance.theme = theme
  }
  
  /// set the default work directory
  ///
  /// - Parameter directory: absolute directory string
  public static func setWorkerDirectory(directory: String) {
    sharedInstance.workerDIR = directory
  }
  
  /// set default configuration
  ///
  /// - Parameter config: key valued config
  public static func setConfiguration(config: [String: AnyObject?]) {
    sharedInstance.payaConfig = config
  }
}

public class PayaTheme {
  
  private var _config = [String: AnyObject?]()
  
  public var config: [String: AnyObject?] {
    get {
      return _config
    }
  }
  
  required public init(name: String, folder: String) {
    // TODO: init a theme instance once the folder is passed
  }
}

public class PayaGenerator {
  var name: String
  required public init(name: String) {
    self.name = name
  }
  
  /// invoke function was designed to be invoked by
  /// the Paya CoreRender, you must override it to
  /// render your expected resource
  /// - Parameter data: data from CoreRender
  /// - Returns: key-value data from
  func invoke(data: AnyObject) -> [String: AnyObject]? {
    // TODO: complete Generator invoke method
    return nil
  }
}

public class PayaRender {
  private var srcType: String = ""
  private var targetType: String = ""
  private var action: PayaRenderAction?
  
  required public init(srcType: String, targetType: String, method: @escaping PayaRenderAction) {
    self.srcType = srcType.lowercased()
    self.targetType = targetType.lowercased()
    self.action = method
  }
  
  func invoke(data: AnyObject) -> Void {
    // TODO: complete Render invoke method
  }
  
}
