import Igis
import Scenes

/*
 This class is primarily responsible for transitioning between Scenes.
 At a minimum, it must enqueue the first Scene.
*/
class ShellDirector : Director {
    required init() {
        super.init()
        enqueueScene(scene:MainScene())
    }

    override func framesPerSecond() -> Int {
        return 50 //This will render the game at 50fps
    }

}

