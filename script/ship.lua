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