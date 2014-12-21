application =
{

	content =
	{
		width = 320,
		height = 480, 
		scale = "zoomEven",
		fps = 30,
		
		--[[
		imageSuffix =
		{
			    ["@2x"] = 2,
		},
		--]]
	},

	--[[
	-- Push notifications
	notification =
	{
		iphone =
		
			types =
			{
				"badge", "sound", "alert", "newsstand"
			}
		}
	},
	--]]    
}

settings = {

    iphone =
    {
        plist =
        {
            UIAppFonts =
            {
                "Roboto-Black.ttf",
				"Roboto-BlackItalic.ttf",
				"Roboto-Bold.ttf",
				"Roboto-BoldItalic.ttf",
				"Roboto-Italic.ttf",
				"Roboto-Light.ttf",
				"Roboto-LightItalic.ttf",
				"Roboto-Medium.ttf",
				"Roboto-MediumItalic.ttf",
				"Roboto-Regular.ttf",
				"Roboto-Thin.ttf",
				"Roboto-ThinItalic.ttf",
				"RobotoCondensed-Bold.ttf",
				"RobotoCondensed-BoldItalic.ttf",
				"RobotoCondensed-Italic.ttf",
				"RobotoCondensed-Light.ttf",
				"RobotoCondensed-LightItalic.ttf",
				"RobotoCondensed-Regular.ttf"
            },
        },
    },
    android =
    {
        usesPermissions =
        {
            "android.permission.INTERNET",
        },
    }
}