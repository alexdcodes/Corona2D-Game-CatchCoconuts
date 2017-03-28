-----------------------------------------------------------------------------------------
-- main.lua
-- by Alex Diker and Art Work by Alice Kur
-----------------------------------------------------------------------------------------
display.setStatusBar( display.HiddenStatusBar )

--- Add Physics

local physics = require( "physics" )
    physics.start()

local sky = display.newImage( "bkg_clouds.png", display.contentWidth, display.contentHeight)
    sky.x = 160; sky.y = 195

local ground = display.newImage ("grass_long.png", display.contentWidth, display.contentHeight)
    ground.x = 160; ground.y = 520

local trees = display.newImage( "tree.png" )
    trees.x = 250; trees.y = 340;

physics.addBody( ground, "static", { density = 0.3, friction = 0.2, bounce = 0.2 } )

--- Create Player

local player = display.newImage( "player.png" )
    player.x = 160
    player.y = 400
    physics.addBody(player)

--- OnTouch Event for player

local function onTouch(event)
    if(event.phase == "began") then
        if(event.x < player.x) then
        --- jump left
        player:setLinearVelocity(-20, -200)
        else
        --- jump right
        player:setLinearVelocity(20, -200)
        end
    end
end

Runtime:addEventListener("touch", onTouch)

local coconut = display.newImageRect( "coconut.png", 30, 30)
    coconut.x = 85; coconut.y = 200; coconut.rotation = 12


physics.addBody (coconut, { friction = 0.1 , bounce=0.1, density=0.1} )


--- Add a score label

local score = 0
local scoreText = display.newText ("Score:", 20, 100, display.contentWidth, display.contentHeight * 0.5, native.systemFontBold, 18)
local scoreLabel = display.newText ( score, 100, 100, display.contentWidth, display.contentHeight * 0.5, native.systemFontBold, 18)

scoreLabel.x = display.viewableContentWidth
scoreLabel.y = display.viewableContentHeight - 400
scoreText.x = display.viewableContentWidth - 60
scoreText.y = display.viewableContentHeight - 400

scoreLabel:setTextColor( 0, 0, 0, 10)
scoreText:setTextColor( 0, 0, 0, 10)



--- add text

---local author = display.newText ( "Alex Diker & Alice Kur", 320, 100, display.contentWidth, display.contentHeight * 0.5, native.systemFontBold, 14 )
---    author:setFillColor( 0, 0, 0 )

--- Make Coconut Bounce

local function push()
    coconut:applyLinearImpulse(1, 3, coconut.x, coconut.y)
end

coconut:addEventListener("tap", push)
