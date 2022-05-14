import Igis
import Scenes

/* Used the same basics from 1521 to assist us in making the scoreboard although this one subtracts instead of adding */

class Scoreboard: RenderableEntity {
    let scoreboard: Text

    init() {
        scoreboard = Text(location:Point.zero, text:String(10), fillMode:.fill)
        scoreboard.font = "45pt Impact"

        super.init(name:"Scoreboard")
    }
    //takes one away from the scoreboard 
    func subtractScore(amount:Int){
     scoreboard.text = String(Int(scoreboard.text)! - amount)
    }
    override func render(canvas:Canvas) {
        canvas.render(FillStyle(color:Color(.white)), scoreboard)
    }
    //renders the scoreboard
}
