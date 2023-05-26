//
//  GameScene.swift
//  GameProject
//
//  Created by Bodie Woods on 5/8/23.
//

import SpriteKit
import GameplayKit
import AudioToolbox





enum GameSceneState {
    case active, gameOver
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    
    
    private var player : SKSpriteNode?
    public var highscore = 0
    public var generator = UINotificationFeedbackGenerator()
    private var label : SKLabelNode?
    private var menu: SKNode?
    private var box: SKNode?
    private var box2: SKNode?
    private var coin: SKNode?
    private var ind: SKNode?
    public var laserpoint = 1000
    public var lasertime = 1
    public var laseronscreen = 1
    private var laser: SKNode?
    public var iscoin = false
    public var islaser = false
    public var laserhitactive = false
    public var score = 0
    public var speeds = 5
    public var hit = false
    public var tap: SKLabelNode?
    public var gameover : SKNode?
    var gameState: GameSceneState = .gameOver
    public var startx = CGFloat(0)
    public var starty = CGFloat(0)
    public var initx = CGFloat(0)
    public var inity = CGFloat(280)

    
    func didBegin(_ contact: SKPhysicsContact) {
        
        if contact.bodyB.node == coin{
            if iscoin == true{
                if let coin = self.coin{
                    
                    
                    
                    coin.run(SKAction.moveTo(x: 400, duration: 0))
                    
                    let impactLight = UIImpactFeedbackGenerator(style: .medium)
                    impactLight.impactOccurred()
                    
                    
                 
                    score = score + 5
                    iscoin = false
                   
                }
            }
            
            return
        }
      /* Hero touches anything, game over */

      /* Ensure only called while game running */
      if gameState != .active { return }

      /* Change game state to game over */
      gameState = .gameOver

        if let gameover = self.gameover {
            gameover.alpha = 1.0
            gameover.zPosition = 2
            
        }
        
        if let tap = self.tap{
            tap.alpha = 1.0
            tap.zPosition = 2
        }
        
        if let menu = self.menu{
            menu.alpha = 1.0
            menu.zPosition = 1
        }
        
        
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        
        
        
        
        if score > highscore{
            highscore = score
            
            
        }
        
        print(highscore)
        
        
        if let label = self.label{
            label.position.y = label.position.y - 65
            label.text = "Score: " + String(score)
            
            
                label.zPosition = 2
            
                
            
        }
        
    }
    
    override func didMove(to view: SKView) {
        
        let explosiontextures = [
            SKTexture(image: UIImage(named: "1")!),
            SKTexture(image: UIImage(named: "2")!),
            SKTexture(image: UIImage(named: "3")!),
            SKTexture(image: UIImage(named: "4")!),
            SKTexture(image: UIImage(named: "5")!),
            SKTexture(image: UIImage(named: "6")!),
            
        ]
        
        
        
        
        physicsWorld.contactDelegate = self
        
        self.player = self.childNode(withName: "Player") as? SKSpriteNode
        if let player = self.player{
            player.position.x = initx
            player.position.y = inity
        }
        self.box = self.childNode(withName: "box")
        self.box2 = self.childNode(withName: "box2")
        self.coin = self.childNode(withName: "coin")
        self.menu = self.childNode(withName: "menu")
        self.ind = self.childNode(withName: "ind")
        self.laser = self.childNode(withName: "laser")
        self.tap = self.childNode(withName: "//tap") as? SKLabelNode
    
        // Get label node from scene and store it for use later
    
        
        // Create shape node to use during mouse interaction
        
        self.label = self.childNode(withName: "//score") as? SKLabelNode
        self.gameover = self.childNode(withName: "//gameover")
        
        if let ind = ind.self{
            ind.position.x = -2
            ind.position.y = 1000
        }
        
        if let laser = laser.self{
            laser.position.x = -2
            laser.position.y = 1000
        }
        
        if let label = self.label {
            label.position.y = label.position.y - 60
            label.alpha = 1.0
            label.zPosition = 2
            
        }
        
        if let gameover = self.gameover {
            gameover.alpha = 0.0
            
            
        }
        
        
        
        if let box = self.box{
            box.position.x = CGFloat(Int.random(in: -190...190))
           
        }
        if let box2 = self.box2{
            box2.position.x = CGFloat(Int.random(in: -190...190))
           
        }
        
        if let menu = self.menu {
            menu.alpha = 1.0
            menu.zPosition = 1
            
            
        }
        
        if let tap = self.tap{
            tap.alpha = 1.0
            tap.zPosition = 2
        }
        
       

     
    }
    
    
    
