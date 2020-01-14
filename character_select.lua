----------------------------------------------------------------------------------------
--
--  level_select.lua
-- Created by: Noah
-- Date: December 11th, 2019
-- Description: This is the level select screen, displaying the level & back buttons.
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
sceneName = "character_select"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )


-----------------------------------------------------------------------------------------
-- Global VARIABLES
-----------------------------------------------------------------------------------------

characterf = 1



-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
local background
local backButton
local character1Button
local character2Button
local character3Button
local character4Button
local lock
local lock2
local lock3
local fakeCharacter
local fakeDino
local fakeShark
local fakePurple
local coin1
local coin2
local coin3
local coin5
local coinBox
local coinText2
local fakepowerUp
local powerUpButton
local informationText
local powerUpsText
local powerUpBox
local informationCirle


-----------------------------------------------------------------------------------------
-- LOCAL SOUNDS
-----------------------------------------------------------------------------------------

local transitionSound = audio.loadStream("Sounds/jump.mp3")
local transitionSoundChannel
local music = audio.loadStream("Sounds/creditsMusic.mp3")
local musicChannel

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
local function CoinNumber( ... )
    coinText2.text = coins
end

-- Creating Transition to Main Menu Screen
local function MainMenuTransition( )
    composer.gotoScene( "main_menu", {effect = "slideDown", time = 1000})
    
if(soundOn == true)then
    transitionSoundChannel = audio.play(transitionSound)
   end
end    


local function Character1( )
    characterf = 1
    composer.gotoScene( "level_select", {effect = "slideDown", time = 1000})
end

local function Character2( )
    characterf = 2
    composer.gotoScene( "level_select", {effect = "slideDown", time = 1000})
end

local function Character3( )
    characterf = 3
    composer.gotoScene( "level_select", {effect = "slideDown", time = 1000})
end

local function Character4( )
    characterf = 4
    composer.gotoScene( "level_select", {effect = "slideDown", time = 1000})
end
-- fades in the buttons
local function ButtonFade( event )
    backButton.alpha = backButton.alpha + 0.006


end

local function Lock( ... )
    if (coins > 2)then
        lock.isVisible = false
        character2Button.isVisible = true
        fakeDino.isVisible = false
        coin1.isVisible = false
    end
    if (coins > 5)then
         lock2.isVisible = false
        character3Button.isVisible = true
        fakeShark.isVisible = false
            coin2.isVisible = false
    end
    if (coins > 8)then
         lock3.isVisible = false
        character4Button.isVisible = true
        fakePurple.isVisible = false
            coin3.isVisible = false
    end
end

local function PowerUp( )
    if (coins > 2) then
        coins = coins - 3
        CoinNumber()
        power = power + 1
        composer.gotoScene( "level_select", {effect = "slideDown", time = 1000})
    end
end
----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -----------------------------------------------------------------------------------------
  -- creating the background
    background = display.newImageRect("Images/CharacterScreenNoah@2x.png", display.contentWidth, display.contentHeight)
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    

    sceneGroup:insert( background )


   fakeDino = display.newImageRect("Images/DinoCharacter.png", 100, 166.666667)
    fakeDino.x = display.contentWidth/2
    fakeDino.y = display.contentHeight - 440

sceneGroup:insert( fakeDino )

   fakeShark = display.newImageRect("Images/SharkCharacterNoah.png", 100, 166.666667)
    fakeShark.x = display.contentWidth/2 + 267
    fakeShark.y = display.contentHeight - 440

sceneGroup:insert( fakeShark )

  fakePurple = display.newImageRect("Images/PurpleCharacterNoah.png", 100, 166.666667)
    fakePurple.x = display.contentWidth/2 - 267
    fakePurple.y = display.contentHeight - 200

sceneGroup:insert( fakePurple )

    lock = display.newImageRect("Images/Lock.png", 150, 150)
    lock.x = display.contentWidth/2
    lock.y = display.contentHeight - 440

    lock2 = display.newImageRect("Images/Lock.png", 150, 150)
    lock2.x = display.contentWidth/2 + 267
    lock2.y = display.contentHeight - 440

    lock3 = display.newImageRect("Images/Lock.png", 150, 150)
    lock3.x = display.contentWidth/2 - 267
    lock3.y = display.contentHeight - 200
   

    sceneGroup:insert( lock )
    sceneGroup:insert( lock2 )
    sceneGroup:insert( lock3 )

coin1 = display.newText("3 COINS", 480, 425, nil, 30)
coin1.x = display.contentWidth/2
coin1.y = 425

coin2 = display.newText("6 COINS", 480, 425, nil, 30)
coin2.x = display.contentWidth/2 + 267
coin2.y = 425

coin3 = display.newText("9 COINS", 480, 425, nil, 30)
coin3.x = display.contentWidth/2 - 267
coin3.y = 665
    

     sceneGroup:insert( coin1 )
    sceneGroup:insert( coin2 )
    sceneGroup:insert( coin3 )


    coinBox = display.newRect(display.contentWidth/2 - 311,170,140,66.666)
    coinBox:setFillColor(0/255, 0/255, 0/255)
    coinBox.strokeWidth = 10
    coinBox:setStrokeColor(255/255, 255/255, 255/255)
      
