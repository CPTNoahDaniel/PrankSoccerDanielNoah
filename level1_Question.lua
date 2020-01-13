----------------------------------------------------------------------------------------
--
-- level2_question.lua
-- Created by: Noah
-- Date: December 11th, 2019
-- Description: This is the level 1 question 
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )
local physics = require( "physics")


-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level1_Question"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )




-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local questionText
local answerText1 
local wrongText1
local wrongText2
local wrongText3
local numCorrect = 0
local numIncorrect = 0
local realAnswerText


local answerPosition = 1
local trueOrFalsePosition = 0
local bkg
local cover
local X1 = display.contentWidth*2/7 + 50
local X2 = display.contentWidth*4/7 + 50
local Y1 = display.contentHeight*1/2 + 50
local Y2 = display.contentHeight*5.5/7 + 50


local userAnswer
local textTouched = false
local answerBox
local answerBox2
local answerBox3
local answerBox4
local questionBox
local firstNumber
local question2Image
local questionImage
local questionmarkText


local selectSound = audio.loadStream("Sounds/cheer.mp3")
local selecSoundChannel




 
-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
local function DisplayCorrectAnswer( )
    realAnswerText.isVisible = true
    realAnswerText.text = "The real answer is" .. answerText1.text
end

local function DisplayQuestion2()
    --creating random numbers
    firstNumber = math.random (1,20)
 question2Image.isVisible = false  
answerBox2.isVisible = true
answerBox4.isVisible = true
answerBox.isVisible = true
answerBox3.isVisible = true
if (firstNumber == 1) then

   
    --creating the question depending on the selcetion number
    questionText.text = " What is photosnythesis? " 
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Plants making food "
    
    --creating wrong answers
    wrongText1.text = " Plants making water "
    wrongText2.text = " A fancy word "
    wrongText3.text = " Animals eating plants "
elseif (firstNumber == 2)then
     
    question2Image.isVisible = true
     --creating the question depending on the selcetion number
    questionText.text = " What is this? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Stem "
    
    --creating wrong answers
    wrongText1.text = " Root "
    wrongText2.text = " Leaf "
    wrongText3.text = " Seed "
elseif (firstNumber == 3)then
     --creating the question depending on the selcetion number
    questionText.text = " Which is a desert plant? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " A cactus "
    
    --creating wrong answers
    wrongText1.text = " A palm tree "
    wrongText2.text = " A rose "
    wrongText3.text = " Maple tree "

elseif (firstNumber == 4)then
     --creating the question depending on the selcetion number
    questionText.text = " How many moons does earth have? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " 1 "
    
    --creating wrong answers
    wrongText1.text = " 5 "
    wrongText2.text = " 79 "
    wrongText3.text = " 3 "

elseif (firstNumber == 5)then
      --creating the question depending on the selcetion number
    questionText.text = " How many moons does earth have? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " 1 "
    
    --creating wrong answers
    wrongText1.text = " 5 "
    wrongText2.text = " 79 "
    wrongText3.text = " 3 "

elseif (firstNumber == 6)then
     --creating the question depending on the selcetion number
    questionText.text = " What is the main colour of plants? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Green "
    
    --creating wrong answers
    wrongText1.text = " Blue "
    wrongText2.text = " Purple "
    wrongText3.text = " Yellow "

elseif (firstNumber == 7)then
     --creating the question depending on the selcetion number
    questionText.text = " What is the main colour of plants? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Green "
    
    --creating wrong answers
    wrongText1.text = " Blue "
    wrongText2.text = " Purple "
    wrongText3.text = " Yellow "

elseif (firstNumber == 8)then
   --creating the question depending on the selcetion number
    questionText.text = " Which animals collect pollen? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Pollenators "
    
    --creating wrong answers
    wrongText1.text = " The pollen boys "
    wrongText2.text = " Reptiles "
    wrongText3.text = " Humans "

elseif (firstNumber == 9)then
     --creating the question depending on the selcetion number
    questionText.text = " Which animals collect pollen? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Pollenators "
    
    --creating wrong answers
    wrongText1.text = " The pollen boys "
    wrongText2.text = " Reptiles "
    wrongText3.text = " Humans "

