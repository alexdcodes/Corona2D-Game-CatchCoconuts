local composer = require( "composer" )
local scene = composer.newScene()

---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------

local image, text1, text2, text3, memTimer

---------------------------------------------------------------------------------

-- "scene:create()"
function scene:create( event )
    local sceneGroup = self.view

    image = display.newImage( "bkg.jpg" )
    image.x = display.contentCenterX
    image.y = display.contentCenterY

    sceneGroup:insert( image )

    image.touch = onSceneTouch

    text1 = display.newText( "Scene 1", 0, 0, native.systemFontBold, 24 )
    text1:setFillColor( 255 )
    text1.x, text1.y = display.contentWidth * 0.5, 50
    sceneGroup:insert( text1 )

    text2 = display.newText( "MemUsage: ", 0, 0, native.systemFont, 16 )
    text2:setFillColor( 255 )
    text2.x, text2.y = display.contentWidth * 0.5, display.contentHeight * 0.5
    sceneGroup:insert( text2 )

    text3 = display.newText( "Touch to continue.", 0, 0, native.systemFontBold, 18 )
    text3:setFillColor( 255 ); text3.isVisible = false
    text3.x, text3.y = display.contentWidth * 0.5, display.contentHeight - 100
    sceneGroup:insert( text3 )

    print( "\n1: create event")
end

-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
    end
end

-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end
end

-- "scene:destroy()"
function scene:destroy( event )
    print( "((destroying scene 1's view))" )
end
---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene