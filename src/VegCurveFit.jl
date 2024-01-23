module VegCurveFit

using LinearAlgebra
using Libdl
using Parameters
using Dates
using Statistics

include("DataTypes.jl")
include("tools.jl")
include("get_ylu.jl")

include("Optim/Optim.jl")
include("weights/wFUN.jl")


include("CurveFit/CurveFit.jl")

include("smooth_HANT/smooth_HANTS.jl")
include("smooth_SG/main_SG.jl")
include("smooth_whittaker/main_whittaker.jl")

end # module
