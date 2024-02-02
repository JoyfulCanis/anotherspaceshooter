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