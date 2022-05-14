import Igis
import Scenes

/* had help from Sahil in getting the scoreboard to work */

class Scoreboard: RenderableEntity {
    let scoreboard: Text

    init() {
        scoreboard = Text(location:Point.zero, text:String(10), fillMode:.fill)
        scoreboard.font = "45pt Impact"

        super.init(name:"Scoreboard")
    }
    func subtractScore(amount:Int){
     scoreboard.text = String(Int(scoreboard.text)! - amount)
    }
    //adds one to the scoreboard text 
    override func render(canvas:Canvas) {
        canvas.render(FillStyle(color:Color(.white)), scoreboard)
    }
    //renders the scoreboard
}
