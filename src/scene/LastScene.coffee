jpp.util.Namespace('jpp.command').use()
jpp.util.Namespace('jpp.event').use()
jpp.util.Namespace('jpp.milkpack').use()


#===============================================
#
# 最後のシーン
#
#===============================================
class LastScene extends jpp.milkpack.Scene

    #===============================================
    #
    # メンバ変数の定義
    #
    #===============================================

    manager      : null
    pageContainer: null
    moveContainer: null
    zoomContainer: null

    @stage: null
    @image: null
    @bitmap: null

    #===============================================
    #
    # メソッドの定義 / オーバーライド
    #
    #===============================================

    #初期化メソッドのオーバーライド
    _onInit: () =>
        @manager       = @getManager()
        @pageContainer = @manager.pageContainer
        @moveContainer = @manager.moveContainer
        @zoomContainer = @manager.zoomContainer

        @stage = @manager.stage
        @image = @manager.resourcesById[@manager.pageLength - 1]
        @bitmap = new createjs.Bitmap(@image)

        @setTitle('See you | PushState for CreateJS')

    #シーン遷移メソッド（シーン通過 / 到着）のオーバーライド
    _onHello: () =>
        @addCommand(
        )

    #シーン遷移メソッド（シーン到着）のオーバーライド
    _onArrive: () =>
        @manager.addEventListener(jpp.event.Event.RESIZE, @_stageResizeHandler)
        @resizeTo(@manager.stageWidth, @manager.stageHeight)

        @stage.addChild(@bitmap)
        @bitmap.alpha = 0

        targetX        = 0
        targetY        = 0
        targetScale    = 0
        targetRotation = Math.random() * Math.PI * 2

        time   = 2
        easing = jpp.util.Easing.easeInOutQuart

        @addCommand(
            new jpp.command.Parallel(
                new jpp.command.Tween(@zoomContainer, { scaleX:1, scaleY: 1 }, null, time, easing)
                new jpp.command.Tween(@moveContainer, { x: targetX, y:targetY, scaleX:targetScale, scaleY: targetScale, rotation: targetRotation }, null, time, easing)
            )
            new jpp.command.Tween(@bitmap, { alpha: 1 }, null, 1, jpp.util.Easing.Linear)
            () =>
                @stage.onClick = (event) =>
                    @_manager.gotoSpecifiedPageByFragment('/')
        )

    #シーン遷移メソッド（シーン離脱）のオーバーライド
    _onLeave: () =>
        @manager.removeEventListener(jpp.event.Event.RESIZE, @_stageResizeHandler)
        @stage.removeChild(@bitmap)

        @stage.onClick = null

        if @manager.getTargetFragment() == '/'
            targetX        = 200
            targetY        = 0
            targetScale    = 0.08
            targetRotation = 0
            time   = 2
            easing = jpp.util.Easing.easeInOutQuart
            @addCommand(
                new jpp.command.Parallel(
                    new jpp.command.Tween(@moveContainer, { x: targetX, y:targetY, scaleX:targetScale, scaleY: targetScale, rotation: targetRotation }, null, time, easing)
                    new jpp.command.Tween(@zoomContainer, { scaleX:1, scaleY: 1 }, null, time, easing)
                )
                new jpp.command.Wait(1)
            )

    #シーン遷移メソッド（シーン離脱 / 通過）のオーバーライド
    _onBye: () =>
        @addCommand(
        )

    _stageResizeHandler: (event) =>
        @resizeTo(@manager.stageWidth, @manager.stageHeight)

    resizeTo: (stageWidth, stageHeight) ->
        rect = RectangleResizer.resize(RectangleResizer.rect(0, 0, 1024, 768), RectangleResizer.rect(0, 0, stageWidth, stageHeight))
        @bitmap.x      = rect.x
        @bitmap.y      = rect.y
        @bitmap.scaleX = rect.scaleX
        @bitmap.scaleY = rect.scaleY


# export class
window.LastScene = LastScene
