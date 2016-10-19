//
//  ViewController.swift
//  Silly Song
//
//  Created by Nick Fohs on 10/18/16.
//  Copyright © 2016 Nick Fohs. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: AnyObject) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: AnyObject) {
        lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
    }

}

func shortNamefromName(name: String) -> String {
    let lowercaseName = name.lowercased()
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    if let firstVowelRange = lowercaseName.rangeOfCharacter(from: vowelSet, options: .caseInsensitive) {
        return lowercaseName.substring(from: firstVowelRange.lowerBound)
    } else {
        return lowercaseName
    }
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortName = shortNamefromName(name: fullName)
    
    let songWithName = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName.capitalized)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return songWithName
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

