/*
The MIT License (MIT)

Copyright (c) 2016 Forrest Collins

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/
//--------------------------------------------------------------------------------
// PURPOSE: This class holds the logic for an implementation strategy of having a
//          UITextView with a placeholder. The placeholder effect is achieved by
//          showing & hiding a UILabel opposed to an alternative placeholder
//          approach of showing & hiding UITextfield text to mimic a placeholder.
//          Character count logic is included plus a dynamic color changing effect.
//---------------------------------------------------------------------------------

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    //----------------
    // MARK: - Outlets
    //----------------
    @IBOutlet weak var myTextView: MaterialTextView!
    @IBOutlet weak var placeholderLabel: UILabel!
    @IBOutlet weak var characterCountLabel: UILabel!
    @IBOutlet weak var myView: MaterialShadowView!
    
    //-------------------------
    // MARK: - View Will Appear
    //-------------------------
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        myView.backgroundColor = UIColor(netHex: 0xFFEBEE) // light red
        changeViewColor(self.view, color: UIColor(netHex: 0x1F1F21)) // black
        characterCountLabel.textColor = UIColor(netHex: 0x1F1F21) // black
        
        if myTextView.text.isEmpty {
            placeholderLabel.alpha = 1
        } else {
            placeholderLabel.alpha = 0
        }
    }
    
    // Hide Status Bar
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    //---------------------------------------------
    // MARK: - TextView Should Change Text in Range
    //---------------------------------------------
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        let totalCharactersAllowed = 200
        let currentText: NSString = myTextView.text
        let updatedText = currentText.stringByReplacingCharactersInRange(range, withString: text)
        let newLength: Int = (currentText as NSString).length + (text as NSString).length - range.length
        let remainingChars: Int = totalCharactersAllowed - (newLength)
        
        characterCountLabel.text = "\(remainingChars) characters left"
        
        // Change view and text color based off number of characters remaining
        // black text is changed to white text partway for visibility purposes on darker backgrounds
        if remainingChars == totalCharactersAllowed {
            print("200")
            changeViewColor(myView, color: UIColor(netHex: 0xFFEBEE))
            changeViewColor(self.view, color: UIColor(netHex: 0x1F1F21))
            changeLabelColor(characterCountLabel, color: UIColor(netHex: 0x1F1F21)) // black text
        } else if remainingChars < totalCharactersAllowed && remainingChars >= 180 {
            print("199 to 180")
            changeViewColor(myView, color: UIColor(netHex: 0xFFCDD2))
            changeViewColor(self.view, color: UIColor(netHex: 0x0D47A1))
            changeLabelColor(characterCountLabel, color: UIColor(netHex: 0x1F1F21))
        } else if remainingChars < 180 && remainingChars >= 160 {
            print("179 to 160")
            changeViewColor(myView, color: UIColor(netHex: 0xEF9A9A))
            changeViewColor(self.view, color: UIColor(netHex: 0x1565C0))
            changeLabelColor(characterCountLabel, color: UIColor(netHex: 0x1F1F21))
        } else if remainingChars < 160 && remainingChars >= 140 {
            print("159 to 140")
            changeViewColor(myView, color: UIColor(netHex: 0xE57373))
            changeViewColor(self.view, color: UIColor(netHex: 0x1976D2))
            changeLabelColor(characterCountLabel, color: UIColor(netHex: 0x1F1F21))
        } else if remainingChars < 140 && remainingChars >= 120 {
            print("139 to 120")
            changeViewColor(myView, color: UIColor(netHex: 0xEF5350))
            changeViewColor(self.view, color: UIColor(netHex: 0x1E88E5))
            changeLabelColor(characterCountLabel, color: UIColor(netHex: 0xFFFFFF)) // white text
        } else if remainingChars < 120 && remainingChars >= 100 {
            print("119 to 100")
            changeViewColor(myView, color: UIColor(netHex: 0xF44336))
            changeViewColor(self.view, color: UIColor(netHex: 0x2196F3))
            changeLabelColor(characterCountLabel, color: UIColor(netHex: 0xFFFFFF))
        } else if remainingChars < 100 && remainingChars >= 80 {
            print("99 to 80")
            changeViewColor(myView, color: UIColor(netHex: 0xE53935))
            changeViewColor(self.view, color: UIColor(netHex: 0x42A5F5))
            changeLabelColor(characterCountLabel, color: UIColor(netHex: 0xFFFFFF))
        } else if remainingChars < 80 && remainingChars >= 60 {
            print("79 to 60")
            changeViewColor(myView, color: UIColor(netHex: 0xD32F2F))
            changeViewColor(self.view, color: UIColor(netHex: 0x64B5F6))
            changeLabelColor(characterCountLabel, color: UIColor(netHex: 0xFFFFFF))
        } else if remainingChars < 60 && remainingChars >= 40 {
            print("59 to 40")
            changeViewColor(myView, color: UIColor(netHex: 0xC62828))
            changeViewColor(self.view, color: UIColor(netHex: 0x90CAF9))
            changeLabelColor(characterCountLabel, color: UIColor(netHex: 0xFFFFFF))
        } else if remainingChars < 40 && remainingChars >= 20 {
            print("39 to 20")
            changeViewColor(myView, color: UIColor(netHex: 0xB71C1C))
            changeViewColor(self.view, color: UIColor(netHex: 0xBBDEFB))
            changeLabelColor(characterCountLabel, color: UIColor(netHex: 0xFFFFFF))
        } else if remainingChars < 20 && remainingChars >= 0 {
            print("19 to 0")
            changeViewColor(myView, color: UIColor(netHex: 0x1F1F21))
            changeViewColor(self.view, color: UIColor(netHex: 0xE3F2FD))
            changeLabelColor(characterCountLabel, color: UIColor(netHex: 0xFFFFFF))
        } else {
            print("Out of range")
            characterCountLabel.text = "0 characters left"
            changeViewColor(self.view, color: UIColor(netHex: 0xFFFFFFF))
        }
        
        // Dismiss keyboard when Done key pressed or if Enter key is pressed
        // or if textView text is greater than 200 characters
        let enterKeyPressed: Bool = (text == "\n")
        
        if enterKeyPressed || newLength > totalCharactersAllowed {
            
            self.myTextView.resignFirstResponder()
            
            return false
        }
        
        // If updated textView character count is nil (isEmpty), show the placeholder
        if updatedText.characters.isEmpty {
            
            placeholderLabel.alpha = 1

        } else {
            
            placeholderLabel.alpha = 0
        }
        
        return true
    }
    
    //--------------------------
    // MARK: - Change View Color
    //--------------------------
    func changeViewColor(view: UIView, color: UIColor) {
        
        UIView.animateWithDuration(APPLE_ANIMATION_DURATION, delay: 0, options: .CurveLinear, animations: {
            view.backgroundColor = color
        }, completion: nil)
    }
    
    //---------------------------
    // MARK: - Change Label Color
    //---------------------------
    func changeLabelColor(label: UILabel, color: UIColor) {
        
        UIView.animateWithDuration(APPLE_ANIMATION_DURATION, delay: 0, options: .CurveLinear, animations: {
            label.textColor = color
        }, completion: nil)
    }
}