elseif (firstNumber == 10)then
     --creating the question depending on the selcetion number
    questionText.text = " What colour is the moon? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Grey "
    
    --creating wrong answers
    wrongText1.text = " White "
    wrongText2.text = " Yellow "
    wrongText3.text = " Black "

elseif (firstNumber == 11)then
     --creating the question depending on the selcetion number
    questionText.text = " What do leaves do? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Make food for the plant "
    
    --creating wrong answers
    wrongText1.text = " Look cool "
    wrongText2.text = " Protect the plant "
    wrongText3.text = " Nothing "

elseif (firstNumber == 12)then
     --creating the question depending on the selcetion number
    questionText.text = " What can water turn into? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Snow "
    
    --creating wrong answers
    wrongText1.text = " Food "
    wrongText2.text = " Sand "
    wrongText3.text = " Plastic "

elseif (firstNumber == 13)then
     --creating the question depending on the selcetion number
    questionText.text = " What part of the plant makes food? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " The leaves "
    
    --creating wrong answers
    wrongText1.text = " The stem "
    wrongText2.text = " The flowers "
    wrongText3.text = " Nothing "

elseif (firstNumber == 14)then
      --creating the question depending on the selcetion number
    questionText.text = " What part of the plant makes food? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " The leaves "
    
    --creating wrong answers
    wrongText1.text = " The stem "
    wrongText2.text = " The flowers "
    wrongText3.text = " Nothing "

elseif (firstNumber == 15)then
     --creating the question depending on the selcetion number
    questionText.text = " What happens to trees in the winter? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " The leaves fall "
    
    --creating wrong answers
    wrongText1.text = " They die "
    wrongText2.text = " They stay the same "
    wrongText3.text = " The leaves turn blue "

elseif (firstNumber == 16)then
    --creating the question depending on the selcetion number
    questionText.text = " What happens to trees in the winter? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " The leaves fall "
    
    --creating wrong answers
    wrongText1.text = " They die "
    wrongText2.text = " They stay the same "
    wrongText3.text = " The leaves turn blue "

elseif (firstNumber == 17)then
     --creating the question depending on the selcetion number
    questionText.text = " What happens when a volcanoe errupts? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Lava flows out of it "
    
    --creating wrong answers
    wrongText1.text = " Everything freezes "
    wrongText2.text = " Nothing "
    wrongText3.text = " The world explodes "

elseif (firstNumber == 18)then
      --creating the question depending on the selcetion number
    questionText.text = " What do leaves do? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Make food for the plant "
    
    --creating wrong answers
    wrongText1.text = " Look cool "
    wrongText2.text = " Protect the plant "
    wrongText3.text = " Nothing "

elseif (firstNumber == 19)then
     --creating the question depending on the selcetion number
    questionText.text = " What happens when a volcanoe errupts? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Lava flows out of it "
    
    --creating wrong answers
    wrongText1.text = " Everything freezes "
    wrongText2.text = " Nothing "
    wrongText3.text = " The world explodes "

elseif (firstNumber == 20)then
     --creating the question depending on the selcetion number
    questionText.text = " Which animals collect pollen? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Polenators "
    
    --creating wrong answers
    wrongText1.text = " The pollen boys "
    wrongText2.text = " Reptiles "
    wrongText3.text = " Humans "

end

end

local function PositionAnswers3()

    --creating random start position in a cretain area
    answerPosition = math.random(1,3)

    if (answerPosition == 1) then

        answerText1.x = X1
        answerText1.y = Y1
        
        wrongText1.x = X2
        wrongText1.y = Y1
        
        wrongText2.x = X1
        wrongText2.y = Y2

        wrongText3.x = X2
        wrongText3.y = Y2

        
    elseif (answerPosition == 2) then

        answerText1.x = X1
        answerText1.y = Y2
            
        wrongText1.x = X1
        wrongText1.y = Y1
            
        wrongText2.x = X2
        wrongText2.y = Y1

        wrongText3.x = X2
        wrongText3.y = Y2


    elseif (answerPosition == 3) then

        answerText1.x = X2
        answerText1.y = Y1
            
        wrongText1.x = X1
        wrongText1.y = Y2
            
        wrongText2.x = X1
        wrongText2.y = Y1

        wrongText3.x = X2
        wrongText3.y = Y2
            
    end
