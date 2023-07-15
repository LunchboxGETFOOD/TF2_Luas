local t = {}
t.time = 0
function dotimer(dt,interval,start)
	if start == true then
		t.time = t.time + dt
		if t.time >= interval then
			t.time = t.time - interval    -- 重置计时器
			return true
		else
			return false
		end
	else
		t.time = 0
	end

end

callbacks.Register( 'CreateMove', function()
	local localplayer = entities.GetLocalPlayer()
	local charge = false
	if warp.GetChargedTicks() ~= 23 then
		charge = true
		if dotimer(0.16,10,charge) then
			warp.TriggerCharge()
		end
	else
		charge = false
	end
	print(charge)

end)
