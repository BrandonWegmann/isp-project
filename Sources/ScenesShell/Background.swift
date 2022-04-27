import Scenes                                                                                                     
   2 | import Igis                                                                                                       
   3 |                                                                                                                   
   4 |   /*                                                                                                              
   5 |      This class is responsible for rendering the background.                                                      
   6 |    */                                                                                                             
   7 |                                                                                                                   
   8 |                                                                                                                   
   9 | class Background : RenderableEntity {                                                                             
  10 |     var sky: Rectangle = Rectangle(rect:Rect(topLeft:Point(x:0, y:0), size:Size(width:1500, height:1500)))        
  11 |       init() {                                                                                                    
  12 |           // Using a meaningful name can be helpful for debugging                                                 
  13 |           super.init(name:"Background")                                                                           
  14 |       }                                                                                                           
  15 |       override func render(canvas:Canvas) {                                                                       
  16 |           let skyRect = Rect(topLeft:Point(x:0, y:0), size:Size(width:1900, height:1900))                         
  17 |           sky = Rectangle(rect:skyRect, fillMode:.fill)                                                           
  18 |           let fillStyle4 = FillStyle(color:Color(.black))                                                         
  19 |           canvas.render(fillStyle4, sky)                                                                          
  20 |                                                                                                                   
  21 | }                                                                                                                 
  22 | }
