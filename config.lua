application =
{

	content =
	{
		width = 320,
		height = 480, 
		scale = "zoomEven",
		fps = 30
	}
}

settings = {

    iphone =
    {
        plist =
        {
        	CFBundleDisplayName = "ivisuals",
            CFBundleName = "ivisuals",
            CFBundleIconFiles = {
            	"Icon.png",
                "Icon@2x.png",
                "Icon-60.png",
                "Icon-60@2x.png",
                "Icon-60@3x.png",
                "Icon-72.png",
                "Icon-72@2x.png",
                "Icon-76.png",
                "Icon-76@2x.png",
                "Icon-Small-40.png",
                "Icon-Small-40@2x.png",
                "Icon-Small-40@3x.png",
                "Icon-Small-50.png",
                "Icon-Small-50@2x.png",
                "Icon-Small.png",
                "Icon-Small@2x.png",
                "Icon-Small@3x.png"
            },
            UILaunchImages = {
                { -- iPhone 4 Portrait
                    ["UILaunchImageMinimumOSVersion"] = "7.0",
                    ["UILaunchImageName"] = "Default",
                    ["UILaunchImageOrientation"] = "Portrait",
                    ["UILaunchImageSize"] = "{320, 480}"
                },
                { -- iPhone 4 LandscapeLeft
                    ["UILaunchImageMinimumOSVersion"] = "7.0",
                    ["UILaunchImageName"] = "Default",
                    ["UILaunchImageOrientation"] = "LandscapeLeft",
                    ["UILaunchImageSize"] = "{320, 480}"
                },
                { -- iPhone 4 LandscapeRight
                    ["UILaunchImageMinimumOSVersion"] = "7.0",
                    ["UILaunchImageName"] = "Default",
                    ["UILaunchImageOrientation"] = "LandscapeRight",
                    ["UILaunchImageSize"] = "{320, 480}"
                },
                { -- iPhone 5 Portrait
                    ["UILaunchImageMinimumOSVersion"] = "7.0",
                    ["UILaunchImageName"] = "Default-568h",
                    ["UILaunchImageOrientation"] = "Portrait",
                    ["UILaunchImageSize"] = "{320, 568}"
                },
                { -- iPhone 5 LandscapeLeft
                    ["UILaunchImageMinimumOSVersion"] = "7.0",
                    ["UILaunchImageName"] = "Default-568h",
                    ["UILaunchImageOrientation"] = "LandscapeLeft",
                    ["UILaunchImageSize"] = "{320, 568}"
                },
                { -- iPhone 5 LandscapeRight
                    ["UILaunchImageMinimumOSVersion"] = "7.0",
                    ["UILaunchImageName"] = "Default-568h",
                    ["UILaunchImageOrientation"] = "LandscapeRight",
                    ["UILaunchImageSize"] = "{320, 568}"
                },
                { -- iPad Portrait
                    ["UILaunchImageMinimumOSVersion"] = "7.0",
                    ["UILaunchImageName"] = "Default-Portrait",
                    ["UILaunchImageOrientation"] = "Portrait",
                    ["UILaunchImageSize"] = "{768, 1024}"
                },
                { -- iPad LandscapeLeft
                    ["UILaunchImageMinimumOSVersion"] = "7.0",
                    ["UILaunchImageName"] = "Default-Landscape",
                    ["UILaunchImageOrientation"] = "LandscapeLeft",
                    ["UILaunchImageSize"] = "{768, 1024}"
                },
                { -- iPad LandscapeRight
                    ["UILaunchImageMinimumOSVersion"] = "7.0",
                    ["UILaunchImageName"] = "Default-Landscape",
                    ["UILaunchImageOrientation"] = "LandscapeRight",
                    ["UILaunchImageSize"] = "{768, 1024}"
                },
                { -- iPhone 6 Portrait
                    ["UILaunchImageMinimumOSVersion"] = "8.0",
                    ["UILaunchImageName"] = "Default-667h",
                    ["UILaunchImageOrientation"] = "Portrait",
                    ["UILaunchImageSize"] = "{375, 667}"
                },
                { -- iPhone 6 LandscapeLeft
                    ["UILaunchImageMinimumOSVersion"] = "8.0",
                    ["UILaunchImageName"] = "Default-667h",
                    ["UILaunchImageOrientation"] = "LandscapeLeft",
                    ["UILaunchImageSize"] = "{375, 667}"
                },
                { -- iPhone 6 LandscapeRight
                    ["UILaunchImageMinimumOSVersion"] = "8.0",
                    ["UILaunchImageName"] = "Default-667h",
                    ["UILaunchImageOrientation"] = "LandscapeRight",
                    ["UILaunchImageSize"] = "{375, 667}"
                },
                { -- iPhone 6 Plus Portrait
                    ["UILaunchImageMinimumOSVersion"] = "8.0",
                    ["UILaunchImageName"] = "Default-736h",
                    ["UILaunchImageOrientation"] = "Portrait",
                    ["UILaunchImageSize"] = "{414, 736}"
                },
                { -- iPhone 6 Plus LandscapeLeft
                    ["UILaunchImageMinimumOSVersion"] = "8.0",
                    ["UILaunchImageName"] = "Default-Landscape-736h",
                    ["UILaunchImageOrientation"] = "LandscapeLeft",
                    ["UILaunchImageSize"] = "{414, 736}"
                },
                { -- iPhone 6 Plus LandscapeRight
                    ["UILaunchImageMinimumOSVersion"] = "8.0",
                    ["UILaunchImageName"] = "Default-Landscape-736h",
                    ["UILaunchImageOrientation"] = "LandscapeRight",
                    ["UILaunchImageSize"] = "{414, 736}"
                },
            },
            UIApplicationExitsOnSuspend = false,
            UIPrerenderedIcon = true,
            UIStatusBarHidden = false,
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
    	versionCode = "2",
        usesPermissions =
        {
            "android.permission.INTERNET",
        },
        usesFeatures =
        {
            {name="android.hardware.camera", required=false},
            {name="android.hardware.location", required=false},
            {name="android.hardware.location.gps", required=false},
        }
    },
    orientation = 
    {
    	default = "portrait",
    	supported = {"portrait", "portraitUpsideDown"}
	},
	build =
    {
        neverStripDebugInfo = false
    },
    excludeFiles =
    {
        -- Exclude all files at paths which end with "secret.txt":
        all = {"*secret.txt"},
        -- Exclude all Android icon files and .ogg files in the "music" directory:
        iphone = {"Icon-*dpi.png", "music/*.ogg"},
        -- Exclude iOS "retina" image files and .m4a files in the "music" directory:
        android = {"Icon.png", "*@2x.png", "music/*.m4a"} 
    }
}