//
//  GameScene.swift
//  Platformer
//
//  Created by Bodie Woods on 4/13/23.
//

import SpriteKit
import GameplayKit

class Start: SKScene {
    
    private var button : SKNode?
    private var logo : SKNode?
    private var menu: SKNode?
    private var txt1: SKLabelNode?
    private var txt2: SKLabelNode?
    private var txt3: SKLabelNode?
    private var txt4: SKLabelNode?
    private var txt5: SKLabelNode?
    private var toggle = false
    
    private var infobutton: SKNode?
    
    
    override func didMove(to view: SKView) {
        
        self.button = self.childNode(withName: "start")
        
        self.logo = self.childNode(withName: "startlogo")
        
        self.infobutton = self.childNode(withName: "info")
        
        self.menu = self.childNode(withName: "menu")
        
        self.txt1 = self.childNode(withName: "//txt1") as! SKLabelNode
        self.txt2 = self.childNode(withName: "//txt2") as! SKLabelNode
        self.txt3 = self.childNode(withName: "//txt3") as! SKLabelNode
        self.txt4 = self.childNode(withName: "//txt4") as! SKLabelNode
        self.txt5 = self.childNode(withName: "//txt5") as! SKLabelNode
        
        
        if let menu = self.menu{
            menu.alpha = 0
        }
        
        if let txt1 = self.txt1{
            txt1.alpha = 0
        }
        if let txt2 = self.txt2{
            txt2.alpha = 0
        }
        if let txt3 = self.txt3{
            txt3.alpha = 0
        }
        if let txt4 = self.txt4{
            txt4.alpha = 0
        }
        if let txt5 = self.txt5{
            txt5.alpha = 0
        }
       
        
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
        
        
        
      
//        if let view = self.view as! SKView? {
//            // Load the SKScene from 'GameScene.sks'
//            if let scene = SKScene(fileNamed: "GameScene") {
//                // Set the scale mode to scale to fit the window
//                scene.scaleMode = .aspectFill
//
//                // Present the scene
//                view.presentScene(scene)
//            }
//
////                    view.ignoresSiblingOrder = true
////
////                    view.showsFPS = true
////                    view.showsNodeCount = true
//        }
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
      
    }
    
    func touchUp(atPoint pos : CGPoint) {
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("touched screen?")
       
        for touch in touches {
                  let location = touch.location(in: self)
                  let touchedNode = atPoint(location)
            if touchedNode.name == "start" || touchedNode.name == "startlogo" {
                      print("touched button")
                      if let view = self.view as! SKView?{
                          if let scene = SKScene(fileNamed: "GameScene") {
                              let impactLight = UIImpactFeedbackGenerator(style: .medium)
                              impactLight.impactOccurred()
                              scene.scaleMode = .resizeFill
                              view.presentScene(scene)
                              
                          }
                          
                      }
            } else if touchedNode.name == "info"{
                if toggle == false{
                    if let menu = self.menu{
                        menu.alpha = 1
                        toggle.toggle()
                    }
                    if let txt1 = self.txt1{
                        txt1.alpha = 1
                    }
                    if let txt2 = self.txt2{
                        txt2.alpha = 1
                    }
                    if let txt3 = self.txt3{
                        txt3.alpha = 1
                    }
                    if let txt4 = self.txt4{
                        txt4.alpha = 1
                    }
                    if let txt5 = self.txt5{
                        txt5.alpha = 1
                    }
                    
                } else if toggle == true{
                    if let menu = self.menu{
                        menu.alpha = 0
                        toggle.toggle()
                    }
                    if let txt1 = self.txt1{
                        txt1.alpha = 0
                    }
                    if let txt2 = self.txt2{
                        txt2.alpha = 0
                    }
                    if let txt3 = self.txt3{
                        txt3.alpha = 0
                    }
                    if let txt4 = self.txt4{
                        txt4.alpha = 0
                    }
                    if let txt5 = self.txt5{
                        txt5.alpha = 0
                    }
                }
            }
             }
        //for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
    
        
        
    }
}
