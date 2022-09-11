using UnROOT
using BelleAnalysis.Converter

f = ROOTFile("samples/mdst_000001_prod00016666_task10020000001.root.udst.root")
data, offsets = UnROOT.array(f, "tree/TrackFitResults/TrackFitResults.m_tau[5]", raw=true)
events = UnROOT.splitup(data, offsets, TrackFitResult)
