import Igis                                                                                                                                                                                                                                    
   2 | import Scenes                                                                                                                                                                                                                                  
   3 |                                                                                                                                                                                                                                                
   4 | /*                                                                                                                                                                                                                                             
   5 |  This class is primarily responsible for transitioning between Scenes.                                                                                                                                                                         
   6 |  At a minimum, it must enqueue the first Scene.                                                                                                                                                                                                
   7 | */                                                                                                                                                                                                                                             
   8 | class ShellDirector : Director {                                                                                                                                                                                                               
   9 |     required init() {                                                                                                                                                                                                                          
  10 |         super.init()                                                                                                                                                                                                                           
  11 |         enqueueScene(scene:MainScene())                                                                                                                                                                                                        
  12 |     }                                                                                                                                                                                                                                          
  13 |                                                                                                                                                                                                                                                
  14 |     override func framesPerSecond() -> Int {                                                                                                                                                                                                   
  15 |         return 30                                                                                                                                                                                                                              
  16 |     }                                                                                                                                                                                                                                          
  17 |                                                                                                                                                                                                                                                
  18 | }                                                                                                                                                                                                                                              
  19 |  
