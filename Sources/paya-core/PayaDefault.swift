//
//  PayaDefault.swift
//  paya
//
//  Created by stephenw on 2017/6/28.
//
//
import Foundation
import Yams

let PAYA_DEFAULT_THEME_REPO = "https://github.com/stephenwzl/paya"

private func findShellCommand(cmd: String) -> String? {
  let task = Process()
  task.launchPath = "/usr/bin/which"
  task.arguments = [cmd]
  let pipe = Pipe()
  task.standardOutput = pipe
  task.launch()
  let data = pipe.fileHandleForReading.readDataToEndOfFile()
  let output = String(data: data, encoding: String.Encoding.utf8)
  task.waitUntilExit()
  return output?.trimmingCharacters(in: CharacterSet(charactersIn: "\n"))
}

private func executeShellCommand(cmd: String, argv: [String]) -> String? {
  let command = findShellCommand(cmd: "git")
  guard command != nil else {
    return nil
  }
  let pipe = Pipe()
  let task = Process()
  task.launchPath = command!
  task.arguments = argv
  task.standardOutput = pipe
  task.standardError = pipe
  task.launch()
  let data = pipe.fileHandleForReading.readDataToEndOfFile()
  let output = String(data: data, encoding: String.Encoding.utf8)
  task.waitUntilExit()
  return output
}

public func payaCreateTemplateProject(dir: String?) {
  let currentDirectory = dir != nil ? dir! : GlobalPayaInfo.currentDir
  let fileManager = FileManager.default
  print("creating source folder...")
  try! fileManager.createDirectory(atPath: "\(currentDirectory)/source", withIntermediateDirectories: true, attributes: nil)
  print("creating theme folder...")
  try! fileManager.createDirectory(atPath: "\(currentDirectory)/theme", withIntermediateDirectories: true, attributes: nil)
  /// download default theme
  print("downloading default theme...")
  let output = executeShellCommand(cmd: "git", argv: ["clone", PAYA_DEFAULT_THEME_REPO, "theme/\(PAYA_DEFAULT_THEME_NAME)"])
  print(output!)
}
