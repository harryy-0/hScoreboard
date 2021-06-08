include("cl_hscoreboard_functions.lua")

local PANEL = {}

function PANEL:Init()
	self:DockMargin(5, 2, 5, 2)
	self:SetText("")
	self:SetHeight(32)
	self:SetCursor("hand")
end


function PANEL:GetPlayer(ply)

	self.player = ply

end

function PANEL:DoClick()

if IsValid(hscoreboardinfo) then 
	hscoreboardinfo:Remove()
end
	hscoreboardinfo = vgui.Create("hscoreboardplyinfo")
	hscoreboardinfo:SetSize(ScrW()*.2, ScrH()*.15)
	hscoreboardinfo:Center()
	hscoreboardinfo:MakePopup()

	hscoreboardinfo.Paint = function(panel, w, h )
		draw.RoundedBox(5, 0, 0, w, h, hscoreboard.Colors.PlayerInfoBoxCol)
		draw.SimpleText("Name: "..self.player:Nick(),"hscoreboardtext", ScrW()*.002, ScrH()*.005, color_white, TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.SimpleText("Steam ID: "..self.player:SteamID(),"hscoreboardtext", ScrW()*.002, ScrH()*.025, color_white, TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.SimpleText("Kills: "..self.player:Frags(),"hscoreboardtext", ScrW()*.002, ScrH()*.065, color_white, TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.SimpleText("Deaths: "..self.player:Deaths(),"hscoreboardtext", ScrW()*.002, ScrH()*.085, color_white, TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.SimpleText("Money: "..DarkRP.formatMoney(self.player:getDarkRPVar("money")),"hscoreboardtext", ScrW()*.002, ScrH()*.105, color_white, TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)

	for k,v in pairs(hscoreboard.Ranks) do
	local ply = LocalPlayer()
	if (ply:GetUserGroup() == k) then 
		draw.SimpleText("Rank: "..v, "hscoreboardtext", ScrW()*.002, ScrH()*.045, color_white, TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		return end
	end



end
end


function PANEL:Paint(w, h)
	
	if not self:IsHovered() then
		draw.RoundedBox(0, 0, 0, w, h, team.GetColor(self.player:Team()))
	else
		draw.RoundedBox(0, 0, 0, w, h, ColorAlpha(team.GetColor(self.player:Team()), 160 ))
	end
	draw.SimpleText(self.player:Nick(), "hscoreboardtext", 40, 6, color_white,TEXT_ALIGN_LEFT)
	draw.SimpleText(self.player:getDarkRPVar("job"), "hscoreboardtext", ScrW()*.12, 6, color_white, TEXT_ALIGN_CENTER)
	draw.SimpleText(self.player:Frags(), "hscoreboardtext", ScrW()*.29, 6, color_white, TEXT_ALIGN_CENTER)
	draw.SimpleText(self.player:Deaths(), "hscoreboardtext", ScrW()*.375, 6, color_white, TEXT_ALIGN_CENTER)
	draw.SimpleText(self.player:Ping(), "hscoreboardtext", ScrW()*.475, 6, color_white, TEXT_ALIGN_CENTER)

	for k,v in pairs(hscoreboard.Ranks) do
	local ply = LocalPlayer()
	if (ply:GetUserGroup() == k) then 
			draw.SimpleText(v, "hscoreboardtext", ScrW()*.196, 6, color_white, TEXT_ALIGN_CENTER)
		return
	end
end

end


vgui.Register("HScoreboardPlayerPanel", PANEL, "DButton")
