export triangle_wave, sine_wave


"""
    triangle_wave(p)

`triangle_wave` implements a symetric triangle wave suitable for use
as the `wave_function` of [`Rotor`](@ref).
"""
function triangle_wave(p)
    if 0 <= p <= 1//4
        p * 4
    elseif 1//4 < p <= 3//4
        1 - (p - 1//4) * 4
    elseif 3//4 < p <= 1
        -1 + (p - 3//4) * 4
    else
        error("Parameter $p must be >= 0 and <= 1")
    end
end


"""
    sine_wave(a)

`sine_wave` implements a sine wave suitable for use as the
`wave_function` of [`Rotor`](@ref).
"""
sine_wave(p) = sin(2 * pi * p)

