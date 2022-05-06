import Igis
import Scenes

class Ball: RenderableEntity, MouseMoveHandler {
    var compressedCounter : UInt
    var velocityX : Int
    var velocityY : Int
    var didRender = false
    let ellipse = Ellipse(center:Point(x:0, y:0), radiusX:25, radiusY:25, fillMode:.fillAndStroke)
    let strokeStyle = StrokeStyle(color:Color(.white))
    let fillStyle = FillStyle(color:Color(.white))
    let lineWidth = LineWidth(width:5)
    init() {
        velocityX = 0
        velocityY = 0
        compressedCounter = 0
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Ball")
    }
    func changeVelocity(velocityX:Int, velocityY:Int) {
        self.velocityX = velocityX
        self.velocityY = velocityY
    }
    func onMouseMove(globalLocation: Point, movement:Point) {
        ellipse.center = globalLocation
    }
    override func calculate(canvasSize: Size) {
        ellipse.center += Point(x: velocityX, y: velocityY)

        // Form a bounding rectangle around the canvas
        let canvasBoundingRect = Rect(size:canvasSize)

        // Form a bounding rect around the ball (ellipse)
        let ballBoundingRect = Rect(topLeft:Point(x:ellipse.center.x-ellipse.radiusX, y:ellipse.center.y-ellipse.radiusY),
                                    size:Size(width:ellipse.radiusX*2, height:ellipse.radiusY*2))

        // Determine if we've moved outside of the canvas boundary rect
        let tooFarLeft = ballBoundingRect.topLeft.x < canvasBoundingRect.topLeft.x
        let tooFarRight = ballBoundingRect.topLeft.x + ballBoundingRect.size.width > canvasBoundingRect.topLeft.x + canvasBoundingRect.size.width

        let tooFarUp = ballBoundingRect.topLeft.y < canvasBoundingRect.topLeft.y
        let tooFarDown = ballBoundingRect.topLeft.y + ballBoundingRect.size.height > canvasBoundingRect.topLeft.y + canvasBoundingRect.size.height

        if tooFarLeft || tooFarRight {
            velocityX = -velocityX 

            ellipse.radiusX = 25
            ellipse.radiusY = 25
            compressedCounter = 10
        }
        if tooFarUp || tooFarDown {
            velocityY = -velocityY
            ellipse.radiusX = 25
            ellipse.radiusY = 25 
            compressedCounter = 10
        }
        if compressedCounter == 0 {
            ellipse.radiusX = 25
            ellipse.radiusY = 25
        }else{
            compressedCounter -= 1
        }
    }
        override func setup(canvasSize: Size, canvas: Canvas) {
            ellipse.center = canvasSize.center
            dispatcher.registerMouseMoveHandler(handler:self)
        }
        override func teardown() {
            dispatcher.unregisterMouseMoveHandler(handler:self)
        }
        override func boundingRect() -> Rect {
            let topLeft = ellipse.center - Point(x: ellipse.radiusX, y: ellipse.radiusY)
            let size = Size(width: 2 * ellipse.radiusX, height: 2 * ellipse.radiusY)
            return Rect (topLeft: topLeft, size: size)
        }
        override func render(canvas:Canvas) {
            let clear = canvas.canvasSize!
            if let canvasSize = canvas.canvasSize, !didRender {
                let clearRect = Rect(topLeft:Point(x:0, y:0), size:canvasSize)
                let clear  = Rectangle(rect:clearRect, fillMode:.clear)
                canvas.render(strokeStyle, lineWidth, fillStyle, ellipse)
            }
        }
    }
