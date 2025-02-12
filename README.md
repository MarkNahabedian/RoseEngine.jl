# RoseEngine

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://MarkNahabedian.github.io/RoseEngine.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://MarkNahabedian.github.io/RoseEngine.jl/dev/)
[![Build Status](https://github.com/MarkNahabedian/RoseEngine.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/MarkNahabedian/RoseEngine.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/MarkNahabedian/RoseEngine.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/MarkNahabedian/RoseEngine.jl)


I first learned abot rose engines from the
[ClixkSpring](https://www.youtube.com/@Clickspring) YouTube channel.
Other information and inspiration came from the channels of [Uri
Tuckman](https://www.youtube.com/@urituchmanpigeon) and [DM Tiffany
Timepieces](https://www.youtube.com/@DMTiffanyTimepieces).

An actual Rose engine costs a lot, but I thought that maybe I could
draw the art in software and cut it on a CNC router.

A rose engine is similar to a lathe but has cams on the spindle which
can control the position of the cross slide and thus the radius of the
cutter from the axis of the spindle.

It can be modeled by a function that maps a parametric angle, the
rotation of the spindle, to the radius of the cutter from the
spindle's center.  This function could be implemented by a struct with
fields for the radius and amplitude of the cutter's path and the number
of full spindle rotations and cycles of the wave to cut a complete
pattern.  The struct might be called a Rotor.

For cycloidal spirograph-like patters these functions could be
composed.  Application of the outermost function would determine the
center point (and thus a coordinate transformation) for the next
function.  The innermost composed function would plot a point.

The above is an aspirational description of this package.  See the
documentation for a description of what is implemented.

