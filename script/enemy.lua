--enemy

nms={}
nms_spr={21,23,25}
function nmy_spw(
	xx,yy,
	sspd,ssprt)
	
	new_nmy={x=xx,y=yy,spd=sspd,
	sprt=ssprt}
	add(nms,new_nmy)
end

function nmy_spr()
	for n in all(nms) do
		spr(n.sprt,n.x,n.y)
	end
end

--generating new enemy

function nmy_gen()
	--generating new ennemy
			s_spr=rnd(nms_spr)
			--random enemy
			if (s_spr == 21) then
				s_spd=rnd(1)+0.3
			elseif (s_spr == 23) then
				s_spd=rnd(1)+1
			else
				s_spd=2.5
			end
			nmy_spw(130,rnd(120),
			s_spd,s_spr)
end


--move enemy
function move_nmy()
	for n in all(nms) do
		n.x-=n.spd
		if (n.x <= -8) then
			del(nms, n)
			nmy_spw(
			130,rnd(120), rnd(2)+0.5, 21)
		end
		--ship collision
		if(ship_col(n,ship))then
			sfx(23)
			for i = 1, 6 do
			n.sprt=26+i
			end
			ship.hp-=1
			del(nms,n)
			nmy_gen()
		--strike
		
		
			
			
		end
	end
	
end