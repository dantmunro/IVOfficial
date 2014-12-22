-----------------------------------------------------------------------------------------
--
-- main.lua
-- FIXME Add id's to everything
-----------------------------------------------------------------------------------------

--IMPORTS
local widget = require("widget")
local constants = require ("lib.init")
local colors = require("lib.colors")
local native = require("native")

--CONSTANTS
const.RGB_TO_VECTOR_SCALE = 255
const.IMAGE_DIR = "img"
const.LIB_DIR = "lib"
const.MAIN_DIR = ""
const.IMAGE_EXT = ".png"
const.FILE_SEPARATOR = "/"
const.IVISUALS_COLORS = {
	ORANGE = {228, 54, 57},
	ORANGE_DEFAULT = {228, 54, 57, 1},
	ORANGE_OVER = {228, 54, 57, .4},
	GREEN = {130, 197, 118},
	GREEN_DEFAULT = {130, 197, 118, 1},
	GREEN_OVER = {130, 197, 118, .4},
	BLUE = {109, 118, 155},
	BLUE_DEFAULT = {109, 118, 155, 1},
	BLUE_OVER = {109, 118, 155, .4},
	PURPLE = {55, 60, 139},
	PURPLE_DEFAULT = {55, 60, 139, 1},
	PURPLE_OVER = {55, 60, 139, .4}
}
const.RGB_INDICES = {
	RED = 1,
	GREEN = 2,
	BLUE = 3,
	ALPHA = 4
}
const.BTN = {
	UPPER_MARGIN = .3*display.contentHeight,
	LOWER_MARGIN = .025*display.contentHeight,
	SPACE = .6*display.contentHeight,
	WIDTH = .6*display.contentWidth,
	HEIGHT = .07*display.contentHeight
}
const.CONTACT_INFO = {
	X = display.contentCenterX,
	Y = .975*display.contentHeight,
	FONT_SIZE = 9
}
const.ICON = {
	Y = .1*display.contentHeight,
	SCALE_FACTOR = .3
}
const.STRIP = {
	WIDTH = .07*display.actualContentWidth,
	HORIZ_MARGIN = 30
}
const.EMBEDDED = {
	X_OFFSET = .3*const.BTN.WIDTH,
	SCALE_FACTOR = .1
}

--"INLINE" FUNCTIONS
local function getLocalImage(name)
	return const.IMAGE_DIR .. const.FILE_SEPARATOR .. name .. const.IMAGE_EXT
end

local function rgbToVector(rgb)
	vector = {} 
	for i = 1, 3 do
		vector[i] = rgb[i] / const.RGB_TO_VECTOR_SCALE
	end
	return vector
end

--"GLOBAL" VARIABLES
local buttons = {}
local buttonsGroup = display.newGroup( )
local strips = {}
local buttonDefaults = {
	shape = "roundedRect",
	width = const.BTN.WIDTH,
	height = const.BTN.HEIGHT,
	cornerRadius = 2,
	fillColor = {default = rgbToVector(const.IVISUALS_COLORS.BLUE_DEFAULT), over = rgbToVector(const.IVISUALS_COLORS.PURPLE_DEFAULT)},
	--strokeColor = {default = rgbToVector(const.IVISUALS_COLORS.ORANGE_DEFAULT), over = rgbToVector(const.IVISUALS_COLORS.ORANGE_OVER)},
	--strokeWidth = 1,
	labelColor = { default = rgbToVector(const.IVISUALS_COLORS.GREEN_DEFAULT), over = rgbToVector(const.IVISUALS_COLORS.GREEN_OVER)},
	defaultImage = getLocalImage("button"),
}

--LISTENERS
local onComplete = function( event )
   print( "video session ended" )
end
local function aboutUsListener(event)
	if event.phase == "began" then
		print("You touched the object")
		media.playVideo( "https://acm.wustl.edu/cse232/lecture_videos/CSE%20232%20-%20Lecture%203.mp4", media.RemoteSource, true, listener )
		return true
	elseif event.errorCode then
        native.showAlert( "Error!", event.errorMessage, { "OK" } )
        return false
    end
end

--FUNCTIONS
local function initButton(label)
	local btn = widget.newButton(buttonDefaults)
	table.insert( buttons, btn )
	btn.x = display.contentCenterX
	for i = 1, #buttons do
		buttons[i].y = i* ((const.BTN.SPACE)/(#buttons + 1)) + const.BTN.UPPER_MARGIN - const.BTN.LOWER_MARGIN
		local labelText = display.newText( label, btn.x - const.EMBEDDED.X_OFFSET, btn.y, "Roboto", 15 )
		local labelTextColor = rgbToVector(const.IVISUALS_COLORS.GREEN)
		labelText:setFillColor( labelTextColor[const.RGB_INDICES.RED], 
			labelTextColor[const.RGB_INDICES.GREEN], 
			labelTextColor[const.RGB_INDICES.BLUE] 
		)
	end
	return btn
end

--SCRIPT

--create background
display.setDefault( "background", 
	colors.white[const.RGB_INDICES.RED], 
	colors.white[const.RGB_INDICES.GREEN], 
	colors.white[const.RGB_INDICES.BLUE]
)
local background = display.getDefault( "background" )

--create header icon
local icon = display.newImage( getLocalImage("logo_full"), display.contentCenterX, const.ICON.Y )
icon:scale( const.ICON.SCALE_FACTOR, const.ICON.SCALE_FACTOR )

--create "about us" button
local aboutBtn = initButton("About Us")
aboutBtn:addEventListener( "tap", aboutUsListener )
aboutBtn:addEventListener( "touch", aboutUsListener )
aboutBtn:addEventListener( "mouse", aboutUsListener )
--aboutBtn.height = 3*aboutBtn.height

--"embed" video into "about us" button
local embedStill = display.newImage( getLocalImage("Icon-Small"), aboutBtn.x + const.EMBEDDED.X_OFFSET, aboutBtn.y )
embedStill:addEventListener( "tap", aboutUsListener )
embedStill:addEventListener( "touch", aboutUsListener )
embedStill:addEventListener( "mouse", aboutUsListener )
--embedStill:scale( const.EMBEDDED.SCALE_FACTOR, const.EMBEDDED.SCALE_FACTOR )

--create contact info at bottom of screen
local contactInfoText = "Phone: (800) 688-2076    Email: sales@ivisuals.com"
local contactInfo = display.newText( contactInfoText, const.CONTACT_INFO.X, const.CONTACT_INFO.Y,
	"Roboto", const.CONTACT_INFO.FONT_SIZE )
local contactInfoColor = rgbToVector(const.IVISUALS_COLORS.PURPLE_DEFAULT)
contactInfo:setTextColor( contactInfoColor[const.RGB_INDICES.RED], 
	contactInfoColor[const.RGB_INDICES.GREEN], 
	contactInfoColor[const.RGB_INDICES.BLUE]
)

--create strips along sides of app
local leftStrip = display.newRect( const.STRIP.HORIZ_MARGIN, 0, const.STRIP.WIDTH, 2*display.contentHeight )
local rightStrip = display.newRect( display.contentWidth - const.STRIP.HORIZ_MARGIN, 
	0, const.STRIP.WIDTH, 2*display.contentHeight )
table.insert( strips, leftStrip )
table.insert( strips, rightStrip )
local stripColor = rgbToVector(const.IVISUALS_COLORS.BLUE)
for i = 1,#strips do
	strips[i]:setFillColor( stripColor[const.RGB_INDICES.RED], 
	stripColor[const.RGB_INDICES.GREEN], 
	stripColor[const.RGB_INDICES.BLUE] )
end