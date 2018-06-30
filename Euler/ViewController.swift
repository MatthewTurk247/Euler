//
//  ViewController.swift
//  Euler
//
//  Created by Matthew Turk on 6/15/18.
//  Copyright © 2018 MonitorMOJO, Inc. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    let e = Array("2.718281828459045235360287471352662497757247093699959574966967627724076630353547594571382178525166427427466391932003059921817413596629043572900334295260595630738132328627943490763233829880753195251019011573834187930702154089149934884167509244761460668082264800168477411853742345442437107539077744992069551702761838606261331384583000752044933826560297606737113200709328709127443747047230696977209310141692836819025515108657463772111252389784425056953696770785449969967946864454905987931636889230098793127736178215424999229576351482208269895193668033182528869398496465105820939239829488793320362509443117301238197068416140397019837679320683282376464804295311802328782509819455815301756717361332069811250996181881593041690351598888519345807273866738589422879228499892086805825749279610484198444363463244968487560233624827041978623209002160990235304369941849146314093431738143640546253152096183690888707016768396424378140592714563549061303107208510383750510115747704171898610687396965521267154688957035035402123407849819334321068170121005627880235193033224745015853904730419957777093503660416997329725088687696640355570716226844716256079882651787134195124665201030592123667719432527867539855894489697096409754591856956380236370162112047742722836489613422516445078182442352948636372141740238893441247963574370263755294448337998016125492278509257782562092622648326277933386566481627725164019105900491644998289315056604725802778631864155195653244258698294695930801915298721172556347546396447910145904090586298496791287406870504895858671747985466775757320568128845920541334053922000113786300945560688166740016984205580403363795376452030402432256613527836951177883863874439662532249850654995886234281899707733276171783928034946501434558897071942586398772754710962953741521115136835062752602326484728703920764310059584116612054529703023647254929666938115137322753645098889031360205724817658511806303644281231496550704751025446501172721155519486685080036853228183152196003735625279449515828418829478761085263981395599006737648292244375287184624578036")
    var displayStr = "2."
    var numericHeader = UITextView()
    var eulerPosition = 1
    @IBOutlet var gameOverView: UIView!
    @IBOutlet var visualEffectView: UIVisualEffectView!
    @IBAction func tryAgain(_ sender: Any) {
        animateOut()
    }
    
    var effect:UIVisualEffect!
    
    @IBOutlet var eulerScrollView: UIScrollView!
    @IBOutlet var highScoreLabel: UILabel!
    
    @IBAction func zeroPressed(_ sender: Any) {
        eulerPosition += 1
        displayStr += "0"
        numericHeader.text = numericHeader.text + "0"
        print(numericHeader.text)
        redrawScroll()
        validate(input: "0")
    }
    
    @IBAction func onePressed(_ sender: Any) {
        eulerPosition += 1
        displayStr += "1"
        numericHeader.text = numericHeader.text + "1"
        print(numericHeader.text)
        redrawScroll()
        validate(input: "1")
    }
    
    @IBAction func twoPressed(_ sender: Any) {
        eulerPosition += 1
        displayStr += "2"
        numericHeader.text = numericHeader.text + "2"
        print(numericHeader.text)
        redrawScroll()
        validate(input: "2")
    }
    
    @IBAction func threePressed(_ sender: Any) {
        eulerPosition += 1
        displayStr += "3"
        numericHeader.text = numericHeader.text + "3"
        print(numericHeader.text)
        redrawScroll()
        validate(input: "3")
    }
    
    @IBAction func fourPressed(_ sender: Any) {
        eulerPosition += 1
        displayStr += "4"
        numericHeader.text = numericHeader.text + "4"
        print(numericHeader.text)
        redrawScroll()
        validate(input: "4")
    }
    
    @IBAction func fivePressed(_ sender: Any) {
        eulerPosition += 1
        displayStr += "5"
        numericHeader.text = numericHeader.text + "5"
        print(numericHeader.text)
        redrawScroll()
        validate(input: "5")
    }
    
    @IBAction func sixPressed(_ sender: Any) {
        eulerPosition += 1
        displayStr += "6"
        numericHeader.text = numericHeader.text + "6"
        print(numericHeader.text)
        redrawScroll()
        validate(input: "6")
    }
    
    @IBAction func sevenPressed(_ sender: Any) {
        eulerPosition += 1
        displayStr += "7"
        numericHeader.text = numericHeader.text + "7"
        print(numericHeader.text)
        redrawScroll()
        validate(input: "7")
    }
    
    @IBAction func eightPressed(_ sender: Any) {
        eulerPosition += 1
        displayStr += "8"
        numericHeader.text = numericHeader.text + "8"
        print(numericHeader.text)
        redrawScroll()
        validate(input: "8")
    }
    
    @IBAction func ninePressed(_ sender: Any) {
        eulerPosition += 1
        displayStr += "9"
        numericHeader.text = numericHeader.text + "9"
        print(numericHeader.text)
        redrawScroll()
        validate(input: "9")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let maxSize = CGSize(width: 9999, height: 9999)
        let font = UIFont(name: "Menlo", size: 48)!
        let strSize = (displayStr as NSString).boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [.font : font], context: nil)
        let frame = CGRect(x: 0, y: 44, width: strSize.width + 50, height: strSize.height + 10)
        numericHeader.frame = frame
        numericHeader.isEditable = false
        numericHeader.isScrollEnabled = false
        numericHeader.font = font
        numericHeader.text = displayStr
        
        eulerScrollView.contentSize = CGSize(width: strSize.width, height: strSize.height)
        eulerScrollView.addSubview(numericHeader)
        print(e)
        
        for i in 1...10 {
            self.view.viewWithTag(i)?.layer.cornerRadius = (self.view.viewWithTag(i)?.frame.height)!/2
        }
        
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        gameOverView.layer.cornerRadius = 5
        //visualEffectView.layer.zPosition = 0
        if UserDefaults.standard.integer(forKey: "highScore") != 0 {
            highScoreLabel.text = String(UserDefaults.standard.integer(forKey: "highScore"))
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func validate(input: String) {
        print("We are the sensory organs of the universe.")
        print(e[eulerPosition])
        print(input)
        print(String(e[eulerPosition]) == input)
        if String(e[eulerPosition]) != input {
            defeatUser()
        }
    }
    
    func animateIn() {
        self.view.addSubview(gameOverView)
        gameOverView.center = self.view.center
        gameOverView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        gameOverView.alpha = 0
        visualEffectView.layer.zPosition = 100 // overkill much?
        gameOverView.layer.zPosition = 101 // overkill much?
        UIView.animate(withDuration: 0.6) {
            self.visualEffectView.effect = self.effect
            self.gameOverView.alpha = 1
            self.gameOverView.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut() {
        UIView.animate(withDuration: 0.5, animations: {
            self.gameOverView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.gameOverView.alpha = 0
            self.visualEffectView.effect = nil
        }) { (isSuccess:Bool) in
            self.gameOverView.removeFromSuperview()
        }
    }
    
    func redrawScroll() {
        let maxSize = CGSize(width: 9999, height: 9999)
        let font = UIFont(name: "Menlo", size: 48)!
        let strSize = (displayStr as NSString).boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [.font : font], context: nil)
        let frame = CGRect(x: 0, y: 44, width: strSize.width + 50, height: strSize.height + 10)
        numericHeader.frame = frame
        numericHeader.isEditable = false
        numericHeader.isScrollEnabled = false
        numericHeader.font = font
        numericHeader.text = displayStr
        
        eulerScrollView.contentSize = CGSize(width: strSize.width, height: strSize.height)
        // TODO: - Implement autoscroll
    }
    
    func defeatUser() {
        // present game over screen with options and stuff and set high score
        animateIn()
        UserDefaults.standard.set(eulerPosition, forKey: "highScore")
    }

}