sceneGroup:insert( coinBox )

      coin5 = display.newImageRect("Images/CoinNoah@2x.png", 50, 50)
    coin5.x = display.contentWidth/2 - 346
    coin5.y = 170
    
    sceneGroup:insert( coin5 )

   
    coinText2 = display.newText("0", display.contentWidth/2 - 276, 170, nil, 60)

    
    sceneGroup:insert( coinText2 )


    powerUpBox = display.newRect(display.contentWidth/2 + 138,display.contentHeight - 195,430,230)
    powerUpBox:setFillColor(0/255, 0/255, 0/255)
    powerUpBox.strokeWidth = 10
    powerUpBox:setStrokeColor(255/255, 255/255, 255/255)
sceneGroup:insert( powerUpBox )
    
   
    powerUpsText = display.newText("POWER UPS", 480, 425, nil, 50)
    powerUpsText.x = display.contentWidth/2 + 134.5
    powerUpsText.y = 490
    sceneGroup:insert( powerUpsText )



fakepowerUp = display.newImageRect("Images/PowerUp1.png", 100, 100)
    fakepowerUp.x = display.contentWidth/2
    fakepowerUp.y = display.contentHeight - 200


    fakepowerUpText = display.newText("3 Coins EACH", 480, 425, nil, 20)
    fakepowerUpText.x = display.contentWidth/2
    fakepowerUpText.y = 665

    sceneGroup:insert( fakepowerUp )
    sceneGroup:insert( fakepowerUpText )


    

    informationCirle = display.newCircle(display.contentWidth/2 + 134, 570, 30)

    informationText = display.newText("info", display.contentWidth/2 + 134, 570 , nil, 30)
    informationText:setFillColor(0/255, 0/255, 255/255)


 sceneGroup:insert( informationCirle )
    sceneGroup:insert( informationText )
   

    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    -- Creating Back Button
    backButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2 - 311,
            y = 730,
            width = 150,
            height = 75,
          

            

            -- Insert the images here
            defaultFile = "Images/BackButtonUnpressedNoah@2x.png",
            overFile = "Images/BackButtonPressedNoah@2x.png",

            -- When the button is released, call the main menu screen transition function
            onRelease = MainMenuTransition          
        } )
       
        backButton.alpha = 0
 -- Creating Back Button
    character1Button = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2 - 267,
            y = display.contentHeight - 440,
            width = 100,
            height = 166.666667,
          

            

            -- Insert the images here
            defaultFile = "Images/character.png",
            overFile = "Images/characterRolling.png",

            -- When the button is released, call the main menu screen transition function
            onRelease = Character1         
        } )
     


 -- Creating Back Button
    character2Button = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2,
            y = display.contentHeight - 440,
            width = 100,
            height = 166.666667,
          

            

            -- Insert the images here
            defaultFile = "Images/DinoCharacter.png",
            overFile = "Images/DinoCharacterJumping.png",

            -- When the button is released, call the main menu screen transition function
            onRelease = Character2         
        } )
       character2Button.isVisible = false

-- Creating Back Button
    character3Button = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2 + 267,
            y = display.contentHeight - 440,
            width = 100,
            height = 166.666667,
          

            

            -- Insert the images here
            defaultFile = "Images/SharkCharacterNoah.png",
            overFile = "Images/SharkCharacterJumpingNoah.png",

            -- When the button is released, call the main menu screen transition function
            onRelease = Character3         
        } )
    character3Button.isVisible = false
        --character3Button.isVisible = false
        

        character4Button = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2 - 267,
            y = display.contentHeight - 200,
            width = 100,
            height = 166.666667,
          

            

            -- Insert the images here
            defaultFile = "Images/PurpleCharacterNoah.png",
            overFile = "Images/PurpleCharacterJumpingNoah.png",

            -- When the button is released, call the main menu screen transition function
            onRelease = Character4         
        } )
    character4Button.isVisible = false
        --character3Button.isVisible = false
       

        powerUpButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2,
            y = display.contentHeight - 200,
            width = 100,
            height = 100,
          

            

            -- Insert the images here
            defaultFile = "Images/PowerUp1.png",
            overFile = "Images/PowerUp1.png",

            -- When the button is released, call the main menu screen transition function
            onRelease = PowerUp        
        } )
    -----------------------------------------------------------------------------------------
    
    -----------------------------------------------------------------------------------------
    sceneGroup:insert( character2Button )
      sceneGroup:insert( character1Button )
      sceneGroup:insert( character3Button )
      sceneGroup:insert( character4Button )
        sceneGroup:insert( backButton )
        sceneGroup:insert( powerUpButton )
    

    

end  



-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
   

    -----------------------------------------------------------------------------------------

    local phase = event.phase
    physics.start()
    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then
      Lock()
CoinNumber()
       if (soundOn == true) then
            audio.play(musicChannel)

       
                       
        end
    -----------------------------------------------------------------------------------------
 Runtime:addEventListener("enterFrame", ButtonFade)
    -- Called when the scene is now on screen.
    -- Insert code here to make the scene come alive.
    -- Example: start timers, begin animation, play audio, etc.
    elseif ( phase == "did" ) then 
       
        
       

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
        Runtime:removeEventListener( "enterFrame")
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    
        audio.pause(musicChannel)
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