answerBox.isVisible = true
answerBox3.isVisible = true

end

local function Calculate2( )
    if (numCorrect == 2)then
         realAnswerText.isVisible = false
        composer.hideOverlay( "level2_Question", { isModal = true, effect = "fade", time = 500})      
        ResumeGameLevel1()
        
        numCorrect = 0
        numIncorrect = 0

    elseif (numIncorrect == 2)then
        realAnswerText.isVisible = false
        composer.hideOverlay( "level2_Question", { isModal = true, effect = "fade", time = 500})
        ResumeGame2Level1()

        numCorrect = 0
        numIncorrect = 0
    else  
         realAnswerText.isVisible = false
 DisplayQuestion2()
        PositionAnswers3()
       

        
    end 
end

local function Question2( )
  
    question2Image.isVisible = true

end

local function TrueOrFalse( )
    trueOrFalsePosition = math.random(1,2)
end
--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerAnswer(touch)
    userAnswer = answerText1.text
    if(soundOn == true) then
    selecSoundChannel = audio.play(selectSound)
    end
    if (touch.phase == "ended") then
       
        numCorrect = numCorrect + 1
        -- DisplayCorrectAnswer()
       Calculate2()
    
    end 
end

local function DisplayQuestion()
    --creating random numbers
    firstNumber = math.random (1,20)
   answerBox.isVisible = true
answerBox3.isVisible = true

if (firstNumber == 1) then

   
    --creating the question depending on the selcetion number
    questionText.text = " What is photosnythesis? " 
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Plants making food "
    
    --creating wrong answers
    wrongText1.text = " Plants making water "
    wrongText2.text = " A fancy word "
    wrongText3.text = " Animals eating plants "
elseif (firstNumber == 2)then
     
    Question2()
     --creating the question depending on the selcetion number
    questionText.text = " What is this? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Stem "
    
    --creating wrong answers
    wrongText1.text = " Root "
    wrongText2.text = " Leaf "
    wrongText3.text = " Seed "
elseif (firstNumber == 3)then
     --creating the question depending on the selcetion number
    questionText.text = " Which is a desert plant? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " A cactus "
    
    --creating wrong answers
    wrongText1.text = " A palm tree "
    wrongText2.text = " A rose "
    wrongText3.text = " Maple tree "

elseif (firstNumber == 4)then
     --creating the question depending on the selcetion number
    questionText.text = " How many moons does earth have? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " 1 "
    
    --creating wrong answers
    wrongText1.text = " 5 "
    wrongText2.text = " 79 "
    wrongText3.text = " 3 "

elseif (firstNumber == 5)then
     --creating the question depending on the selcetion number
    questionText.text = " Have humans been to the moon? " 

    TrueOrFalse()
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Yes "
    
    --creating wrong answers
    wrongText1.text = " No "
    wrongText2.text = "  "
    wrongText3.text = "  "

elseif (firstNumber == 6)then
    --creating the question depending on the selcetion number
    questionText.text = " Can plants grow without water? " 

    TrueOrFalse()
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " No "
    
    --creating wrong answers
    wrongText1.text = " Yes "
    wrongText2.text = "  "
    wrongText3.text = "  "

elseif (firstNumber == 7)then
     --creating the question depending on the selcetion number
    questionText.text = " What is the main colour of plants? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Green "
    
    --creating wrong answers
    wrongText1.text = " Blue "
    wrongText2.text = " Purple "
    wrongText3.text = " Yellow "

elseif (firstNumber == 8)then
  --creating the question depending on the selcetion number
    questionText.text = " Can plants live a long time? " 

    TrueOrFalse()
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Yes "
    
    --creating wrong answers
    wrongText1.text = " No "
    wrongText2.text = "  "
    wrongText3.text = "  "

elseif (firstNumber == 9)then
     --creating the question depending on the selcetion number
    questionText.text = " Which animals collect pollen? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Pollenators "
    
    --creating wrong answers
    wrongText1.text = " The pollen boys "
    wrongText2.text = " Reptiles "
    wrongText3.text = " Humans "

