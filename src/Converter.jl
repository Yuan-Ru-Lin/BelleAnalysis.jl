module Converter

using UnROOT: CustomROOTStruct
import UnROOT: readtype

struct TrackFitResult <: CustomROOTStruct
    d0::Float32
    phi0::Float32
    omega::Float32
    z0::Float32
    tanlambda::Float32
end

function readtype(io::IO, T::Type{TrackFitResult})
    T(readtype(io, Float32), readtype(io, Float32), readtype(io, Float32), readtype(io, Float32), readtype(io, Float32))
end

function Base.show(io::IO, x::TrackFitResult)
    print(io, "(d₀ = $(x.d0), ϕ₀ = $(x.phi0), ω = $(x.omega), z₀ = $(x.z0), tanλ = $(x.tanlambda))")
end

export TrackFitResult

end
