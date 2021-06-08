local PANEL = {}

function PANEL:Init()
	self:ShowCloseButton(false)
	self:SetDraggable(false)
	self:SetTitle("")
	self:DockPadding(0, 0, 0, 0)
	self:SetMouseInputEnabled( true )
	self:Title()
	self:Body()
	self:Players()
	self:TopBar()

end

function PANEL:Title()
	self.title = self:Add("DPanel")
	self.title:Dock(TOP)
	self.title:DockPadding(0, 0, 0, 0)
	self.title:SetSize(10, 55)
	self.title.Paint = function(self, w, h)
		draw.RoundedBox(5, ScrW()*.01, ScrH()*.01, 140, 30, hscoreboard.Colors.DateBoxCol)
		draw.RoundedBox(0, 0, 0, w, h, hscoreboard.Colors.TitleBoxCol)
		draw.SimpleText(hscoreboard.Settings.Title, "hscoreboardtitle", w *.5, h *.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		draw.SimpleText(os.date("%d.%m.%Y %H:%M:%S"), "hscoreboarddate", ScrW() *.046, ScrH() *.025, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

function PANEL:TopBar()
	local topbar = self:Add("DPanel")
	topbar:Dock(TOP)
	topbar.Paint = function(self, w, h)
	draw.RoundedBox(0, 0, 0, w, h, hscoreboard.Colors.TitleBarCol)
	draw.SimpleText("Name", "DermaDefault", ScrW()*.023, 4, color_white,TEXT_ALIGN_LEFT)
	draw.SimpleText("Job", "DermaDefault", ScrW()*.122, 4, color_white, TEXT_ALIGN_CENTER)
	draw.SimpleText("Rank", "DermaDefault", ScrW()*.197, 4, color_white, TEXT_ALIGN_CENTER)
	draw.SimpleText("Kills", "DermaDefault", ScrW()*.2925, 4, color_white, TEXT_ALIGN_CENTER)
	draw.SimpleText("Deaths", "DermaDefault", ScrW()*.3775, 4, color_white, TEXT_ALIGN_CENTER)
	draw.SimpleText("Ping", "DermaDefault", ScrW()*.478, 4, color_white, TEXT_ALIGN_CENTER)
	end
end

function PANEL:Players()
	self.playerinfopanels = {}
	local sortply = player.GetAll()
	table.sort(sortply, function(x, y)
	return x:Team() > y:Team()
	end)

for k, v in pairs(sortply) do

	playerinfopanel = self.body:Add("HScoreboardPlayerPanel")
	playerinfopanel:Dock(TOP)
	playerinfopanel:GetPlayer(v)

	self.playerinfopanels[playerinfopanel] = true

	local avatar = playerinfopanel:Add("AvatarImage")
	avatar:Dock(LEFT)
	avatar:SetPlayer(v)
	avatar:SetWidth(35)
	end
end


function PANEL:Body()

	self.body = self:Add("DScrollPanel")
	self.body:Dock(FILL)
	self.body:SetWide(0)


	local vbar = self.body:GetVBar()
	vbar:SetWide(0)
	vbar:Hide()
end

function PANEL:Paint(w, h)
	draw.RoundedBox(5, 0, 0, w, h, Color(77, 77, 77, 200))
end

vgui.Register("HScoreboardPanel", PANEL, "DFrame")