elseif (firstNumber == 10)then
     --creating the question depending on the selcetion number
    questionText.text = " What colour is the moon? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Grey "
    
    --creating wrong answers
    wrongText1.text = " White "
    wrongText2.text = " Yellow "
    wrongText3.text = " Black "

elseif (firstNumber == 11)then
     --creating the question depending on the selcetion number
    questionText.text = " What do leaves do? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Make food for the plant "
    
    --creating wrong answers
    wrongText1.text = " Look cool "
    wrongText2.text = " Protect the plant "
    wrongText3.text = " Nothing "

elseif (firstNumber == 12)then
     --creating the question depending on the selcetion number
    questionText.text = " What can water turn into? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Snow "
    
    --creating wrong answers
    wrongText1.text = " Food "
    wrongText2.text = " Sand "
    wrongText3.text = " Plastic "

elseif (firstNumber == 13)then
     --creating the question depending on the selcetion number
    questionText.text = " What part of the plant makes food? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " The leaves "
    
    --creating wrong answers
    wrongText1.text = " The stem "
    wrongText2.text = " The flowers "
    wrongText3.text = " Nothing "

elseif (firstNumber == 14)then
     --creating the question depending on the selcetion number
    questionText.text = " Is water a solid? " 

    TrueOrFalse()
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " No "
    
    --creating wrong answers
    wrongText1.text = " Yes "
    wrongText2.text = "  "
    wrongText3.text = "  "

elseif (firstNumber == 15)then
     --creating the question depending on the selcetion number
    questionText.text = " What happens to trees in the winter? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " The leaves fall "
    
    --creating wrong answers
    wrongText1.text = " They die "
    wrongText2.text = " They stay the same "
    wrongText3.text = " The leaves turn blue "

elseif (firstNumber == 16)then
    --creating the question depending on the selcetion number
    questionText.text = " Do plants need soil? " 

    TrueOrFalse()
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Yes "
    
    --creating wrong answers
    wrongText1.text = " No "
    wrongText2.text = "  "
    wrongText3.text = "  "

elseif (firstNumber == 17)then
    --creating the question depending on the selcetion number
    questionText.text = " Is the moon hot? " 

    TrueOrFalse()
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " No "
    
    --creating wrong answers
    wrongText1.text = " Yes "
    wrongText2.text = "  "
    wrongText3.text = "  "


elseif (firstNumber == 18)then
     --creating the question depending on the selcetion number
    questionText.text = " Can you see the moon in the day? " 

    TrueOrFalse()
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Sometimes "
    
    --creating wrong answers
    wrongText1.text = " No "
    wrongText2.text = "  "
    wrongText3.text = "  "

elseif (firstNumber == 19)then
     --creating the question depending on the selcetion number
    questionText.text = " What happens when a volcanoe errupts? " 

    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Lava flows out of it "
    
    --creating wrong answers
    wrongText1.text = " Everything freezes "
    wrongText2.text = " Nothing "
    wrongText3.text = " The world explodes "

elseif (firstNumber == 20)then
     --creating the question depending on the selcetion number
    questionText.text = " Is math connected to science? " 

    TrueOrFalse()
    --creating answer text from list it corispondes with the animals list
    answerText1.text = " Yes "
    
    --creating wrong answers
    wrongText1.text = " No "
    wrongText2.text = "  "
    wrongText3.text = "  "

end

end

local function PositionAnswers2(  )
 if (trueOrFalsePosition == 1)then
        answerText1.x = X1
        answerText1.y = Y1
        wrongText1.x = X2
        wrongText1.y = Y1
 else
         answerText1.x = X2
        answerText1.y = Y1
        wrongText1.x = X1
        wrongText1.y = Y1

 end   

 answerBox.isVisible = false
 answerBox3.isVisible = false
end

