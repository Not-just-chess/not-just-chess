def is_obstructed?(current_location, destination, obstruction=nil)


    #Sets initial values for the inputs.  Each input should be an array with an x value and y value. Ex: [1,1]
    #Obstruction is optional.

    horizontal = false
    vertical = false

    x1 = current_location[0]
    y1 = current_location[1]
    x2 = destination[0]
    y2 = destination[1]
    
    #Calls an error if the destination does not exist on the board.

    if x2 < 1 || x2 > 8
        raise 'Invalid destination'
    end
    
    if y2 < 1 || y2 > 8
        raise 'Invalid destination'
    end

    #If there is an obstruction on the board, the coordinates are defined here.
    
    if obstruction != nil
        x3 = obstruction[0]
        y3 = obstruction[1]

        #The logic then determines which case it is: hortizontal, vertical, or diagonal.

        if y1 == y2
            horizontal = true
        elsif x1 == x2
            vertical = true
        else
            slope_1 = (y2-y1).to_f/(x2-x1).to_f
            slope_2 = (y2-y3).to_f/(x2-x3).to_f
        end

        #Each case is then handled individually by sorting an array and determining if the obstruction is in the middle.
    
        if horizontal && y1 == y3
            sorted = [x1,x2,x3].sort
            return sorted[1] == x3
        end
        
        if vertical && x1 == x3
            sorted = [y1, y2, y3].sort
            return sorted[1] == y3
        end

        #The only valid slope a chess piece can move at is 1 or -1 so an error is called for any other slope
        #(not counting knights, they jump over obstructions)

        if slope_1
            if slope_1 === slope_2 && slope_1.abs == 1
                sorted = [x1,x2,x3].sort
                return sorted[1] == x3
            end
            
            if slope_1.abs != 1
                raise 'Invalid move'
            end
        end
        
        
        false
        
    else 
        false
    end 
end