    func touchDown(atPoint pos : CGPoint) {
        if gameState != .active {
            
            islaser = false
            laserhitactive = false
            
            if let ind = self.ind{
                ind.position.y = 1000
            }
            
            if let laser = self.laser{
                laser.position.y = 1000
            }
            
            if let box = self.box{
                box.position.x = CGFloat(Int.random(in: -190...190))
                box.position.y = 736
            }
            
            if let box2 = self.box2{
                box2.position.x = CGFloat(Int.random(in: -190...190))
                box2.position.y = 1000
            }
            
            
            
            if let tap = self.tap{
                tap.alpha = 0.0
            }
            if let gameover = self.gameover {
                gameover.alpha = 0.0
                
                
            }
            
            if let menu = self.menu {
                menu.alpha = 0.0
                             
                
            }
           
            
            
            if let coin = self.coin{
                coin.position.x = 700
            }
            
            iscoin = false
            
            if let player = self.player{
                player.position.x = initx
                player.position.y = inity
            }
            
            
            gameState = .active
            
            if let label = self.label{
                label.position.y = label.position.y + 65
            }
            
            score = 0
            speeds = 5
            
            return }
        if let player = player.self{
//            player.position.x = pos.x
//            player.position.y = pos.y + 630
//            if player.position.y > 520{
//                player.position.y = 520
//
//            }
//            if player.position.y < 120{
//                player.position.y = 120
//            }
//            if player.position.x > 200{
//                player.position.x = 200
//            }
//            if player.position.x < -200{
//                player.position.x = -200
//            }
            
            startx = pos.x
            starty = pos.y
            
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if gameState != .active { return }
        if let player = player.self{
            player.position.x = player.position.x + (pos.x - startx)
            player.position.y = player.position.y + (pos.y - starty)
            if player.position.y > 530{
                player.position.y = 530
            }
            if player.position.y < 82{
                player.position.y = 82
            }
            if player.position.x > 190{
                player.position.x = 190
            }
            if player.position.x < -190{
                player.position.x = -190
            }
            
            startx = pos.x
            starty = pos.y
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
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
        if gameState != .active {
            
            
            
            return }
        // Called before each frame is rendered
        if let label = self.label{
            if let player = self.player{
                
                if laserhitactive == true{
                    if laseronscreen == 0{
                        
                        if let laser = self.laser{
                            laser.position.y = 1000
                            laserhitactive = false
                        }
                    }
                    laseronscreen = laseronscreen - 1
                }
                
                
                if islaser == true{
                    
                   
                    
                    if lasertime == 0{
                        if let laser = self.laser{
                            laser.position.y = CGFloat(laserpoint + 32)
                            lasertime = 1
                            islaser = false
                            laserhitactive = true
                            laseronscreen = 50
                            if let ind = self.ind{
                                ind.position.y = 1000
                            }
                        }
                    }
                    
                    lasertime = lasertime - 1
                }
                
                
                label.text = String(score)
                
                
                if let box = self.box{
                    box.position.y = box.position.y - CGFloat(speeds)
                    
                    if box.position.y < 95{
                        box.position.x = CGFloat(Int.random(in: -190...190))
                        box.position.y = 736
                        score = score + 1
                        
                       let coinspawn = Int.random(in: 0...10)
                        
                        
                        
                        
                        
                        
                        if iscoin == false{
                            
                            if coinspawn == 1{
                                
                                
                                
                                if let coin = self.coin{
                                    coin.position.x = CGFloat(Int.random(in: -190...190))
                                    coin.position.y = CGFloat(Int.random(in: 82...537))
                                    print("coin")
                                }
                                iscoin = true
                                
                            }
                            
                        }
                        
                        
                        
                        if speeds < 10{
                            speeds = speeds + 1
                        }
                        if score > 60{
                            speeds = 11
                        }
                        if score > 70{
                            speeds = 12
                        }
                        if score > 80{
                            speeds = 13
                        }
                        
                    }
                    
                   
                    
                    
                }
                if let box2 = self.box2{
                    box2.position.y = box2.position.y - CGFloat(speeds)
                    
                    if box2.position.y < 95{
                        box2.position.x = CGFloat(Int.random(in: -190...190))
                        box2.position.y = 736
                        
                        
                        if score > 1{
                            
                            var laserspawn = Int.random(in: 0...10)
                            
                            if score > 40{
                                laserspawn = Int.random(in: 1...5)
                            }
                            if score > 100{
                                laserspawn = 1
                            }
                            
                            if islaser == false{
                                if laserspawn == 1{
                                    if let ind = self.ind{
                                        
                                        let spawn = player.position.y - 25
                                        
                                        ind.position.y = spawn
                                        laserpoint = Int(spawn)
                                        islaser = true
                                        
                                        lasertime = 60
                                        
                                        
                                    }
                                }
                            }
                            
                            
                        }
                       
                    }
                    
                   
                    
                    
                }
                
                
                
            }
        }
    }
}