local function PositionAnswers()

    --creating random start position in a cretain area
    answerPosition = math.random(1,3)

    if (answerPosition == 1) then

        answerText1.x = X1
        answerText1.y = Y1
        
        wrongText1.x = X2
        wrongText1.y = Y1
        
        wrongText2.x = X1
        wrongText2.y = Y2

        wrongText3.x = X2
        wrongText3.y = Y2

        
    elseif (answerPosition == 2) then

        answerText1.x = X1
        answerText1.y = Y2
            
        wrongText1.x = X1
        wrongText1.y = Y1
            
        wrongText2.x = X2
        wrongText2.y = Y1

        wrongText3.x = X2
        wrongText3.y = Y2


    elseif (answerPosition == 3) then

        answerText1.x = X2
        answerText1.y = Y1
            
        wrongText1.x = X1
        wrongText1.y = Y2
            
        wrongText2.x = X1
        wrongText2.y = Y1

        wrongText3.x = X2
        wrongText3.y = Y2
            
    end
answerBox.isVisible = true
answerBox3.isVisible = true

end


local function Calculate( )
    if (numCorrect == 2)then
         realAnswerText.isVisible = false
        composer.hideOverlay( "level2_Question", { isModal = true, effect = "fade", time = 500})      
        ResumeGameLevel1()
        --questionImage.isVisible = false
        numCorrect = 0
        numIncorrect = 0

    elseif (numIncorrect == 2)then
        realAnswerText.isVisible = false
        composer.hideOverlay( "level2_Question", { isModal = true, effect = "fade", time = 500})
        ResumeGame2Level1()

        numCorrect = 0
        numIncorrect = 0
    else   
        realAnswerText.isVisible = false
 DisplayQuestion2()
        PositionAnswers3()
        if( trueOrFalsePosition == 1)or
            ( trueOrFalsePosition == 2)then
                PositionAnswers()
            end

        
    end
end
-----------------------------------------------------------------------------------------



--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer(touch)
    userAnswer = wrongText1.text
    if(soundOn == true) then
    selecSoundChannel = audio.play(selectSound)
    end
    if (touch.phase == "ended") then
    
        numIncorrect = numIncorrect + 1
        DisplayCorrectAnswer()
        timer.performWithDelay(2000, Calculate)
        
        
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer2(touch)
    userAnswer = wrongText2.text
    if(soundOn == true) then
    selecSoundChannel = audio.play(selectSound)
    end
    if (touch.phase == "ended") then

        numIncorrect = numIncorrect + 1
        DisplayCorrectAnswer()
        timer.performWithDelay(2000, Calculate)
        
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer3(touch)
    userAnswer = wrongText3.text
     if(soundOn == true) then
    selecSoundChannel = audio.play(selectSound)
    end
    
    if (touch.phase == "ended") then
        numIncorrect = numIncorrect + 1
        DisplayCorrectAnswer()
         timer.performWithDelay(2000, Calculate)
        
    end 
end
--adding the event listeners 
local function AddTextListeners()
    answerText1:addEventListener( "touch", TouchListenerAnswer )
    wrongText1:addEventListener( "touch", TouchListenerWrongAnswer)
    wrongText2:addEventListener( "touch", TouchListenerWrongAnswer2)
    wrongText3:addEventListener( "touch", TouchListenerWrongAnswer3)
end

--removing the event listeners
local function RemoveTextListeners()
    answerText1:removeEventListener( "touch", TouchListenerAnswer)
    wrongText1:removeEventListener( "touch", TouchListenerWrongAnswer)
    wrongText2:removeEventListener( "touch", TouchListenerWrongAnswer2)
    wrongText3:removeEventListener( "touch", TouchListenerWrongAnswer3)
end


