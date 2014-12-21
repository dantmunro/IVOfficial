-----------------------------------------------------------------------------------------
--
-- main.lua
-- FIXME Add id's to everything
-----------------------------------------------------------------------------------------

--imports
local widget = require("widget")
local constants = require ("lib.init")
local colors = require("lib.colors")

--constants
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
	Y = .15*display.contentHeight,
	SCALE_FACTOR = .3
}
const.STRIP = {
	WIDTH = .03*display.contentWidth,
	HORIZ_MARGIN = 30
}

--"inline" functions
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

--listeners
local function scrollListener( event )
	local phase = event.phase
	local direction = event.direction

	if event.limitReached then
		if "up" == direction then
			print("Reached Top Limit")
		elseif "down" == direction then
			print("Reached Bottom Limit")
		end
	end

	return true
end

local function defaultListener( event )
	local webView = native.newWebView( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	webView:request( "html" .. const.FILE_SEPARATOR .. "sampleFile.html" )
end

--"global" variables
local buttons = {}
local strips = {}
local buttonDefaults = {
	label = "",
	onEvent = defaultListener,
	emboss = false,
	shape = "roundedRect",
	width = const.BTN.WIDTH,
	height = const.BTN.HEIGHT,
	cornerRadius = 2,
	fillColor = {default = rgbToVector(const.IVISUALS_COLORS.BLUE_DEFAULT), over = rgbToVector(const.IVISUALS_COLORS.PURPLE_DEFAULT)},
	strokeColor = {default = rgbToVector(const.IVISUALS_COLORS.ORANGE_DEFAULT), over = rgbToVector(const.IVISUALS_COLORS.ORANGE_OVER)},
	strokeWidth = 4,
	labelColor = { default = rgbToVector(const.IVISUALS_COLORS.GREEN_DEFAULT), over = rgbToVector(const.IVISUALS_COLORS.GREEN_OVER)},
	defaultImage = getLocalImage("button"),
	emboss = true,
	font = "Roboto"
}

--functions
local function initButton(label)
	local btn = widget.newButton(buttonDefaults)
	btn:setLabel( label )
	table.insert( buttons, btn )
	btn.x = display.contentCenterX
	for i = 1, #buttons do
		buttons[i].y = i* ((const.BTN.SPACE)/(#buttons + 1)) + const.BTN.UPPER_MARGIN - const.BTN.LOWER_MARGIN
	end
	return btn
end


--script
display.setDefault( "background", 
	colors.white[const.RGB_INDICES.RED], 
	colors.white[const.RGB_INDICES.GREEN], 
	colors.white[const.RGB_INDICES.BLUE]
)
local background = display.getDefault( "background" )
local icon = display.newImage( getLocalImage("logo_full"), display.contentCenterX, const.ICON.Y )
icon:scale( const.ICON.SCALE_FACTOR, const.ICON.SCALE_FACTOR )
local aboutBtn = initButton("About Us")
local contactInfoText = "Phone: (800) 688-2076    Email: sales@ivisuals.com"
local contactInfo = display.newText( contactInfoText, const.CONTACT_INFO.X, const.CONTACT_INFO.Y,
	"Roboto", const.CONTACT_INFO.FONT_SIZE )
local contactInfoColor = rgbToVector(const.IVISUALS_COLORS.PURPLE_DEFAULT)
contactInfo:setTextColor( contactInfoColor[const.RGB_INDICES.RED], 
	contactInfoColor[const.RGB_INDICES.GREEN], 
	contactInfoColor[const.RGB_INDICES.BLUE]
)
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