export Rotor, full_cycle_count


"""
    Rotor(radius, amplitude, waves_per_rotation)

Rotor is a function that for a given angle, returns a radius from the
center of the Rotor's spindle.  In this package, angles are in units
of fractions of a full circle, arther than in degrees or radians.

`radius` is the radius at zero amplitude.

`amplitude` is the extent above and below `radius` of the range of the
"cutter".  The range of the Rotor funnction will be from `radius -
amplitude` to `radius + amplitude`.

`wave_function` is a function describing one cycle of the wave.  Its
domain goes from 0 to 1 and its range goes from -1 to 1.  See
[`triangle_wave`(@ref) as an example.

`waves_per_rotation` is the number of full oscillations of
`wave_function` per one turn of the `Rotor`.
"""
struct Rotor
    radius::Real
    amplitude::Real
    waves_per_rotation::Rational
    wave_function
end


"""
    full_cycle_count(::Rotor)::Int

Returns the number of cycles that the `Rotor` should *rotate* such
that its `wave_function` returns to its starting point (same angle and
radius).  This is an integer number of full rotations of the rootor.
"""
full_cycle_count(r::Rotor) = r.waves_per_rotation.num * r.waves_per_rotation.den


function (r::Rotor)(angle)
    r.radius + r.amplitude * r.wave_function((angle // r.waves_per_rotation) % 1)
end

