-----------------------------------------------------------------------------------------
--
-- main_menu.lua
-- Created by: Noah
-- Date: November 20th, 2019
-- Description: This is the main menu, displaying the credits, instructions, play buttons and mute button.
-----------------------------------------------------------------------------------------
display.setStatusBar(display.HiddenStatusBar)
-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "main_menu"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )


-----------------------------------------------------------------------------------------
-- GLOBAL VARIABLES
-----------------------------------------------------------------------------------------


soundOn = true



-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local background
local playButton
local creditsButton
local instructionsButton
local muteButton
local unMuteButton
local border
local coin
local coinText
local coinText2
local ball
local characterButton

-----------------------------------------------------------------------------------------
-- LOCAL SOUNDS
-----------------------------------------------------------------------------------------


-- audio variables
local transitionSound = audio.loadSound("Sounds/jump.mp3")
local transitionSoundChannel
local music5 = audio.loadStream("Sounds/mainMusic.mp3")
local musicChannel5-- = audio.play(music5, { loops = -1} )

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------


-- Creating Mute function to pause audio
local function Mute( touch )
    if (touch.phase == "ended") then
        audio.pause(musicChannel5)
        soundOn = false
        muteButton.isVisible = false
        unMuteButton.isVisible = true
    end
end


-- Creating Mute function to pause audio
local function UnMute( touch )
    if (touch.phase == "ended") then
        audio.resume(musicChannel5)
        soundOn = true
        muteButton.isVisible = true
        unMuteButton.isVisible = false
    end
end




-- Creating Transition to Level1 Screen
local function LevelSelectTransition( )
    composer.gotoScene( "character_select", {effect = "fade", time = 1000})
 
    if(soundOn == true)then
    transitionSoundChannel = audio.play(transitionSound)
    end
end    

-- Creating Transition to Instructions screen
local function InstructionsTransition( )
    composer.gotoScene( "instructions", {effect = "slideUp", time = 1000})
    if(soundOn == true)then
    transitionSoundChannel = audio.play(transitionSound)
    end
end    


--Creating Transition Function to Credits Page
local function CreditsTransition( )       
    composer.gotoScene( "credits_screen", {effect = "slideLeft", time = 500})
  
   if(soundOn == true)then
    transitionSoundChannel = audio.play(transitionSound)
    end
end 

local function CoinBlink3(  )
    coinText.isVisible = false
    
end

local function CoinBlink2(  )
    coinText.isVisible = true
    
    timer.performWithDelay(1000, CoinBlink3)

end

local function CoinBlink( event )
    --coinText.isVisible = false
    if( coinText.isVisible == false) then
        timer.performWithDelay(1000, CoinBlink2)
    end
end

local function BeganCoin( )
    coinText.isVisible = false
    Runtime:addEventListener("enterFrame", CoinBlink)
end

local function MoveBall( )
    ball.x = ball.x + 8
    ball.y = ball.y + 3
    ball.rotation = ball.rotation + 5
    if ( ball.x > 4000)then
        ball.x = -500
        ball.y = 100
    end
end

local function MoveBall3( event )
    Runtime:addEventListener("enterFrame", MoveBall)

end


local function MoveBall2( ... )
    timer.performWithDelay(1000, MoveBall3)

    --MoveBall2()
end

local function CoinNumber( ... )
    coinText2.text = coins
end

local function CharacterTransition( ... )
    composer.gotoScene( "character_select", {effect = "slideLeft", time = 500})
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------
   
