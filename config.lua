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
--[[
settings = {

    iphone =
    {
        plist =
        {
            UIAppFonts =
            {
                "PTF55F.ttf",
                "SourceCodePro-Black.ttf",
                "AvenirLTStd-Black.otf"
            },
        },
    },
}
]]--