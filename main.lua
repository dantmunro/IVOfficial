-----------------------------------------------------------------------------------------
--
-- main.lua
-- FIXME Add id's to everything
-----------------------------------------------------------------------------------------

--imports
local widget = require("widget")
local constants = require ("lib.init")
local colors = require("lib.colors")
local native = require("native")

--constants
const.num_btns = 3
const.BTN_WIDTH_SCALE = 2/3
const.BTN_HEIGHT_SCALE = const.num_btns/30
const.RGB_TO_VECTOR_SCALE = 255
const.IMAGE_DIR = "img"
const.LIB_DIR = "lib"
const.MAIN_DIR = ""
const.IMAGE_EXT = ".png"
const.FILE_SEPARATOR = "/"
const.IVISUALS_COLORS = {
	ORANGE_DEFAULT = {228, 54, 57, 1},
	ORANGE_OVER = {228, 54, 57, .4},
	GREEN_DEFAULT = {130, 197, 118, 1},
	GREEN_OVER = {130, 197, 118, .4},
	BLUE_DEFAULT = {109, 118, 155, 1},
	BLUE_OVER = {109, 118, 155, .4},
	PURPLE_DEFAULT = {55, 60, 139, 1},
	PURPLE_OVER = {55, 60, 139, .4}
}
const.RGB_INDICES = {
	RED = 1,
	GREEN = 2,
	BLUE = 3,
	ALPHA = 4
}
--const.BTN_SPACE = .4*display.contentHeight - 250
const.BTN_SPACE = .6*display.contentHeight
const.BTN_UPPER_MARGIN = .3*display.contentHeight
const.ICON_Y = .15*display.contentHeight
const.ICON_SCALE_FACTOR = .37

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

local function handleAboutUsButtonEvent( event )
	local phase = event.phase
	if "ended" == phase then
		local fileHandle, errorString = io.open( "usr/about_us_2.txt", "r" )
		local contents = ""
		if fileHandle then
			-- read all contents of file into a string
			contents = fileHandle:read( "*a" )
		else
			print( "Reason open failed: " .. errorString )
				fileHandle = io.open( path, "w" )
				if fileHandle then
			        print( "Created file" )
				else
			        print( "Create file failed!" )
				end
				fileHandle:write( "No About section exists")
		end

		local textOptions = 
		{
			text = contents,
			x = display.contentCenterX,
			y = 100,
			width = display.actualContentWidth,
			height = 0,
			font = native.systemFontBold,
			fontSize = 12,
			align = "left",
		}
		local aboutUsText = display.newText(textOptions)
		aboutUsText:setTextColor( 0 )
		local aboutUs = widget.newScrollView({
			left = 0,
			top = 0,
			width = display.contentHeight,
			height = display.contentHeight,
			scrollHeight = 30,
			topPadding = 50,
			bottomPadding = 50,
			leftPadding = 50,
			rightPadding = 50,
			horizontalScrollDisabled = true,
			verticalScrollDisabled = false,
			listener = scrollListener
		})
		aboutUs:insert(aboutUsText)
	end
end

local function defaultListener( event )
	local webView = native.newWebView( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	webView:request( "html" .. const.FILE_SEPARATOR .. "sampleFile.html" )
end

--"global" variables
local buttons = {}
local buttonDefaults = {
	label = "",
	onEvent = defaultListener,
	emboss = false,
	shape = "roundedRect",
	width = display.contentWidth*const.BTN_WIDTH_SCALE,
	height = display.contentHeight*const.BTN_HEIGHT_SCALE,
	cornerRadius = 2,
	fillColor = {default = rgbToVector(const.IVISUALS_COLORS.BLUE_DEFAULT), over = rgbToVector(const.IVISUALS_COLORS.PURPLE_DEFAULT)},
	strokeColor = {default = rgbToVector(const.IVISUALS_COLORS.ORANGE_DEFAULT), over = rgbToVector(const.IVISUALS_COLORS.ORANGE_OVER)},
	strokeWidth = 4,
	labelColor = { default = rgbToVector(const.IVISUALS_COLORS.GREEN_DEFAULT), over = rgbToVector(const.IVISUALS_COLORS.GREEN_OVER)},
	defaultImage = getLocalImage("button")
}

--functions
local function initButton(label)
	local btn = widget.newButton(buttonDefaults)
	btn:setLabel( label )
	table.insert( buttons, btn )
	btn.x = display.contentCenterX
	for i = 1, #buttons do
		buttons[i].y = i* (const.BTN_SPACE/#buttons) + const.BTN_UPPER_MARGIN
	end
	return btn
end


--script
display.setDefault( "background", colors.white[const.RGB_INDICES.RED], colors.white[const.RGB_INDICES.GREEN], colors.white[const.RGB_INDICES.BLUE])
local background = display.getDefault( "background" )
local icon = display.newImage( getLocalImage("logo_full"), display.contentCenterX, const.ICON_Y )
icon:scale( const.ICON_SCALE_FACTOR, const.ICON_SCALE_FACTOR )
local aboutBtn = initButton("About Us")
local contactBtn = initButton("Contact Information")