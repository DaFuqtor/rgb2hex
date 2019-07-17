import Cocoa
class ViewController: NSViewController {

    @IBOutlet weak var textRed: NSTextField!
    @IBOutlet weak var textGreen: NSTextField!
    @IBOutlet weak var textBlue: NSTextField!
    @IBOutlet weak var label: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func textNumeric(_ string : String) -> Bool {
        let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
        return string.rangeOfCharacter(from: invalidCharacters) == nil
    }
    
    func parseColors() {
        var rgbRedValue = textRed.stringValue
        var rgbGreenValue = textGreen.stringValue
        var rgbBlueValue = textBlue.stringValue
        
        if (!rgbRedValue.isEmpty || !rgbGreenValue.isEmpty || !rgbBlueValue.isEmpty) {
            if rgbRedValue.isEmpty {
                rgbRedValue = "0"
            }
            if rgbGreenValue.isEmpty {
                rgbGreenValue = "0"
            }
            if rgbBlueValue.isEmpty {
                rgbBlueValue = "0"
            }
            
            let maxVal = "255"
            
            if (!textNumeric(rgbRedValue)) {
                textRed.stringValue = ""
                rgbRedValue = "0"
            }
            if (!textNumeric(rgbGreenValue)) {
                textGreen.stringValue = ""
                rgbGreenValue = "0"
            }
            if (!textNumeric(rgbBlueValue)) {
                textBlue.stringValue = ""
                rgbBlueValue = "0"
            }
            
            if (rgbRedValue > maxVal || rgbRedValue.count > maxVal.count) {
                rgbRedValue = maxVal
                textRed.stringValue = maxVal
            }
            if (rgbGreenValue > maxVal || rgbGreenValue.count > maxVal.count) {
                rgbGreenValue = maxVal
                textGreen.stringValue = maxVal
            }
            if (rgbBlueValue > maxVal || rgbBlueValue.count > maxVal.count) {
                rgbBlueValue = maxVal
                textBlue.stringValue = maxVal
            }
            
            if (textNumeric(rgbRedValue) && textNumeric(rgbGreenValue) && textNumeric(rgbBlueValue)) {
                let hexValue = String(format:"%02X", Int(rgbRedValue)!) + String(format:"%02X", Int(rgbGreenValue)!) + String(format:"%02X", Int(rgbBlueValue)!)
                
                let hexInverted = String(format:"%02X", 255 - Int(rgbRedValue)!) + String(format:"%02X", 255 - Int(rgbGreenValue)!) + String(format:"%02X", 255 - Int(rgbBlueValue)!)
                
                print(hexInverted)
                label.stringValue = "#"+hexValue.lowercased()
            }
        }
    }
    @IBAction func redButClicked(_ sender: NSTextField) {
        parseColors()
    }
    @IBAction func greenButClicked(_ sender: NSTextField) {
        parseColors()
    }
    @IBAction func blueButClicked(_ sender: NSTextField) {
        parseColors()
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        parseColors()
    }

}
