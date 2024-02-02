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