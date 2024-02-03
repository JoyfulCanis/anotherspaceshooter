--collisions

function spatial_conditions(a,b)
	if a.x > b.x+8
	or a.x+8< b.x
	or a.y > b.y+8
	or a.y+8< b.y then
		return false
	else
		return true
	end
end


function ship_col(a, b)
	if spatial_conditions(a,b) then
		return true
		else
		return false
	end
	
end

function strike(a,b)
	if spatial_conditions(a,b) then
		return true
		else
		return false
	end
end