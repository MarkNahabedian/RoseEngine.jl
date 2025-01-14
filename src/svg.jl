using XML
using Printf

export render_rotors

const SVG_NAMESPACE = "http://www.w3.org/2000/svg"


"""
    svg_path_for_rotor(rotor::Rotor, step_angle::Rational)

Returns an SVG path expression suitable for the value of the `d`
attribute of an SVG `path` to draw the design specified by the
`Rotor`.  Also returns the minimum and maximum x and y coordinates of
the path.
"""
function svg_path_for_rotor(rotor::AbstractRotor, step_angle::Rational)
    points = []
    for angle in input_range(rotor, step_angle)
        radius = rotor(angle)
        x, y = radius * [ cos(2 * pi * angle), sin(2 * pi * angle) ]
        x = round(x; digits = 5)
        y = round(y; digits = 5)
        push!(points, (x, y))
    end
    min_x = minimum(p -> p[1], points)
    max_x = maximum(p -> p[1], points)
    min_y = minimum(p -> p[2], points)
    max_y = maximum(p -> p[2], points)
    
    path = let
        p = points[1]
        [ "M $(p[1]) $(p[2])" ]
    end
    for p in points[2:end]
        push!(path, "L $(p[1]) $(p[2])")
    end
    return join(path, " "), min_x, max_x, min_y, max_y
end


render_rotors(rotor::AbstractRotor, step_angle; kwargs...) = render_rotors([rotor], step_angle; kwargs...)

function render_rotors(rotors::Vector{<:AbstractRotor}, step_angle; debug=false)
    prf = map(r -> svg_path_for_rotor(r, step_angle), rotors)
    path_ds = map(first, prf)
    min_x = minimum(p -> p[2], prf)
    max_x = maximum(p -> p[3], prf)
    min_y = minimum(p -> p[4], prf)
    max_y = maximum(p -> p[5], prf)
    margin = max(max_x - min_x, max_y - min_y) * 0.05
    rotor_radii = if debug
        unique(map(r -> radius(r), rotors))
    else
        []
    end
    XML.Element("svg",
                map(rotor_radii) do r
                    XML.Element("circle";
                                cx=0, cy=0, r=r,
                                style="stroke: orange; fill: none; stroke-width: 1; vector-effect: non-scaling-stroke;")
                end...,
                map(zip(path_ds, rotors)) do (d, rotor)
                    XML.Element("g",
                                XML.Comment(" $rotor "),
                                XML.Element("path",
                                            d=d,
                                            style=join(["stroke: blue",
                                                        "fill: none",
                                                        "stroke-width: 1",
                                                        "vector-effect: non-scaling-stroke"
                                                        ], "; ")))
                end...;
                xmlns=SVG_NAMESPACE,
                viewBox=@sprintf("%3.3f %3.3f %3.3f %3.3f",
                                 min_x - margin, min_y - margin,
                                 max_x - min_x + 2 * margin,
                                 max_y - min_y + 2 * margin))
end

function render_rotors(filename::String, rotors, step_angle; kwargs...)
    elt = render_rotors(rotors, step_angle; kwargs...)
    XML.write(filename, elt)
end

