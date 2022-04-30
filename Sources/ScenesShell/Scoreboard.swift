import Igis
import Scenes

class Scoreboard: RenderableEntity {
    let scoreboard:Text

    init() {
        scoreboard = Text(location:Point.zero, text:String(10), fillMode:.fill)
        scoreboard.font = "45pt Impact"

        super.init(name:"Scoreboard")
    }
    func addScore(amount:Int){
        scoreboard.text = String(Int(scoreboard.text)! - amount)
    }
    override func render(canvas:Canvas) {
        canvas.render(FillStyle(color:Color(.white)), scoreboard)
    }
}
