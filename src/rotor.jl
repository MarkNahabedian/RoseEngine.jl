export AbstractRotor, Rotor, full_cycle_count, input_range, PhasedRotor


```
AbstractRotor is an abstract supertype for rrotors.
```
abstract type AbstractRotor end

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
struct Rotor <: AbstractRotor
    radius::Real
    amplitude::Real
    waves_per_rotation::Rational
    wave_function
end

radius(r::Rotor) = r.radius
amplitude(r::Rotor) = r.amplitude
waves_per_rotation(r::Rotor) = r.waves_per_rotation
wave_function(r::Rotor) = r.wave_function

"""
    full_cycle_count(::AbstractRotor)::Int

Returns the number of cycles that the `Rotor` should *rotate* such
that its `wave_function` returns to its starting point (same angle and
radius).  This is an integer number of full rotations of the rootor.
"""
full_cycle_count(r::AbstractRotor) = lcm(waves_per_rotation(r).num,
                                         waves_per_rotation(r).den)


"""
    input_range(::AbstractRotor, step_angle::Rational)

Returns a Julia `AbstractRange` that will fully generate the design of
the `Rotor` when the rotor function is applied to the values of that
range.
"""
input_range(r::AbstractRotor, step_angle::Rational) = 0 : step_angle : full_cycle_count(r)


function (r::Rotor)(angle)
    radius(r) + amplitude(r) * wave_function(r)((angle // waves_per_rotation(r)) % 1)
end


"""
    PhasedRotor(::Rotor, initial_phase_angle)

PhasedRotor encapsulates a Rotor to provide an initial phase angle
offset when drawing the rotor.
"""
struct PhasedRotor <: AbstractRotor
    rotor::Rotor
    initial_phase_angle::Rational
end

radius(r::PhasedRotor) = radius(r.rotor)
amplitude(r::PhasedRotor) = amplitude(r.rotor)
waves_per_rotation(r::PhasedRotor) = waves_per_rotation(r.rotor)
wave_function(r::PhasedRotor) = wave_function(r.rotor)


function (r::PhasedRotor)(angle)
    radius(r) + amplitude(r) *
        wave_function(r)(((angle + r.initial_phase_angle) // waves_per_rotation(r)) % 1)
end

