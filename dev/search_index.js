var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = RoseEngine","category":"page"},{"location":"#RoseEngine","page":"Home","title":"RoseEngine","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for RoseEngine.","category":"page"},{"location":"","page":"Home","title":"Home","text":"I first learned abot rose engines from the ClixkSpring YouTube channel. Other information and inspiration came from the channels of Uri Tuckman and DM Tiffany Timepieces.","category":"page"},{"location":"","page":"Home","title":"Home","text":"A rose engine is similar to a lathe but has cams on the spindle which can control the position of the cross slide and thus the radius of the cutter from the axis of the spindle.","category":"page"},{"location":"","page":"Home","title":"Home","text":"This can be modeled by a function that maps a parametric angle - the rotation of the spindle - to the radius of the cutter from the spindle's axis.  This function is implemented by the Rotor struct.","category":"page"},{"location":"#Wave-Functions","page":"Home","title":"Wave Functions","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Rotor expects a wave functioon.  These are the available wave functions","category":"page"},{"location":"","page":"Home","title":"Home","text":"triangle_wave","category":"page"},{"location":"#RoseEngine.triangle_wave","page":"Home","title":"RoseEngine.triangle_wave","text":"triangle_wave(p)\n\ntriangle_wave implements a symetric triangle wave suitable for use as the wave_function of Rotor.\n\n\n\n\n\n","category":"function"},{"location":"#Writing-an-SVG-File","page":"Home","title":"Writing an SVG File","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"A real rose engine is a continuous, analog machine.  On a digital computer we can only use discreet steps.  To generate our pattern we use a sequence of discreet steps at which we compute the position of the cutter.  This step size is specified by a step_angle parameter. The graphic is generated starting with a step_angle of 0 and incrementing it by step_angle until the cutter returns to its starting position.  This is performed by svg_path_for_rotor.","category":"page"},{"location":"","page":"Home","title":"Home","text":"My CNC router (Shaper Origin) is driven by an SVG file.  Here's how I can write one from this package:","category":"page"},{"location":"","page":"Home","title":"Home","text":"using RoseEngine\nrotor = Rotor(3, 3//4, 13//19, triangle_wave)\nrender_rotors(joinpath(@__DIR__, \"SVG-example-1.svg\"), rotor, 1//16)","category":"page"},{"location":"","page":"Home","title":"Home","text":"Here's the resulting file:","category":"page"},{"location":"","page":"Home","title":"Home","text":"<img src=\"SVG-example-1.svg\"/>","category":"page"},{"location":"#Index","page":"Home","title":"Index","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"#Other-Definitions","page":"Home","title":"Other Definitions","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Modules = [RoseEngine]","category":"page"},{"location":"#RoseEngine.Rotor","page":"Home","title":"RoseEngine.Rotor","text":"Rotor(radius, amplitude, waves_per_rotation)\n\nRotor is a function that for a given angle, returns a radius from the center of the Rotor's spindle.  In this package, angles are in units of fractions of a full circle, arther than in degrees or radians.\n\nradius is the radius at zero amplitude.\n\namplitude is the extent above and below radius of the range of the \"cutter\".  The range of the Rotor funnction will be from radius - amplitude to radius + amplitude.\n\nwave_function is a function describing one cycle of the wave.  Its domain goes from 0 to 1 and its range goes from -1 to 1.  See [triangle_wave(@ref) as an example.\n\nwaves_per_rotation is the number of full oscillations of wave_function per one turn of the Rotor.\n\n\n\n\n\n","category":"type"},{"location":"#RoseEngine.full_cycle_count-Tuple{Rotor}","page":"Home","title":"RoseEngine.full_cycle_count","text":"full_cycle_count(::Rotor)::Int\n\nReturns the number of cycles that the Rotor should rotate such that its wave_function returns to its starting point (same angle and radius).  This is an integer number of full rotations of the rootor.\n\n\n\n\n\n","category":"method"},{"location":"#RoseEngine.input_range-Tuple{Rotor, Rational}","page":"Home","title":"RoseEngine.input_range","text":"input_range(::Rotor, step_angle::Rational)\n\nReturns a Julia AbstractRange that will fully generate the design of the Rotor when the rotor function is applied to the values of that range.\n\n\n\n\n\n","category":"method"},{"location":"#RoseEngine.svg_path_for_rotor-Tuple{Rotor, Rational}","page":"Home","title":"RoseEngine.svg_path_for_rotor","text":"svg_path_for_rotor(rotor::Rotor, step_angle::Rational)\n\nReturns an SVG path expression suitable for the value of the d attribute of an SVG path to draw the design specified by the Rotor.  Also returns the minimum and maximum x and y coordinates of the path.\n\n\n\n\n\n","category":"method"},{"location":"#RoseEngine.triangle_wave-Tuple{Any}","page":"Home","title":"RoseEngine.triangle_wave","text":"triangle_wave(p)\n\ntriangle_wave implements a symetric triangle wave suitable for use as the wave_function of Rotor.\n\n\n\n\n\n","category":"method"}]
}
