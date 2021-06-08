local PANEL = {}

function PANEL:Init()
	self:Scroll()
end

function PANEL:Paint(w, h)
	
end


function PANEL:Scroll()
	butscroll = buttons:Add("DScrollPanel")
	butscroll:Dock(FILL)
	local vbar = butscroll:GetVBar()
	vbar:SetWide(0)
	vbar:Hide()
end




vgui.Register("hscoreboardplyinfo", PANEL, "DPanel")