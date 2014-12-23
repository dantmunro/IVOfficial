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
local sys = require("system")

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
	PURPLE = {55, 60, 140},
	PURPLE_DEFAULT = {55, 60, 140, 1},
	PURPLE_OVER = {55, 60, 140, .4}
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
	Y = .975*display.contentHeight,
	FONT_SIZE = 9,
	PHONE_NO = "800-688-2076",
	EMAIL = "sales@ivisuals.com",
	WEB = "ivisuals.com"
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
local contacts = {}
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
local function onComplete( event )
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

local function initContactInfo(label)
	local contactInfo = display.newText( phoneNoText, display.contentCenterX, const.CONTACT_INFO.Y, "Roboto", const.CONTACT_INFO.FONT_SIZE )
	table.insert( contacts, contactInfo )
	return contactInfo

local function addAllListeners(widget, listener)
	widget:addEventListener( "tap", listener )
	widget:addEventListener( "touch", listener )
	widget:addEventListener( "mouse", listener)
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
addAllListeners(aboutBtn, aboutUsListener)
--aboutBtn.height = 3*aboutBtn.height

--"embed" video into "about us" button
--local embedStill = display.newImage( getLocalImage("Icon-Small"), aboutBtn.x + const.EMBEDDED.X_OFFSET, aboutBtn.y ) --FIXME regarded as nil
--addAllListeners(embedStill, aboutUsListener)
--embedStill:scale( const.EMBEDDED.SCALE_FACTOR, const.EMBEDDED.SCALE_FACTOR )
--[[
--create contact info at bottom of screen
local contactInfoText = "Phone: 	Email: "
local contactInfo = display.newText( contactInfoText, const.CONTACT_INFO.X, const.CONTACT_INFO.Y,
	"Roboto", const.CONTACT_INFO.FONT_SIZE )

contactInfo:setTextColor( contactInfoColor[const.RGB_INDICES.RED], 
	contactInfoColor[const.RGB_INDICES.GREEN], 
	contactInfoColor[const.RGB_INDICES.BLUE]
)
]]
--phone number
local phoneNoText = "Phone: " .. string.gsub( const.CONTACT_INFO.PHONE_NO, "-", "." )
local phoneNoInfo = display.newText( phoneNoText, .5*display.contentCenterX, const.CONTACT_INFO.Y, "Roboto", const.CONTACT_INFO.FONT_SIZE )
table.insert( contacts, phoneNoInfo )
local phoneNoListener = function(event) system.openURL("tel:" .. const.CONTACT_INFO.PHONE_NUMBER) end
addAllListeners(phoneNoInfo, phoneNoListener)

local emailText = "Email: " .. const.CONTACT_INFO.EMAIL
local emailInfo = display.newText( emailText, display.contentCenterX, const.CONTACT_INFO.Y, "Roboto", const.CONTACT_INFO.FONT_SIZE )
table.insert( contacts, emailInfo )
local emailInfoListener = function(event) system.openURL( "mailto:" .. const.CONTACT_INFO.EMAIL ) end
addAllListeners(emailInfo, emailInfoListener)

local webText = "Web: " .. const.CONTACT_INFO.WEB
local webInfo = display.newText( webText, 1.5*display.contentCenterX, const.CONTACT_INFO.Y, "Roboto", const.CONTACT_INFO.FONT_SIZE )
table.insert( contacts, webInfo )
local webInfoListener = function(event) system.openURL( "http://www." .. const.CONTACT_INFO.WEB ) end
addAllListeners(webInfo, webInfoListener)

local contactInfoColor = rgbToVector(const.IVISUALS_COLORS.PURPLE)
for i = 1, #contacts do
	contacts[i]:setTextColor( contactInfoColor[const.RGB_INDICES.RED], 
		contactInfoColor[const.RGB_INDICES.GREEN], 
		contactInfoColor[const.RGB_INDICES.BLUE]
	)
end

--create strips along sides of app
local leftStrip = display.newRect( -display.viewableContentWidth, 0, const.STRIP.WIDTH, 2*display.contentHeight )
local rightStrip = display.newRect( display.viewableContentWidth, 0, const.STRIP.WIDTH, 2*display.contentHeight )
table.insert( strips, leftStrip )
table.insert( strips, rightStrip )
local stripColor = rgbToVector(const.IVISUALS_COLORS.BLUE)
for i = 1,#strips do
	strips[i]:setFillColor( 
		stripColor[const.RGB_INDICES.RED], 
		stripColor[const.RGB_INDICES.GREEN], 
		stripColor[const.RGB_INDICES.BLUE] 
	)
end