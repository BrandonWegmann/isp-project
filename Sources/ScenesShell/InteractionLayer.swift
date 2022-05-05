import Igis
import Scenes

/*
 This class is responsible for the interaction Layer.
 Internally, it maintains the RenderableEntities for this layer.
 */


class InteractionLayer : Layer, KeyDownHandler {

    static let ball = Ball()
    var canvasSize = Size(width:0, height:0)
    static let paddleLeft = Paddle(rect:Rect(size:Size(width:20, height:200)))
    static let paddleRight = Paddle(rect:Rect(size:Size(width:20, height:200)))
    static let paddletop = Paddle(rect:Rect(size:Size(width:250, height:20)))
    static let paddlebottom = Paddle(rect:Rect(size:Size(width:250, height:20)))
    static let leftScoreboard = Scoreboard()
    static let rightScoreboard = Scoreboard()
    static let topScoreboard = Scoreboard()
    static let bottomScoreboard = Scoreboard()

    required  init() {
        Self.ball.changeVelocity(velocityX: 14, velocityY: -14)
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Interaction")
        // We insert our RenderableEntities in the constructor
        insert(entity: Self.ball, at: .front)
        insert(entity: Self.paddleLeft, at: .front)
        insert(entity: Self.paddleRight, at: .front)
        insert(entity: Self.paddletop, at: .front)
        insert(entity: Self.paddlebottom, at: .front)
        insert(entity: Self.leftScoreboard, at: .front)
        insert(entity: Self.rightScoreboard, at: .front)
        insert(entity: Self.topScoreboard, at: .front)
        insert(entity: Self.bottomScoreboard, at: .front)
    }
    func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
        let movement = 80
        switch(key) {
        case "w" :
            //left paddle up
            if Self.paddleLeft.rectangle.rect.topLeft.y >= 50 {
                Self.paddleLeft.move(to:Point(x: Self.paddleLeft.rectangle.rect.topLeft.x, y: Self.paddleLeft.rectangle.rect.topLeft.y - movement))
            }
        case "s" :
            //left paddle down
            if Self.paddleLeft.rectangle.rect.topLeft.y >= 790 {
                Self.paddleLeft.move(to:Point(x: Self.paddleLeft.rectangle.rect.topLeft.x, y: Self.paddleLeft.rectangle.rect.topLeft.y + movement))
            }
        case "ArrowUp" :
            //right paddle up
            if Self.paddleRight.rectangle.rect.topLeft.y >= 50 {
                Self.paddleRight.move(to:Point(x: Self.paddleRight.rectangle.rect.topLeft.x, y: Self.paddleRight.rectangle.rect.topLeft.y - movement))
            }
        case "ArrowDown" :
            //right paddle down
            if Self.paddleRight.rectangle.rect.topLeft.y <= 790 {
                Self.paddleRight.move(to:Point(x: Self.paddleRight.rectangle.rect.topLeft.x, y: Self.paddleRight.rectangle.rect.topLeft.y + movement))
            }
        case "a" :
            //top paddleleft
            if Self.paddletop.rectangle.rect.topLeft.x >= 50 {
                Self.paddletop.move(to:Point(x: Self.paddletop.rectangle.rect.topLeft.x - movement, y: Self.paddletop.rectangle.rect.topLeft.y))
            }
        case "d" :
            //top paddle right
            if Self.paddletop.rectangle.rect.topLeft.x <= 1890  {
                Self.paddletop.move(to:Point(x: Self.paddletop.rectangle.rect.topLeft.x + movement, y: Self.paddletop.rectangle.rect.topLeft.y))
            }
        case "ArrowLeft" :
            //bottom paddle left
            if Self.paddlebottom.rectangle.rect.topLeft.x >= 50 {
                Self.paddlebottom.move(to:Point(x: Self.paddlebottom.rectangle.rect.topLeft.x - movement, y: Self.paddlebottom.rectangle.rect.topLeft.y))
            }
        case "ArrowRight" :
            //bottom paddle right
            if Self.paddlebottom.rectangle.rect.topLeft.x <= 1890 {
                Self.paddlebottom.move(to:Point(x: Self.paddlebottom.rectangle.rect.topLeft.x + movement, y: Self.paddlebottom.rectangle.rect.topLeft.y))
            }
        default:
            fatalError("needs to work \(key)")
        }
    }
    override func preSetup(canvasSize: Size, canvas: Canvas) {
        Self.paddleLeft.move(to:Point(x: 10, y: canvasSize.center.y))
        Self.paddleRight.move(to:Point(x:canvasSize.width-20, y:canvasSize.center.y))
        Self.paddletop.move(to:Point(x:canvasSize.center.x, y: 10))
        Self.paddlebottom.move(to:Point(x:canvasSize.center.x, y:canvasSize.height-40))
        Self.leftScoreboard.scoreboard.location = Point(x:canvasSize.width/4, y:canvasSize.height/2)
        Self.rightScoreboard.scoreboard.location = Point(x:3*canvasSize.width/4, y:canvasSize.height/2)
        Self.topScoreboard.scoreboard.location = Point(x:canvasSize.width/2, y:canvasSize.height/8)
        Self.bottomScoreboard.scoreboard.location = Point(x:canvasSize.width/2, y:5*canvasSize.height/6)

        dispatcher.registerKeyDownHandler(handler: self)
    }
    override func postTeardown() {
        dispatcher.unregisterKeyDownHandler(handler: self)
    }
    override func preCalculate(canvas: Canvas) {
        let ballCoundingRect = Self.ball.boundingRect()

        let leftPaddleBoundingRect = Self.paddleLeft.boundingRect()
        let leftPaddleContainment = leftPaddleBoundingRect.containment(target: ballCoundingRect)
        let leftPaddleTargetContainmentSet: ContainmentSet = [.overlapsRight, .contact]

        if leftPaddleTargetContainmentSet.isSubset(of: leftPaddleContainment){
            Self.ball.velocityX = -Self.ball.velocityX 
        }

        let rightPaddleBoundingRect = Self.paddleRight.boundingRect()
        let rightPaddleContainment = rightPaddleBoundingRect.containment(target: ballCoundingRect)
        let rightPaddleTargetContainmentSet: ContainmentSet = [.overlapsLeft, .contact]

        if rightPaddleTargetContainmentSet.isSubset(of: rightPaddleContainment){
            Self.ball.velocityX = -Self.ball.velocityX 
        }
        let topPaddleBoundingRect = Self.paddletop.boundingRect()
        let topPaddleContainment = topPaddleBoundingRect.containment(target: ballCoundingRect)
        let topPaddleTargetContainmentSet: ContainmentSet = [.overlapsBottom, .contact]

        if topPaddleTargetContainmentSet.isSubset(of: topPaddleContainment){
            Self.ball.velocityY = -Self.ball.velocityY 
        }
        let bottomPaddleBoundingRect = Self.paddlebottom.boundingRect()
        let bottomPaddleContainment = bottomPaddleBoundingRect.containment(target: ballCoundingRect)
        let bottomPaddleTargetContainmentSet: ContainmentSet = [.overlapsTop, .contact]

        if bottomPaddleTargetContainmentSet.isSubset(of: bottomPaddleContainment){
            Self.ball.velocityY = -Self.ball.velocityY 
        }
    }

    override func postCalculate(canvas:Canvas){ //1899
        if Self.ball.boundingRect().topRight.x >= canvas.canvasSize!.width + 2 {
            Self.rightScoreboard.subtractScore(amount: 1)
        }
        if Self.ball.boundingRect().topLeft.x <= 1/2 {
            Self.leftScoreboard.subtractScore(amount: 1)
        }
        if Self.ball.boundingRect().topLeft.y <= 1/2 {
            Self.topScoreboard.subtractScore(amount: 1)
        }
        if Self.ball.boundingRect().bottomLeft.y >= canvas.canvasSize!.height {
            Self.bottomScoreboard.subtractScore(amount: 1)
        }
    }
    
}
