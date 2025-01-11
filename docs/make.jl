using RoseEngine
using Documenter

DocMeta.setdocmeta!(RoseEngine, :DocTestSetup, :(using RoseEngine); recursive=true)

makedocs(;
    modules=[RoseEngine],
    authors="MarkNahabedian <naha@mit.edu> and contributors",
    sitename="RoseEngine.jl",
    format=Documenter.HTML(;
        canonical="https://MarkNahabedian.github.io/RoseEngine.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/MarkNahabedian/RoseEngine.jl",
    devbranch="main",
)
