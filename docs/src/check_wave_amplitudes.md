## Check Wave Amplitudes

### Triangle Wave

```@example triangle-wave-example
using RoseEngine
rotor = Rotor(3, 1//2, 1//8, triangle_wave)
render_rotors(joinpath(@__DIR__, "triangle-wave-example.svg"),
              rotor,
              1//256; debug=true)
```

```@raw html
<img src="../triangle-wave-example.svg"
     width="50%"/>
```


### Sine Wave

```@example sine-wave-example
using RoseEngine
rotor = Rotor(3, 1//2, 1//8, sine_wave)
render_rotors(joinpath(@__DIR__, "sine-wave-example.svg"),
              rotor,
              1//256; debug=true)
```

```@raw html
<img src="../sine-wave-example.svg"
     width="50%"/>
```


### Phased Rotors


```@example phased-sine-wave-example
using RoseEngine
rotor = Rotor(3, 1//2, 1//8, sine_wave)
render_rotors(joinpath(@__DIR__, "phased-sine-wave-example.svg"),
              map([ 0, 1//32, 1//16, 3//32 ]) do phase
                  PhasedRotor(rotor, phase)
              end,
              1//256; debug=true)
```

```@raw html
<img src="../phased-sine-wave-example.svg"
     width="50%"/>
```

