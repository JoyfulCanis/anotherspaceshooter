pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
function _init()
n_star()
nmy_spw(120,60,0.5)
title_init()
music(0) 
end

function _update60()
--ship
	s_move()
	move_bul()
	thr_index()
	shoot()
--enemy
	move_nmy()
	
	--moving_stars
	for s in all (star) do
	
		if(s.spd<2) then
			s.col=10
		
		end
		s.x-=s.spd
		if (s.x<0) then s.x=128end
	end
	
end

function _draw()
	cls()
	for s in all(star) do
		pset(s.x,s.y, s.col)
	end
	ship_spr()
	bul_spr()
	nmy_spr()
	
	for l in all (title) do
	
		spr(l.spr1,26+(l.tx),l.ty)
		spr(l.spr2,26+(l.tx),l.ty+8)
		
	end
	

end
-->8
--ship
ship = {
x=60,
y=60,
speed=1,
sprt=1,
thr=5,
thrrev=10,
thrrig=14,
thrlef=17,
bul=18
}
bul={}

--move
function s_move()
	ship.sprt=1
	if btn(⬆️) and ship.y>0 then
	 ship.y-=ship.speed
	 ship.sprt = 2
	 sfx(22)
	elseif btn(⬇️) and ship.y<120 then
	 ship.y+=ship.speed
	 ship.sprt = 3
	 sfx(22)
	elseif btn(➡️) and ship.x<120 then
		ship.x+=ship.speed+0.2
		sfx(20)
	elseif btn(⬅️) and ship.x>0 then
		ship.x-=ship.speed
		ship.sprt = 4
		sfx(21)
	end
	
	
end

--sprite_move

function ship_spr()
	spr(ship.sprt,
		ship.x,ship.y)
	if btn(➡️) and ship.x<120 then
		spr(ship.thr,
			ship.x-8, ship.y+1)
	elseif btn(⬅️) and ship.x>0 then
			spr(ship.thrrev,
				ship.x+8, ship.y)
	elseif btn(⬇️) and ship.y<120 then
		spr(ship.thrrig,
		ship.x-7, ship.y-2)
	elseif btn(⬆️) and ship.y>0 then
		spr(ship.thrlef,
		ship.x-7, ship.y+2)
	end
end

--thruster_index

function thr_index()
	if(ship.thr==9) ship.thr=5
	ship.thr+=1
	if(ship.thrrev==13) ship.thrrev =10
	ship.thrrev+=1
	if(ship.thrrig==17) ship.thrrig = 14
	ship.thrrig+=1
	if(ship.thrlef==14) ship.thrlef = 17
	ship.thrlef-=1
end

--shoot

function shoot()

	function create_bul(xx,yy)
		new_bul = {x=xx,y=yy}
		add(bul, new_bul)
	end
	
	if (ship.bul ==20) ship.bul =18
	ship.bul+=1
	
	if btnp(❎) then
			create_bul(ship.x+8,ship.y)
			sfx(0)
	end
	
end

--bullet_spr
function bul_spr()
	for b in all(bul) do
		spr(ship.bul, b.x, b.y)
	end
end

function move_bul()
	for b in all(bul) do
		b.x+=1
		if(b.x>100) then
			del(bul,b)
		end
	end
end
-->8
--star
star={}

function n_star()
	for i=1, 40 do
		n_star={
			x=rnd(128),
			y=rnd(128),
			col=7,
			spd=rnd(2.5)+1
		}
		add(star,n_star)
	end
	
end



-->8
--enemy

nms={}

function nmy_spw(xx,yy,sspd)
	new_nmy={x=xx,y=yy,spd=sspd}
	add(nms,new_nmy)
end

function nmy_spr()
	for n in all(nms) do
		spr(21,n.x,n.y)
	end
end

function move_nmy()
	for n in all(nms) do
		n.x-=n.spd
		if (n.x <= -8) then
		del(nms, n)
		nmy_spw(
		130,rnd(120), rnd(2)+0.5)
		
		end
	end
end
-->8
--title

function title_init()

	title={}
		
	for i = 1,19 do
	
		tspr1=63+i
		tspr2=79+i
		if(i >7) and (i <13) then
			ttx=(i-7)*8
			tty=58
		elseif (i>12) then
			ttx=(i-12)*8
			tty=72
			if (i>16) then
				tspr1+=16
				tspr2+=16
			end
		else
			ttx=i*8
			tty=44
		end
		
		new_letter ={spr1=tspr1,
		spr2=tspr2,
		tx=ttx,ty=tty}
		add(title,new_letter)
		
	end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000111000001110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070000000000911111109ccc1110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008
