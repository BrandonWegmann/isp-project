import Scenes                                                                                                                                                                                                                                  
   2 |                                                                                                                                                                                                                                                
   3 |   /*                                                                                                                                                                                                                                           
   4 |      This class is responsible for the foreground Layer.                                                                                                                                                                                       
   5 |      Internally, it maintains the RenderableEntities for this layer.                                                                                                                                                                           
   6 |    */                                                                                                                                                                                                                                          
   7 |                                                                                                                                                                                                                                                
   8 |                                                                                                                                                                                                                                                
   9 | class ForegroundLayer : Layer {                                                                                                                                                                                                                
  10 |                                                                                                                                                                                                                                                
  11 |       init() {                                                                                                                                                                                                                                 
  12 |           // Using a meaningful name can be helpful for debugging                                                                                                                                                                              
  13 |           super.init(name:"Foreground")                                                                                                                                                                                                        
  14 |                                                                                                                                                                                                                                                
  15 |           // We insert our RenderableEntities in the constructor                                                                                                                                                                               
  16 |                                                                                                                                                                                                                                                
  17 |       }                                                                                                                                                                                                                                        
  18 |   } 
