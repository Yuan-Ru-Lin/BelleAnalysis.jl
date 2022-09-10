module Converter

using UnROOT

struct TrackFitResult <: UnROOT.CustomROOTStruct
    d0::Float32
    phi0::Float32
    omega::Float32
    z0::Float32
    tanlambda::Float32
end

function UnROOT.readtype(io::IO, T::Type{TrackFitResult})
    T(readtype(io, Float32), readtype(io, Float32), readtype(io, Float32), readtype(io, Float32), readtype(io, Float32))
end

"""
function UnROOT.interped_data(rawdata, rawoffsets, ::Type{Vector{TrackFitResult}}, ::Type{J}) where {T, J <: UnROOT.JaggType}
    UnROOT.splitup(rawdata, rawoffsets, TrackFitResult)
end
"""

export TrackFitResult

end
