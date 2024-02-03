function _init()
    n_star()
    score=0
    title_init()
    music(0)
    timer = 120 
    check = true
    end
    
    function _update60()
        --gameover
        if ship.hp==0 and check==true then
            ship.sprt=16
            music(-1)
            sfx(14)
            check = false
        end
        
        if (ship.hp>0) then
            --ship
            s_move()
            shoot()
            --moving enemy
            move_nmy()
        end
            --enemy
        if (timer ==0) then
            nmy_spw(120,rnd(100)+20,0.5,21)
        end
            
            
        move_bul()
        thr_index()
        
        
    
        --moving_stars
        for s in all (star) do
        
            if(s.spd<2) then
                s.col=10
            
            end
            s.x-=s.spd
            if (s.x<0) then s.x=128end
        end
    
        --moving_title
        
        if (timer <= 0)
        and (#title ~= 0) then
            move_title()
            timer-=1
        elseif (timer>0) then
            timer-=1
        end
        
    end
    
    function _draw()
        cls()
        for s in all(star) do
            pset(s.x,s.y, s.col)
        end
        if (ship.hp>0)then
            ship_spr()
            bul_spr()
        end
        nmy_spr()
        
        for l in all (title) do
        
            spr(l.spr1,26+(l.tx),l.ty)
            spr(l.spr2,26+(l.tx),l.ty+8)
            
        end
        for i=1, ship.hp do
            spr(36, 38+i*8,2)
        end
        
        for i=1,4 do
            spr(31+i,38+i*8,2)
        end
        if score >= 1000 then
        score_x = 56
        elseif score >=100 then
        score_x = 58
        elseif score >=10 then
        score_x = 60
        else
        score_x=61
        end
        print(score,score_x,10)
    
    end