0007700000770000811111118c7cccc1077000110008989800000989000008990000009800000089900000008000000090000000800000000000000000000009
00077000a1ccc100811111118c7cccc107cc11190000898900009898000089890000098900000898000000009800000099000000000000000000000800000000
0070070081111111911111109ccc11101c1111800000000000000000000000000000000000000000800000009000000080000000900000000000000000000009
00000000000000000111000001110000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000800000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000888880008888800000000000000000000000000000000000000000000000000000000
00000000000000080000000000000000000000002222220022222200008888850088888500000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000e2992200e2992200487c885048cc88505d50555000000000000000000000000000000000000000000000000
000000000000000800000000000000000000000000279925002c9925888cc888888cc88800055cdd000000000000000000000000000000000000000000000000
0000000000000000ccc0cc00cc0ccc00c0cc0c00002c992500279925888cc888888cc88800055cdd000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000e2992200e299220048cc885048cc88505d50555000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000002222220022222200008888850088888500000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000888880008888800000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05666660056000560056666056666666056000560566666605666666056666605666666605666660005666660566666605666660056000560056666000566660
56600566056600560566006600056000056000560560000005600056056000005600005656600566056600000560000005600000056000560566006605660066
56000056056600560560005600056000056000560560000005600056056000005600005656000056056000000560000005600000056000560560005605600056
56000056056660560560005600056000056000560560000005600056056000005600005656000056056000000560000005600000056000560560005605600056
56000056056560560560005600056000056000560560000005666666056000005666666656000056056000000560000005600000056000560560005605600056
56000056056566560560005600056000056666660566666605666000056000005600000056000056056000000566666605600000056666660560005605600056
56666666056056560560005600056000056000560560000005666600056666605600000056666666056000000560000005666660056000560560005605600056
56000056056056660560005600056000056000560560000005656600000005605600000056000056056000000560000000000560056000560560005605600056
56000056056005660560005600056000056000560560000005605660000005605600000056000056056000000560000000000560056000560560005605600056
56000056056005660560005600056000056000560560000005600560000005605600000056000056056000000560000000000560056000560560005605600056
56000056056000560566056600056000056000560560000005600566000005605600000056000056056600000560000000000560056000560566056605660566
56000056056000560056666000056000056000560566666605600566056666605600000056000056005666660566666605666660056000560056666000566660
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56666666056666660566666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00056000056000000560005600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00056000056000000560005600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00056000056000000560005600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00056000056000000566666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00056000056666660566600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00056000056000000566660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00056000056000000565660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00056000056000000560566000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00056000056000000560056000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00056000056000000560056600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00056000056666660560056600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
990100003425030250272501d25018256132500f2500a250072500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4b0e00002802000000000002b030000000000026020000002802000000000002b030000000000026020000002802000000000002b030000000000026020000002802000000000002b03000000000002602000000
010e00000000024050230501c0500000000000000000000000000000000000000000000000000000000000000000024050230501a050000000000000000000000000000000000000000000000000000000000000
010e0000000002405023050180500000000000000000000000000000000000000000000000000000000000000000024050230501a050000000000000000000000000000000000000000000000000000000000000
bf0e00000455000000045500000004550000000455000000045500000004550000000455000000045500000002550000000255000000025500000002550000000255000000025500000002550000000255000000
bf0e00000055000000005500000000550000000055000000005500000000550000000055000000005500000002550000000255000000025500000002550000000255000000025500000002550000000255000000
bf0e00000455000000045500000010550000000455000000045500000004550000001055013550045500000002550000000255000000155500000002550000000255000000025500000015550175500255000000
bf0e000000550000000055000000185500000000550000000055000000005500000018550135500055000000025500000002550000001a5500000002550000000255000000025500000017550000001c55000000
010e00000455000000045500000004550000000455000000045500000004550000000455000000045500000004550000000455000000045500000004550000000455000000045500000004550000000455000000
010e00000255000000025500000002550000000255000000025500000002550000000255000000025500000002550000000255000000025500000002550000000255000000025500000002550000000255000000
010e00000055000000005500000000550000000055000000005500000000550000000055000000005500000000550000000055000000005500000000550000000055000000005500000000550000000055000000
010e00000000024040230401c04000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010e00000000024040230401a04000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000e00000450006550087000655000000065500000006550000000655000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9210000024630246300c6000c6000c600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
931000001265012650000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
931000000065000650000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
00 01424344
01 01420844
00 01420944
00 01420a44
00 01420944
00 0142080b
00 0142090c
00 01420a44
00 0142090c
00 0102040d
00 0103050d
00 0102060d
00 0103070d
00 0142080d
00 0142090d
00 01420a0d
00 0142090d
00 0102060d
02 0102070d