-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view  

    -----------------------------------------------------------------------------------------
    --covering the other scene with a rectangle so it looks faded and stops touch from going through
    bkg = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    --setting to a semi black colour
    bkg:setFillColor(0,0,0,0.5)

    -----------------------------------------------------------------------------------------
    --making a cover rectangle to have the background fully bolcked where the question is
    cover = display.newRoundedRect(display.contentCenterX, display.contentCenterY, display.contentWidth + 0.95, display.contentHeight*0.95, 50 )
    cover:setFillColor(255/255, 255/255, 255/255)
    cover.strokeWidth = 9
    cover:setStrokeColor( 255/255, 0/255, 0/255)
    
    sceneGroup:insert(bkg)
    sceneGroup:insert(cover)


    questionImage = display.newRect(display.contentWidth/2 - 380, display.contentHeight/2 + 50, 200, 500)
    questionImage.strokeWidth = 20
    questionImage:setFillColor(0/255, 255/255, 0/255)
    questionImage:setStrokeColor(255/255, 255/255, 51/255)

    questionmarkText = display.newText("?", 135, 450, nil, 400)
    questionmarkText:setFillColor(0/255, 0/255, 0/255)

    sceneGroup:insert(questionImage)
    sceneGroup:insert(questionmarkText)


    question2Image = display.newImageRect("Images/WhatIsRoot.png", 200, 500)
    question2Image.x = display.contentWidth/2 - 380
    question2Image.y = display.contentHeight/2 + 50
    question2Image.strokeWidth = 9
    question2Image:setStrokeColor(255/255, 255/255, 51/255)
    question2Image.isVisible = false

    
    


    answerBox = display.newRect(display.contentCenterX - 70, 650, 300, 60)
    answerBox.strokeWidth = 9
    answerBox:setStrokeColor(255/255, 255/255, 51/255)
     answerBox:setFillColor(0, 1, 0)

    answerBox2 = display.newRect(display.contentCenterX - 70, 430, 300, 60)
    answerBox2.strokeWidth = 9
    answerBox2:setStrokeColor(255/255, 255/255, 51/255)
     answerBox2:setFillColor(0, 1, 0)

    answerBox3 = display.newRect(display.contentCenterX + 250, 650, 280, 60)
    answerBox3.strokeWidth = 9
    answerBox3:setStrokeColor(255/255, 255/255, 51/255)
     answerBox3:setFillColor(0, 1, 0)

    answerBox4 = display.newRect(display.contentCenterX + 250, 430, 280, 60)
    answerBox4.strokeWidth = 9
    answerBox4:setStrokeColor(255/255, 255/255, 51/255)
     answerBox4:setFillColor(0, 1, 0)
    sceneGroup:insert(answerBox)
    sceneGroup:insert(answerBox2)
    sceneGroup:insert(answerBox3)
    sceneGroup:insert(answerBox4)
    sceneGroup:insert(question2Image)
  

    
    questionText = display.newText("", display.contentCenterX, display.contentCenterY*3/8, Arial, 55)
    questionText:setFillColor(0/255, 0/255, 0/255)

    answerText1 = display.newText("", X1, Y2, Arial, 25)
    answerText1.anchorX = 0
    answerText1:setFillColor(0/255, 0/255, 0/255)

    wrongText1 = display.newText("", X2, Y2, Arial, 25)
    wrongText1.anchorX = 0
    wrongText1:setFillColor(0/255, 0/255, 0/255)

    wrongText2 = display.newText("", X1, Y1, Arial, 25)
    wrongText2:setFillColor(0/255, 0/255, 0/255)
    wrongText2.anchorX = 0

    wrongText3 = display.newText("", X2, Y1, Arial, 25)
    wrongText3.anchorX = 0
    wrongText3:setFillColor(0/255, 0/255, 0/255)

    realAnswerText = display.newText("", display.contentWidth/2, 250, Arial, 25)
    --wrongText3.anchorX = 0
    realAnswerText:setFillColor(0/255, 0/255, 0/255)



    -----------------------------------------------------------------------------------------

    -- insert all objects for this scene into the scene group
    
    sceneGroup:insert(questionText)
    sceneGroup:insert(answerText1)
    sceneGroup:insert(wrongText1)
    sceneGroup:insert(wrongText2)
    sceneGroup:insert(wrongText3)
    sceneGroup:insert(realAnswerText)
  



end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        AddTextListeners()

        -- Called when the scene is still off screen (but is about to come on screen).
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        DisplayQuestion()
        PositionAnswers()
        if( trueOrFalsePosition == 1)or
            ( trueOrFalsePosition == 2)then
                PositionAnswers2()
            end

        


        
    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        --parent:resumeGame()
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        RemoveTextListeners()
        --composer.removeScene( "level1_Question" )
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

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



-----------------------------------------------------------------------------------------

return scene