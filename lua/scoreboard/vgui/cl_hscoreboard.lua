hscoreboard = {

	Settings = {
	
	Title = "Mountain Networks",

	BlurBackground = true,

	},

	Colors = {

		TitleBoxCol = Color(84, 150, 255, 220),

		TitleTextCol = Color(255,255,255),

		TitleBarCol = Color(87, 87, 87, 220),

		DateBoxCol = Color(177,177, 177, 255),

		BackgroundEffectCol = Color(87,87, 87,220),

		PlayerInfoBoxCol = Color(77, 77, 77, 255)

	},

	Ranks = {


		["superadmin"] = "Super Admin",
		["admin"] = "Admin",
		["user"] = "User", -- Keep user rank
	},

	Punishments = {

		KickReason = "Cooldown",

		BanLength = "12h",

		BanReason = "Cooldown ban"


	},


}


local hide = {
	["CTargetID"] = true
	
}

hook.Add( "HUDShouldDraw", "HideHUD", function( name )
	if ( hide[ name ] ) then
		return false
	end
end )


function hscoreboard:Activate()

	if IsValid(hscoreboard.Main) then
		hscoreboard.Main:Remove()
	end
	hscoreboard.Main = vgui.Create("HScoreboardPanel")
	hscoreboard.Main:SetSize(ScrW()*.5, ScrH()*.6)
	hscoreboard.Main:Center()
	hscoreboard.Main:MakePopup()
if hscoreboard.Settings.BlurBackground then
	hscoreboard.Blur = vgui.Create("DFrame")
	hscoreboard.Blur:SetSize(ScrW(), ScrH())
	hscoreboard.Blur:ShowCloseButton(false)
	hscoreboard.Blur:SetDraggable(false)
	hscoreboard.Blur:SetTitle("")
	hscoreboard.Blur.Paint = function(self, w, h)
		draw.RoundedBox(0, 0, 0, w, h, hscoreboard.Colors.BackgroundEffectCol)
	end
end

					
end

function hscoreboard:Dectivate()
	if not IsValid(hscoreboard.Main) then return end
	hscoreboard.Main:Hide()
if IsValid(hscoreboardinfo) then 
	hscoreboardinfo:Hide()
end
if hscoreboard.Settings.BlurBackground then	
	if not IsValid(hscoreboard.Blur) then return end
	hscoreboard.Blur:Hide()
end
end
	

hook.Add("ScoreboardShow", "ScoreboardActive", function()
	hscoreboard:Activate()
	return true
end)

hook.Add("ScoreboardHide","ScoreboardDeactive", function()
	hscoreboard:Dectivate()
	return true
end)

hook.Add( "Initialize", "DisableFAdminScoreboard", function()
	hook.Remove("ScoreboardHide", "FAdmin_scoreboard")
	hook.Remove("ScoreboardShow", "FAdmin_scoreboard")
end )

surface.CreateFont( "hscoreboardtitle", {
	font = "Bebas Neue", 
	extended = false,
	size = 50,
	weight = 100,
} )

surface.CreateFont( "hscoreboarddate", {
	font = "Bebas Neue", 
	extended = false,
	size = 25,
	weight = 100,
} )

surface.CreateFont( "hscoreboardinfo", {
	font = "Bebas Neue", 
	extended = false,
	size = 25,
	weight = 100,
} )

surface.CreateFont( "hscoreboardtext", {
	font = "Abel", 
	size = 20,
	weight = 10,
} )
