using UnROOT
using BelleAnalysis.Converter

f = ROOTFile("samples/B2Kpi_10000.root")
data, offsets = UnROOT.array(f, "tree/TrackFitResults/TrackFitResults.m_tau[5]", raw=true)
events = UnROOT.splitup(data, offsets, TrackFitResult)
