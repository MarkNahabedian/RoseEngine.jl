using RoseEngine
using Test

@testset "triangle_wave" begin
    @test triangle_wave(0) == triangle_wave(1)
    @test triangle_wave.(0 : 1//8 : 1) == [ 0, 1//2, 1, 1//2, 0, -1//2, -1, -1//2, 0 ]
end

@testset "Rotor with triangle wave" begin
    let
        rotor = Rotor(3, 1, 1, triangle_wave)
        @test full_cycle_count(rotor) == 1
        @test rotor.(input_range(rotor, 1//8)) .- rotor.radius ==
            [ 0, 1//2, 1, 1//2, 0, -1//2, -1, -1//2, 0 ]
    end
    let
        rotor = Rotor(3, 1, 2, triangle_wave)
        @test full_cycle_count(rotor) == 2
        @test rotor.(input_range(rotor, 1//16)) .- rotor.radius ==
        [ 0//1, 1//8, 1//4, 3//8, 1//2, 5//8, 3//4, 7//8,
          1//1, 7//8, 3//4, 5//8, 1//2, 3//8, 1//4, 1//8,
          0//1, -1//8, -1//4, -3//8, -1//2, -5//8, -3//4, -7//8,
          -1//1, -7//8, -3//4, -5//8, -1//2, -3//8, -1//4, -1//8, 0//1 ]
    end
    let
        rotor = Rotor(3, 1, 3//4, triangle_wave)
        @test full_cycle_count(rotor) == 12
        @test rotor.(input_range(rotor, 1//16)) .- rotor.radius ==
            [ 0//1, 1//3, 2//3, 1//1, 2//3, 1//3,
              0//1, -1//3, -2//3, -1//1, -2//3, -1//3,

              0//1, 1//3, 2//3, 1//1, 2//3, 1//3,
              0//1, -1//3, -2//3, -1//1, -2//3, -1//3,

              0//1, 1//3, 2//3, 1//1, 2//3, 1//3,
              0//1, -1//3, -2//3, -1//1, -2//3, -1//3,

              0//1, 1//3, 2//3, 1//1, 2//3, 1//3,
              0//1, -1//3, -2//3, -1//1, -2//3, -1//3,

              0//1, 1//3, 2//3, 1//1, 2//3, 1//3,
              0//1, -1//3, -2//3, -1//1, -2//3, -1//3,

              0//1, 1//3, 2//3, 1//1, 2//3, 1//3,
              0//1, -1//3, -2//3, -1//1, -2//3, -1//3,

              0//1, 1//3, 2//3, 1//1, 2//3, 1//3,
              0//1, -1//3, -2//3, -1//1, -2//3, -1//3,

              0//1, 1//3, 2//3, 1//1, 2//3, 1//3,
              0//1, -1//3, -2//3, -1//1, -2//3, -1//3,

              0//1, 1//3, 2//3, 1//1, 2//3, 1//3,
              0//1, -1//3, -2//3, -1//1, -2//3, -1//3,

              0//1, 1//3, 2//3, 1//1, 2//3, 1//3,
              0//1, -1//3, -2//3, -1//1, -2//3, -1//3,

              0//1, 1//3, 2//3, 1//1, 2//3, 1//3,
              0//1, -1//3, -2//3, -1//1, -2//3, -1//3,

              0//1, 1//3, 2//3, 1//1, 2//3, 1//3,
              0//1, -1//3, -2//3, -1//1, -2//3, -1//3,

              0//1, 1//3, 2//3, 1//1, 2//3, 1//3,
              0//1, -1//3, -2//3, -1//1, -2//3, -1//3,

              0//1, 1//3, 2//3, 1//1, 2//3, 1//3,
              0//1, -1//3, -2//3, -1//1, -2//3, -1//3,

              0//1, 1//3, 2//3, 1//1, 2//3, 1//3,
              0//1, -1//3, -2//3, -1//1, -2//3, -1//3,

              0//1, 1//3, 2//3, 1//1, 2//3, 1//3,
              0//1, -1//3, -2//3, -1//1, -2//3, -1//3, 0//1 ]
    end
end

@testset "write SVG file" begin
    rotor = Rotor(3, 1, 3, triangle_wave)
    render_rotors(joinpath(@__DIR__, "first_rotor.svg"), rotor, 1//16, debug=true)
end

