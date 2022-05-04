import Scenes
import Igis

  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {
    var table: Rectangle = Rectangle(rect:Rect(topLeft:Point(x:0, y:0), size:Size(width:1500, height:1500)))
    init() {        
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Background")
      }
    override func render(canvas:Canvas) {
            let leftScoreboardScore = Int(InteractionLayer.leftScoreboard.scoreboard.text)!
            let rightScoreboardScore = Int(InteractionLayer.rightScoreboard.scoreboard.text)!
            let topScoreboardScore = Int(InteractionLayer.topScoreboard.scoreboard.text)!
            let bottomScoreboardScore = Int(InteractionLayer.bottomScoreboard.scoreboard.text)!
            let ball = InteractionLayer.ball

            if(leftScoreboardScore <= 0 || rightScoreboardScore <= 0 || topScoreboardScore <= 0 || bottomScoreboardScore <= 0){
                let tableRect = Rect(topLeft:Point(x:0, y:0), size:Size(width:1900, height:1900))
                table = Rectangle(rect:tableRect, fillMode:.fill)
                let fillStyle4 = FillStyle(color:Color(.red))
                ball.ellipse.center = Point(x:1000, y:500) 
                ball.changeVelocity(velocityX: 0, velocityY: 0)
                canvas.render(fillStyle4, table)
            }
            else{
                let tableRect = Rect(topLeft:Point(x:0, y:0), size:Size(width:1900, height:1900))
                table = Rectangle(rect:tableRect, fillMode:.fill)
                let fillStyle4 = FillStyle(color:Color(.green))
                canvas.render(fillStyle4, table)
            }
            
            /*else{
                print(leftScoreboardScore)
                let tableRect = Rect(topLeft:Point(x:0, y:0), size:Size(width:1900, height:1900))
                table = Rectangle(rect:tableRect, fillMode:.fill)
                let fillStyle4 = FillStyle(color:Color(.red))
                canvas.render(fillStyle4, table)
            }*/
      }
}
