```@meta
CurrentModule = RoseEngine
```

# RoseEngine

Documentation for [RoseEngine](https://github.com/MarkNahabedian/RoseEngine.jl).

I first learned abot rose engines from the
[ClixkSpring](https://www.youtube.com/@Clickspring) YouTube channel.
Other information and inspiration came from the channels of [Uri
Tuckman](https://www.youtube.com/@urituchmanpigeon) and [DM Tiffany
Timepieces](https://www.youtube.com/@DMTiffanyTimepieces).

A rose engine is similar to a lathe but has cams on the spindle which
can control the position of the cross slide and thus the radius of the
cutter from the axis of the spindle.

This can be modeled by a function that maps a parametric angle - the
rotation of the spindle - to the radius of the cutter from the
spindle's axis.  This function is implemented by the [`Rotor`](@ref)
struct.

Because each of the cams on a rose engine has an integer number of
lobes, the rose engine also has a way to offset the cam from the axis
of rotation by an initial phase angle.  A rose engine also has a way
to add an initial phase angle to the axis of rotation.  We model this
using [`PhasedRotor`](@ref).


## Wave Functions

`Rotor` expects a wave functioon.  These are the available wave functions

```@docs
triangle_wave
sine_wave
```

## Writing an SVG File

A real rose engine is a continuous, analog machine.  On a digital
computer we can only use discreet steps.  To generate our pattern we
use a sequence of discreet steps at which we compute the position of
the cutter.  This step size is specified by a `step_angle` parameter.
The graphic is generated starting with a `step_angle` of 0 and
incrementing it by `step_angle` until the cutter returns to its
starting position.  This is performed by [`svg_path_for_rotor`](@ref).

My CNC router (Shaper Origin) is driven by an SVG file.  Here's how I
can write one from this package:

```@example svg-example-1
using RoseEngine
rotor = Rotor(3, 1//2, 1//8, sine_wave)
render_rotors(joinpath(@__DIR__, "svg-example-1.svg"),
              map([ 0, 1//32, 2//32, 3//32 ]) do phase
                  PhasedRotor(rotor, phase)
              end,
              1//256)
```

Here's the resulting file:

```@raw html
<img src="svg-example-1.svg"
     width="50%"/>
```


```@example svg-example-2
using RoseEngine
rotor = Rotor(3, 1, 43//5, triangle_wave)
render_rotors(joinpath(@__DIR__, "svg-example-2.svg"),
              rotor,
              1//256)
```

```@raw html
<img src="svg-example-2.svg"
     width="50%"/>
```




## Index

```@index
```

## Other Definitions

```@autodocs
Modules = [RoseEngine]
```
