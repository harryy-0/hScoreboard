ply = LocalPlayer()

function SteamID(target)
	SetClipboardText(target:SteamID64())
end

function Goto(target)
	if target == ply then 
		chat.AddText(color_blue, "Server |", color_white, " You can not target yourself.")
	return end

	LocalPlayer():ConCommand( "ulx goto "..target:Nick())
end

function Bring(target)
	if target == ply then 
		chat.AddText(color_blue, "Server |", color_white, " You can not target yourself.")
	return end

	ply:ConCommand( "ulx bring "..target:Nick())
end

function Teleport(target)
	if target == ply then 
		chat.AddText(color_blue, "Server |", color_white, " You can not target yourself.")
	return end

	ply:ConCommand( "ulx teleport "..target:Nick())
end

function Slay(target)
	ply:ConCommand( "ulx slay "..target:Nick())
end


function Kick(target)
	if target == ply then 
		chat.AddText(color_blue, "Server |", color_white, " You can not target yourself.")
	return end
	if not IsValid(hscoreboard.Main) then return end
	hscoreboard.Main:Hide()
if IsValid(hscoreboardinfo) then 
	hscoreboardinfo:Hide()
end
if hscoreboard.Settings.BlurBackground then	
	if not IsValid(hscoreboard.Blur) then return end
	hscoreboard.Blur:Hide()
end
	ply:ConCommand( "ulx kick "..target:Nick().." "..hscoreboard.Punishments.KickReason)
end

function Ban(target)
	if target == ply then 
		chat.AddText(color_blue, "Server |", color_white, " You can not target yourself.")
	return end
	if not IsValid(hscoreboard.Main) then return end
		hscoreboard.Main:Hide()
	if IsValid(hscoreboardinfo) then 
		hscoreboardinfo:Hide()
	end
	if hscoreboard.Settings.BlurBackground then	
	if not IsValid(hscoreboard.Blur) then return end
		hscoreboard.Blur:Hide()
	end
	ply:ConCommand( "ulx ban "..target:Nick().." "..hscoreboard.Punishments.BanLength.." "..hscoreboard.Punishments.BanReason)
end
		