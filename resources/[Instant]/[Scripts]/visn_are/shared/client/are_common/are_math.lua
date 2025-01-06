-- Leaked By: Leaking Hub | J. Snow | leakinghub.com

function linearConversion(oldMin, oldMax, oldValue, newMin, newMax)
    if oldValue <= 0 then
        oldValue = newMin
    end

    return ( (oldValue - oldMin) / (oldMax - oldMin)) * (newMax - newMin) + newMin
end

-- Leaked By: Leaking Hub | J. Snow | leakinghub.com