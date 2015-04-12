--Attack of the killer cubes

local composer = require( "composer" )
local scene = composer.newScene()

local widget = require( "widget" )
local json = require( "json" )
local utility = require( "utility" )
local physics = require( "physics" )
local myData = require( "mydata" )

local function handleWin( event )
    if event.phase == "ended" then
        composer.removeScene("nextlevel")
        composer.gotoScene("nextlevel", { time= 500, effect = "crossFade" })
    end
    return true
end

local function handleLoss( event )
    if event.phase == "ended" then
        composer.removeScene("gameover")
        composer.gotoScene("gameover", { time= 500, effect = "crossFade" })
    end
    return true
end

function scene:create( event )
    local sceneGroup = self.view

    params = event.params

    physics.start()
    physics.pause()

    local thisLevel = myData.settings.currentLevel
    
    local background = display.newRect(0,0, display.contentWidth, display.contentHeight)
    background.anchorX = 0
    background.anchorY = 0
    background:setFillColor( 0.6, 0.7, 0.3 )
    sceneGroup:insert(background)

    local levelText = display.newText(myData.settings.currentLevel, 0, 0, native.systemFontBold, 48 )
    levelText:setFillColor( 0 )
    levelText.x = display.contentCenterX
    levelText.y = display.contentCenterY
    sceneGroup:insert( levelText )

    --
    -- create your objects here
    --
    local iWin = widget.newButton({
        label = "I Win!",
        onEvent = handleWin
    })
    sceneGroup:insert(iWin)
    iWin.x = display.contentCenterX - 100
    iWin.y = display.contentHeight - 60

    local iLoose = widget.newButton({
        label = "I Loose!",
        onEvent = handleLoss
    })
    sceneGroup:insert(iLoose)
    iLoose.x = display.contentCenterX + 100
    iLoose.y = display.contentHeight - 60

end

function scene:show( event )
    local sceneGroup = self.view

    params = event.params

    if event.phase == "did" then
        physics.start()
    end
end

function scene:hide( event )
    local sceneGroup = self.view
    
    if event.phase == "will" then
        --
        -- Remove enterFrame listeners here
        --
        physics.stop()
    end

end

function scene:destroy( event )
    local sceneGroup = self.view
    
end

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
return scene
