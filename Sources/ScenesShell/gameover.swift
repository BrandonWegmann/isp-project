import Scenes
import Igis

  /*
     This class is responsible for rendering the background.
   */


class GameOver : RenderableEntity {
    var table: Rectangle = Rectangle(rect:Rect(topLeft:Point(x:0, y:0), size:Size(width:1500, height:1500)))
      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Background")
      }
      override func render(canvas:Canvas) {
          let tableRect = Rect(topLeft:Point(x:0, y:0), size:Size(width:1900, height:1900))
          table = Rectangle(rect:tableRect, fillMode:.fill)
          let fillStyle4 = FillStyle(color:Color(.green))
          canvas.render(fillStyle4, table)
      }
}
