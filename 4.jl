using HorizonSideRobots
r=Robot(15,15; animate=true)
function diagonal!(r)
    for side in (West, Sud, Ost, Nord)
        n = numsteps_putmarkers!(robot, side)
        along!(robot, inverse(side), n)
    end
    putmarker!(robot)
end

function numsteps_putmarkers!(r, side)
    num_steps=0
    while !isborder(robot,side) && !isborder(robot, next(side))
        move!(robot,side)
        move!(robot,next(side))
        num_steps += 1
        putmarker!(robot)
    end
    return num_steps
end

function along!(r, side, num_steps)
    for _i in 1:num_steps
        move!(r,side)
        move!(r,next(side))
    end
end

inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)
next(side::HorizonSide) = HorizonSide((Int(side) +1)% 4)
diagonal!(r)
numsteps_putmarkers!(r)   
along!(r)
    
