function array_sum(matrix)
    local sum = 0
    for i = 1,#matrix do -- iterate for rows
        for j = 1,#matrix[1] do
            sum = sum + matrix[i][j]
        end
    end
    return sum
end

function isKeyAvailable(table, element)
  for key, value in pairs(table) do
    if key == element then
      return true
    end
  end
  return false
end

function getIndex(matrix, value)
    for i = 1,#matrix do
        for j = 1,#matrix[1] do
            if matrix[i][j] == value then
                return {i,j}
            end
        end
    end
    return nil
end

function GenerateFlagArray()
--[[red = 1 green = 2 yellow = 3 orange = 4]]
    flag_array = {{3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
                  {3, 2, 2, 4, 4, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3},
                  {3, 2, 2, 4, 4, 3, 1, 3, 1, 1, 1, 3, 3, 3, 1, 1, 1, 1, 1, 3, 3, 3, 1, 3, 1, 3},
                  {3, 2, 2, 4, 4, 3, 1, 1, 1, 1, 3, 3, 3, 1, 3, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 3},
                  {3, 2, 2, 4, 4, 3, 1, 1, 3, 1, 1, 1, 3, 3, 1, 1, 1, 1, 1, 3, 3, 3, 1, 1, 1, 3},
                  {3, 2, 2, 4, 4, 3, 1, 1, 3, 1, 3, 3, 3, 3, 3, 1, 1, 1, 1, 1, 1, 1, 3, 1, 1, 3},
                  {3, 2, 2, 4, 4, 3, 1, 1, 3, 1, 3, 3, 3, 3, 3, 3, 3, 1, 3, 3, 3, 3, 1, 1, 1, 3},
                  {3, 2, 2, 4, 4, 3, 1, 1, 3, 1, 1, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 1, 3},
                  {3, 2, 2, 4, 4, 3, 1, 1, 3, 1, 1, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 1, 3},
                  {3, 2, 2, 4, 4, 3, 1, 1, 3, 1, 1, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 1, 3},
                  {3, 2, 2, 4, 4, 3, 1, 3, 3, 1, 1, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 1, 1, 3},
                  {3, 2, 2, 4, 4, 3, 1, 1, 3, 3, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 1, 3},
                  {3, 2, 2, 4, 4, 3, 1, 1, 3, 1, 3, 1, 1, 3, 3, 3, 1, 1, 3, 3, 3, 3, 3, 1, 1, 3},
                  {3, 2, 2, 4, 4, 3, 1, 1, 1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 3, 1, 1, 3, 3, 1, 1, 3},
                  {3, 2, 2, 4, 4, 3, 1, 1, 1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 3, 1, 1, 3, 1, 1, 1, 3},
                  {3, 2, 2, 4, 4, 3, 1, 3, 1, 1, 1, 1, 1, 3, 3, 1, 1, 3, 3, 1, 3, 3, 1, 3, 1, 3},
                  {3, 2, 2, 4, 4, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3},
                  {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3}}

    return flag_array
end

function InitializeBasket()
    red_array = {{0,0,0,0,0},{0,0,0,0,0},{0,0,0,0,0},{0,0,0,0,0},{0,0,0,0,0}}
    green_array = {{0,0,0,0,0},{0,0,0,0,0},{0,0,0,0,0},{0,0,0,0,0},{0,0,0,0,0}}
    yellow_array = {{0,0,0,0,0},{0,0,0,0,0},{0,0,0,0,0},{0,0,0,0,0},{0,0,0,0,0}}
    orange_array = {{0,0,0,0,0},{0,0,0,0,0},{0,0,0,0,0},{0,0,0,0,0},{0,0,0,0,0}}
    return red_array, green_array, yellow_array, orange_array
end

function GetBasketDetails(box_color, red_array, green_array, yellow_arrray, prange_array)
    red_grid_origin = {0.424, -0.241, 0.5}
    green_grid_origin = {-0.0260, -0.4160, 0.5}
    yellow_grid_origin = {-0.4760, -0.4160, 0.5}
    orange_grid_origin = {-0.9260, -0.266, 0.5}
    if box_color == 'red' then
        return red_grid_origin, red_array
    elseif box_color == 'green' then
        return green_grid_origin, green_array
    elseif box_color == 'yellow' then
        return yellow_grid_origin, yellow_array
    elseif box_color == 'orange' then 
        return orange_grid_origin, orange_array
    else
        error("invalid argument passed")
    end
    
end

function GetPossibleBasket(red_array, green_array, yellow_array, orange_array, arm01_target)
    box_counts = {array_sum(red_array), array_sum(green_array), array_sum(yellow_array), array_sum(orange_array)}
    mapping = {}
    mapping["red_basket"] = 1
    mapping["green_basket"] = 2
    mapping["yellow_basket"] = 3
    mapping["orange_basket"] = 4
    if isKeyAvailable(mapping, arm01_target) then
        remove_index = mapping[arm01_target]
        box_counts[remove_index] = 0
        max_count = math.max(unpack(box_counts))
        for i = 1, #box_counts do
            if box_counts[i] == max_count then
                loc = i
                break
            end
        end
        if max_count == 0 then
            basket_color = nil
            return basket_color
        end
    else
        max_count = math.max(unpack(box_counts))
        for i = 1, #box_counts do
            if box_counts[i] == max_count then
                loc = i
                break
            end
        end
        if max_count == 0 then
            basket_color = nil
            return basket_color
        end
    end
    if loc == 1 then
        basket_color = 'red'
    elseif loc == 2 then
        basket_color = 'green'
    elseif loc == 3 then
        basket_color = 'yellow'
    elseif loc == 4 then
        basket_color = 'orange'
    end
    return basket_color 

end

function FindVacantPositionOnFlag(flag_origin, box_dimensions, flag_array, color)
    local offset = 0.0021
    local length = box_dimensions[1] + offset
    local width = box_dimensions[2] + offset
    if color == 'red' then
        color_code = 1
    elseif color == 'green' then
        color_code = 2
    elseif color == 'yellow' then
        color_code = 3
    elseif color == 'orange' then
        color_code = 4
    end
  
    index = getIndex(flag_array, color_code) --get the index of the location
    row = index[1]
    col = index[2]
    flag_array[row][col] = 0
    x0 = flag_origin[1]
    y0 = flag_origin[2]
    z0 = flag_origin[3]

    -- THIS IS THE IMPORTANT LOCATION
    xt = x0 - length * (row-1)
    yt = y0 - width * (col-1)
    zt = z0
    flag_top_cordinates = {xt, yt, zt}
    return flag_top_cordinates, flag_array
end

        
function FindLocationInBasket(grid_origin,box_dimensions,grid_array,condition)
    --condition --> whether to put of get from the basket
    box_gap = 0.003 --the thickness of the grid
    --box dimensions
    length = box_dimensions[1] + box_gap
    width = box_dimensions[2] + box_gap
    heigth = box_dimensions[3]
    
    --assigning the grid origin
    x0 = grid_origin[1]
    y0 = grid_origin[2]
    z0 = grid_origin[3]

    if(condition == 'get') then
        index = getIndex(grid_array,1) --selecting the first pair of cordintes with a box
        row = index[1]
        col = index[2] 
        grid_array[row][col] = 0--update the grid with a zero
    elseif (condition == 'put') then
        index = getIndex(grid_array,0)--selecting the first pair of cordintes with a box
        row = index[1]
        col = index[2]
        grid_array[row][col] = 1 --update the grid with a one
    end
    
    --THIS IS THE IMPORTANT LOCATION
    xt = x0 - length*(col-1)
    yt = y0 + width*(row-1)
    zt = z0
    grid_top_cordinates = {xt, yt, zt}
    return grid_top_cordinates,grid_array
end


function getRandomBoxCoordinates(vision_sensor_handle,retFloats)
    --Might be no use we can pass the vision sensor capture position here
    coord = sim.getObjectPosition(vision_sensor_handle,-1)--(-1) is relative to world cordinates
    
    vs_x = coord[1]
    vs_y = coord[2]

    roughCoords_x = {}
    roughCoords_y = {}

    for i = 1,#retFloats-1,2 --Calculate Diatance to the blob from vision sensor axis
    do
        d = math.sqrt((retFloats[i])^2 + (retFloats[i+1])^2)
        if (d<0.3) then
            table.insert(roughCoords_x,(retFloats[i]*0.7 + vs_x))
            table.insert(roughCoords_y,(retFloats[i+1]*0.7 + vs_y))
        end
    end
    return roughCoords_x,roughCoords_y
end


function MoveLinear(target, pos)
    
    vel = 0.7
    accel = 70
    jerk = 50
    currentVel = {0,0,0,0}
    currentAccel = {0,0,0,0}
    maxVel = {vel,vel,vel,vel}
    maxAccel = {accel, accel, accel, accel}
    maxJerk = {jerk, jerk, jerk, jerk}
    targetVel = {0,0,0,0}

    quaternion = {0,0,0,0}

    sim.rmlMoveToPosition(target, -1, -1, currentVel, currentAccel, maxVel, maxAccel, maxJerk, pos, quaternion, targetVel)
end



function PickAndPlace(target, suctionPad_name, place_pos, above_place_pos, above_pickup_pos, pickup_pos)
    
    --move to the top pickup position
    MoveLinear(target, above_pickup_pos)

    --move to the pickup position and grab the box
    MoveLinear(target, pickup_pos)
    sim.setIntegerSignal(suctionPad_name..'_active', 1)
    sim.wait(0.2) --this delay is to give time to suc and release
    
    --move up to above pickup position
    MoveLinear(target, above_pickup_pos)

    --move up to above place position
    MoveLinear(target, above_place_pos)

    --move to place_pos and release box
    MoveLinear(target, place_pos)
    sim.setIntegerSignal(suctionPad_name..'_active', 0)
    sim.wait(0.2)  --this delay is to give time to suc and release

    --move to above place_pos
    MoveLinear(target, above_place_pos)
end


function tellMeColor()
    local data = sim.getStringSignal('colorinfo')
    sim.wait(0.1)
    if data then
       RGB = sim.unpackFloatTable(data)
    end

    local R = RGB[1]
    local G = RGB[2]
    local B = RGB[3]

    if ((0.500 < R and R < 0.690) and (0.450 < G and G < 0.570) and (0.008 < B and B < 0.065)) then
        return "yellow"
    elseif((0.500 < R and R < 0.690) and (0.200 < G and G < 0.350) and (0.000 <= B and B < 0.070)) then
        return "orange"
    elseif((0.000 <= R and R < 0.050) and (0.500 < G and G < 0.69) and (0.050 < B and B < 0.100))then
        return "green"
    elseif((0.500 < R and R < 0.690) and (0.000 <= G and G < 0.05) and (0.000 <= B and B < 0.050))then
        return "red"
    end
end


function Iterate_Arm_01(target, roughCoords_x, roughCoords_y, pickup_height, inter_height, conv_above_pos, conv_place_pos, ConvInterPos, ConvPickupPos, red_array, green_array, yellow_array, orange_array, box_dimensions, drop_height,Proximity_sensor)
    for i=1, #roughCoords_x, 1 do
        AbovePickupPos =  {roughCoords_x[i],roughCoords_y[i],pickup_height + inter_height}
        PickupPos =  {roughCoords_x[i],roughCoords_y[i],pickup_height}

        PickAndPlace(target, 'suctionPad', conv_place_pos, conv_above_pos, AbovePickupPos, PickupPos)
        PSensor_state,_,_,_,_ = sim.readProximitySensor(Proximity_sensor)

        if (PSensor_state > 0) then
            box_color = tellMeColor()
            print(box_color)
            grid_origin, target_array = GetBasketDetails(box_color, red_array, green_array, yellow_array, orange_array)
            grid_top_cordinates, grid_array = FindLocationInBasket(grid_origin, box_dimensions, target_array, 'put')
            grid_cordinates = {grid_top_cordinates[1], grid_top_cordinates[2], drop_height}
            PickAndPlace(target, 'suctionPad', grid_cordinates, grid_top_cordinates, ConvInterPos, ConvPickupPos)
            MoveLinear(target, conv_above_pos)
            --return the arrays because they are updated            
        end
    end
    return red_array, green_array, yellow_array, orange_array--Chnaged position to do 2 times only
    
end

--run a arm02 cycle
function Iterate_Arm_02(target,box_dimensions,PickupHeight,FlagPlaceHeight, FlagOrigin, red_array, green_array, yellow_array, orange_array, flag_array, arm1_target)
    Arm_2_IdlePos = {-0.6250, -0.8250, 0.76} -- This is the idle position
    if array_sum(flag_array) == 0 then --If there are no more vacncies task is done
        MoveLinear(target, Arm_2_IdlePos)
        print('Task Completed !!!')
    end
    box_color = GetPossibleBasket(red_array, green_array, yellow_array, orange_array, arm1_target)
    --print("Hey this is the color:", box_color)
    if box_color == nil then
        MoveLinear(target, Arm_2_IdlePos)
    else
        basket_origin, basket_array = GetBasketDetails(box_color, red_array, green_array, yellow_array, orange_array)
        PickAbovePos, Updated_array = FindLocationInBasket(basket_origin, box_dimensions, basket_array, 'get')
        PickPos = {PickAbovePos[1], PickAbovePos[2], PickupHeight}
         
        PlacePosAbove, flag_array = FindVacantPositionOnFlag(FlagOrigin, box_dimensions, flag_array, box_color)
        
        PlacePos = {PlacePosAbove[1], PlacePosAbove[2], FlagPlaceHeight}
            
        PickAndPlace(target, 'suctionPad_2', PlacePos, PlacePosAbove, PickAbovePos, PickPos)
        
        MoveLinear(target, Arm_2_IdlePos)--move to the idle position before nex take
    end
    return red_array, green_array, yellow_array, orange_array,flag_array 
end

function capture(sensor)
    local retFloat = {}
    local retStr = {}
    local res,packet1,packet2=sim.handleVisionSensor(sensor)
    if res>=0 then
        local blobCnt=packet2[1]
        table.insert(retStr,string.format("%d",blobCnt))
        local valCnt=packet2[2]
        for i=0,blobCnt-1,1 do
            local blobPositionX=packet2[2+valCnt*i+3]
            local blobPositionY=packet2[2+valCnt*i+4]
            local x=0.5-blobPositionX
            local y=blobPositionY-0.5
            table.insert(retFloat,x)
            table.insert(retFloat,-y)   
        end
        return retFloat
    end      
end

function sysCall_threadmain()
    base1 = sim.getObjectHandle('IRB4600')
    IK_target = sim.getObjectHandle('IRB4600_IkTarget')
    Suc_pad = sim.getObjectHandle('suctionPad')
    base2 = sim.getObjectHandle('IRB4600_2')
    IK_target_2 = sim.getObjectHandle('IRB4600_IkTarget_2')
    Suc_pad_2 = sim.getObjectHandle('suctionPad_2')
    Proximity_sensor = sim.getObjectHandle('Proximity_sensor')
    vs =sim.getObjectHandle('Vision_sensor')

    red_array, green_array, yellow_array, orange_array = InitializeBasket()
    
    CaptureHeight = 0.625 --vision capture height
    InterHeight = 0.6     --pick up above height from floor
    PickupHeight = 0.057  --pick up height(grab height) from floor
    CapturePos = {{1.3, 1.95},{0.95,1.95},{0.65,1.95},{0.35,1.95},{0.35,1.95},{0.05, 1.95},
                  {-0.25, 1.95},{-0.55, 1.95},{-0.85, 1.95},{-1.15, 1.95},{-1.45, 1.95},
                  {-1.75, 1.95},{-2.35, 2.25},{-2.05, 2.25},{-1.75, 2.25},{-1.45, 2.25},
                  {-1.15, 2.25},{-0.85, 2.25},{-0.55, 2.25},{-0.25, 2.25},{0.05, 2.25},{0.35, 2.25},
                  {0.65, 2.25},{0.95, 2.25},{1.25, 2.25},{1.25, 2.55},{0.95, 2.55},{0.65, 2.55},{0.35, 2.55},
                  {0.05, 2.55},{-0.25, 2.55},{-0.55, 2.55},{-0.85, 2.55},{-1.15, 2.55},{-1.45, 2.55},
                  {-1.75, 2.55},{-2.05, 2.55},{-2.35, 2.55},{1.25, 2.85},{0.95, 2.85},{0.65, 2.85},{0.35, 2.85},
                  {0.05, 2.85},{-0.25, 2.85},{-0.55, 2.85},{-0.85, 2.85},{-1.15, 2.85},{-1.45, 2.85},
                  {-1.75, 2.85},{-2.05, 2.85},{-2.35, 2.85},{0.05, 3.15},{-0.25,3.15},{-0.55, 3.15},{-0.85, 3.15},
                  {-1.15, 3.15},{-1.45, 3.15},{-1.15, 3.45},{-0.85, 3.45},{-0.55, 3.45},{-0.25,3.45},{0.05, 3.45},
                  {0.375, 1.64},{0.375, 1.315},{0.375, 1.015},{0.375, 0.665},{0.225, 0.465},{-0.1, 0.39},
                  {-0.4, 0.365},{-0.075, 0.4}, {-1.78, 1.657}, {-2.148, 1.657},{-2.305,1.857}}

    BeltPos = {0.85, 1.425, 0.6}    --Conveyer Belt Above Place pos
    ReleasePos = {0.85, 1.425, 0.465} --conveyer Belt Place pos
    
    ConvInterPos = {0.8430, 0.6574, 0.6}  --#coveyerabovepickup pos
    ConvPickupPos = {0.8430, 0.6574, 0.45} --#conveyer pickup pos
    box_dimensions = {0.07, 0.07, 0.07}
    drop_height = 0.065             --drop height to the baskets

    -------------------------------------------FLAG--------------------
    FlagArray = GenerateFlagArray()
    FlagOrigin = {0.7855,-0.6447, 0.3}
    FlagPlaceHeight = 0.1
    basket_pick_up_height = 0.058
    --------------------------------------------------------------------
    count = 1

    while true do--count <= 1
        --capturing the image
        CapturePoint = {CapturePos[count][1], CapturePos[count][2], CaptureHeight}
        MoveLinear(IK_target, CapturePoint) 
        Cordinates = capture(vs)
        roughCoords_x, roughCoords_y = getRandomBoxCoordinates(vs, Cordinates)
        
        --Iterate arm01 one cycle
        red_array, green_array, yellow_array, orange_array = Iterate_Arm_01(IK_target, roughCoords_x, roughCoords_y, PickupHeight, InterHeight, BeltPos, ReleasePos, ConvInterPos, ConvPickupPos, red_array, green_array, yellow_array, orange_array, box_dimensions, drop_height,Proximity_sensor)
        --return condition after completion
        if array_sum(FlagArray) == 0 then
            print('!!!!Task Succesfully Completed!!!!')
            break
        end
        
        basket_total = array_sum(red_array)+ array_sum(green_array)+array_sum(yellow_array)+array_sum(orange_array)
        for i = 1,basket_total do
            red_array, green_array, yellow_array, orange_array, FlagArray = Iterate_Arm_02(IK_target_2,box_dimensions,basket_pick_up_height,FlagPlaceHeight, FlagOrigin, red_array, green_array, yellow_array, orange_array, FlagArray, nil)
        end
        
        count = count + 1
        if count == (#CapturePos + 1) then
            count = 1
        end

    end
end

function sysCall_cleanup()
    -- Put some clean-up code here
end