import Foundation
import Scenes
import Igis

  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {
    var table: Rectangle = Rectangle(rect:Rect(topLeft:Point(x:0, y:0), size:Size(width:1500, height:1500)))
    let supreme:Image
    init() {
        guard let supremeURL = URL(string:"https://fontmeme.com/permalink/220512/9f02a78a6db8f1db44718c206bdb6f58.png")
        else {
            fatalError("Failed to create URL for supreme")
        }
        supreme = Image(sourceURL:supremeURL)
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Background")
    }
    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(supreme)
    }
    override func render(canvas:Canvas) {
          let leftScoreboardScore = Int(InteractionLayer.leftScoreboard.scoreboard.text)!
            let rightScoreboardScore = Int(InteractionLayer.rightScoreboard.scoreboard.text)!
            let topScoreboardScore = Int(InteractionLayer.topScoreboard.scoreboard.text)!
            let bottomScoreboardScore = Int(InteractionLayer.bottomScoreboard.scoreboard.text)!
            let ball = InteractionLayer.ball

            if(leftScoreboardScore == 0 && rightScoreboardScore == 0 && topScoreboardScore == 0 || leftScoreboardScore == 0 && rightScoreboardScore == 0 && bottomScoreboardScore == 0){
                let tableRect = Rect(topLeft:Point(x:0, y:0), size:Size(width:canvas.canvasSize!.width, height:canvas.canvasSize!.height))
                table = Rectangle(rect:tableRect, fillMode:.fill)
                let fillStyle4 = FillStyle(color:Color(.black))
                ball.ellipse.center = Point(x:canvas.canvasSize!.width/2, y:canvas.canvasSize!.height/2)
                ball.changeVelocity(velocityX: 0, velocityY: 0)
                canvas.render(fillStyle4, table)
            } else{
                let tableRect = Rect(topLeft:Point(x:0, y:0), size:Size(width:canvas.canvasSize!.width, height:canvas.canvasSize!.height))
                table = Rectangle(rect:tableRect, fillMode:.fill)
                let fillStyle4 = FillStyle(color:Color(.red))
                canvas.render(fillStyle4, table)
            }
            if(rightScoreboardScore == 0 && topScoreboardScore == 0 && bottomScoreboardScore == 0 || leftScoreboardScore == 0 && topScoreboardScore == 0 && bottomScoreboardScore == 0){
                let tableRect = Rect(topLeft:Point(x:0, y:0), size:Size(width:canvas.canvasSize!.width, height:canvas.canvasSize!.height))
                table = Rectangle(rect:tableRect, fillMode:.fill)
                let fillStyle4 = FillStyle(color:Color(.black))
                ball.ellipse.center = Point(x:canvas.canvasSize!.width/2, y:canvas.canvasSize!.height/2)
                ball.changeVelocity(velocityX: 0, velocityY: 0)
                canvas.render(fillStyle4, table)
            } else{
                let tableRect = Rect(topLeft:Point(x:0, y:0), size:Size(width:canvas.canvasSize!.width, height:canvas.canvasSize!.height))
                table = Rectangle(rect:tableRect, fillMode:.fill)
                let fillStyle4 = FillStyle(color:Color(.red))
                canvas.render(fillStyle4, table)
            }
            //if else statement checks to see which scoreboard are 0 and if three of the scoreboards are 0 then it will freeze the ball and turn the screen red
            if supreme.isReady {
                supreme.renderMode = .destinationRect(Rect(topLeft:Point(x:canvas.canvasSize!.width/2-200, y:canvas.canvasSize!.height/2-50), size:Size(width:400, height:100)))
                canvas.render(supreme)
            }
    }
    
}
