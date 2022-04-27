 import Igis                                                                                                                                                                                                                                                                                                       
   2 | import Scenes                                                                                                                                                                                                                                                                                                     
   3 |                                                                                                                                                                                                                                                                                                                   
   4 | class Scoreboard: RenderableEntity {                                                                                                                                                                                                                                                                              
   5 |     let scoreboard:Text                                                                                                                                                                                                                                                                                           
   6 |                                                                                                                                                                                                                                                                                                                   
   7 |     init() {                                                                                                                                                                                                                                                                                                      
   8 |         scoreboard = Text(location:Point.zero, text:String(0), fillMode:.fill)                                                                                                                                                                                                                                    
   9 |         scoreboard.font = "50pt Arial"                                                                                                                                                                                                                                                                            
  10 |                                                                                                                                                                                                                                                                                                                   
  11 |         super.init(name:"Scoreboard")                                                                                                                                                                                                                                                                             
  12 |     }                                                                                                                                                                                                                                                                                                             
  13 |     func addScore(amount:Int){                                                                                                                                                                                                                                                                                    
  14 |         scoreboard.text = String(Int(scoreboard.text)! + amount)                                                                                                                                                                                                                                                  
  15 |     }                                                                                                                                                                                                                                                                                                             
  16 |     override func render(canvas:Canvas) {                                                                                                                                                                                                                                                                         
  17 |         canvas.render(FillStyle(color:Color(.white)), scoreboard)                                                                                                                                                                                                                                                 
  18 |     }                                                                                                                                                                                                                                                                                                             
  19 | } 
