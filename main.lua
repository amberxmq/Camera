-- Camera by Mengqi Xu

display.setStatusBar( display.HiddenStatusBar )
local bkgd = display.newImage( "background.png", 235, 240 )

local text = display.newText( "Tap anywhere to launch Camera", 0, 0, "Nanum Pen Script",29 )
text:setTextColor( 255/255, 69/255, 0/255 )
text.x = 0.5 * display.contentWidth
text.y = 0.5 * display.contentHeight

local onComplete = function(event) 
	image = event.target
	if image then
                -- center image on screen
                image.x = display.contentWidth/2
                image.y = 0.65*display.contentHeight
                image.width = 260
                image.height = 300
        return image

        end
end
-- filter codes come from the examples in Corona Docs
function filter()
        local function addBloom()
                image.fill.effect = "filter.bloom"
                image.fill.effect.levels.white = 0.8
                image.fill.effect.levels.black = 0.4
                image.fill.effect.levels.gamma = 1
                image.fill.effect.add.alpha = 0.8
                image.fill.effect.blur.horizontal.blurSize = 20
                image.fill.effect.blur.horizontal.sigma = 140
                image.fill.effect.blur.vertical.blurSize = 20
                image.fill.effect.blur.vertical.sigma = 240
        end
        local function addBlur()
                image.fill.effect = "filter.blur"
        end 
        local function addVignette()
                image.fill.effect = "filter.vignette"
                image.fill.effect.radius = 0.1
        end
        local function addGrayscale()
                image.fill.effect = "filter.grayscale"
        end
        widget = require( "widget" )
        local function handleButtonEvent1( event )
                if ( "ended" == event.phase ) then
                        addBloom()
                end
        end
        local function handleButtonEvent2( event )
                if ( "ended" == event.phase ) then
                        addBlur()
                end
        end
        local function handleButtonEvent3( event )
                if ( "ended" == event.phase ) then
                        addVignette()
                end
        end
        local function handleButtonEvent4( event )
                if ( "ended" == event.phase ) then
                        addGrayscale()
                end
        end

        local button1 = widget.newButton
        {
        left = 80,
        top = 10,
        id = "button1",
        label = "Click to Bloom",
        fontSize=15,
        font="Avenir Black",
        labelColor = { default={ 255/255, 52/255, 32/255 }, over={ 1, 1, 1, 0.5 } },
        onEvent = handleButtonEvent1
        }

        local button2 = widget.newButton
        {
        left = 80,
        top = 40,
        id = "button2",
        label = "Click to Blur",
        fontSize=15,
        font="Avenir Black",
        labelColor = { default={ 255/255, 138/255, 14/255 }, over={ 1, 1, 1, 0.5 } },
        onEvent = handleButtonEvent2
        }

        local button3 = widget.newButton
        {
        left = 80,
        top = 70,
        id = "button3",
        label = "Click to Vignette",
        fontSize=15,
        font="Avenir Black",
        labelColor = { default={ 9/255, 255/255, 12/255 }, over={ 1, 1, 1, 0.5 } },
        onEvent = handleButtonEvent3
        }

        local button4 = widget.newButton
        {
        left = 80,
        top = 100,
        id = "button4",
        label = "Click to Greyscale",
        fontSize=15,
        font="Avenir Black",
        labelColor = { default={ 50/255, 25/255, 255/255 }, over={ 1, 1, 1, 0.5 } },
        onEvent = handleButtonEvent4
        }
end

function addAnimation()
        local sheetData = { width=84, height=100, numFrames=6, sheetContentWidth=506, sheetContentHeight=104 }
        local sheet = graphics.newImageSheet( "fairy.png", sheetData )
        local sequenceData = {
                 name="seq", sheet=sheet1, start=1, count=6, time=2200, loopCount=0 
                }

        local myAnimation = display.newSprite( sheet, sequenceData )
        myAnimation.x = 50; myAnimation.y = 100
        myAnimation:play()
end

local listener = function( event )
        
        bkgd:removeSelf()
        text:removeSelf()
        local frame = display.newImage( "frame.jpeg", 170, 240 )
        media.show( media.Camera, onComplete )
        addAnimation()
        filter()
        return true
end


bkgd:addEventListener( "tap", listener )