-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -----------------------------------------------------------------------------------------

    -- Creating background and setting the image
   background = display.newImageRect("Images/FakeMainMenuNoah@2x.png", display.contentWidth, display.contentHeight)
   background.x = display.contentCenterX
   background.y = display.contentCenterY
  
  
    -- Associating display objects with this scene 
    sceneGroup:insert( background )

    muteButton = display.newImageRect("Images/MuteButtonPressedNoah@2x.png", 100, 100)
    muteButton.x = 100
    muteButton.y = 660
    muteButton.isVisible = true

    unMuteButton = display.newImageRect("Images/MuteButtonUnpressedNoah@2x.png", 100, 100)
    unMuteButton.x = 100
    unMuteButton.y = 660
    unMuteButton.isVisible = false

    sceneGroup:insert( muteButton )
    sceneGroup:insert( unMuteButton )


    coin = display.newImageRect("Images/CoinNoah@2x.png", 50, 50)
    coin.x = 890
    coin.y = 120
    
    sceneGroup:insert( coin )

    coinText = display.newText("COINS", 930, 40, nil, 50)
    coinText2 = display.newText("0", 940, 120, nil, 60)

    sceneGroup:insert( coinText )
    sceneGroup:insert( coinText2 )

    ball = display.newImageRect("Images/BallNoah@2x.png", 75, 75)
    ball.x = -500
    ball.y = 100

    sceneGroup:insert( ball )
    
    
   
    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   


    -- Creating Play Button
    playButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2 - 200,
            y = display.contentHeight - 105,
            width = 266.66,
            height = 133.33,            

            -- Insert the images here
            defaultFile = "Images/PlayButtonUnpressedDaniel@2x.png",
            overFile = "Images/PlayButtonPressedDaniel@2x.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = LevelSelectTransition          
        } )
    
    -----------------------------------------------------------------------------------------
    -- Creating Credits Button
    creditsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*7/8,
            y = display.contentHeight - 420,
            width = 200,
            height = 100,  
            -- Insert the images here
            defaultFile = "Images/CreditsButtonUnpressedNoah@2x.png",
            overFile = "Images/CreditsButtonPressedNoah@2x.png",


            -- When the button is released, call the Credits transition function
            onRelease = CreditsTransition
        } ) 
   
    
    -- ADD INSTRUCTIONS BUTTON WIDGET


    -- Creating instructions Button
    instructionsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*7/8,
            y = display.contentHeight - 300,
            width = 200,
            height = 100,  

            -- Insert the images here
            defaultFile = "Images/InstructionsButtonUnpressedNoah@2x.png",
            overFile = "Images/InstructionsButtonPressedNoah@2x.png",

            -- When the button is released, call the Instructions transition function
            onRelease = InstructionsTransition
        } ) 

     -- Creating character Button
    characterButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*7/8,
            y = display.contentHeight - 120,
            width = 200,
            height = 200,  

            -- Insert the images here
            defaultFile = "Images/CharacterButtonUnpressed@2x.png",
            overFile = "Images/SquareButtonPressedYourName@2x.png",

            -- When the button is released, call the Instructions transition function
            onRelease = CharacterTransition
        } ) 
   
    -----------------------------------------------------------------------------------------

    -- Associating button widgets with this scene
    sceneGroup:insert( playButton )
    sceneGroup:insert( creditsButton )
    sceneGroup:insert( instructionsButton )
    sceneGroup:insert( characterButton )


end -- function scene:create( event )   



-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    --plays background music loop
    
--audio.stop()
    -----------------------------------------------------------------------------------------

    local phase = event.phase
   
 -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then
       BeganCoin()
       MoveBall2()
       CoinNumber()
    -----------------------------------------------------------------------------------------
 --music5 = audio.loadStream("Sounds/mainMusic.mp3")
-- musicChannel5 = audio.play(music5, { loop = -1})
    -- Called when the scene is now on screen.
    -- Insert code here to make the scene come alive.
    -- Example: start timers, begin animation, play audio, etc.
    elseif ( phase == "did" ) then       
             
             
            musicChannel5 = audio.play(music5, { loop = -1})
        muteButton:addEventListener("touch", Mute)
        unMuteButton:addEventListener("touch", UnMute)
        if (soundOn == true)then 
            muteButton.isVisible = true
            unMuteButton.isVisible = false
        else
            audio.pause(musicChannel5)
            muteButton.isVisible = false
            unMuteButton.isVisible = true
        end

    end

end -- function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
    audio.stop( musicChannel5 )
   
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.

        -- removes mute button listeners
        Runtime:removeEventListener("enterFrame", CoinBlink)
        Runtime:removeEventListener("enterFrame", MoveBall)
        muteButton:removeEventListener("touch", Mute)
        unMuteButton:removeEventListener("touch", UnMute)
        
    end

end -- function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )



return scene

