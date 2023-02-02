using UnROOT
using BelleAnalysis.Converter

f = ROOTFile("samples/B2Kpi_100.root")
data, offsets = UnROOT.array(f, "tree/TrackFitResults/TrackFitResults.m_tau[5]", raw=true)
events = UnROOT.splitup(data, offsets, TrackFitResult)

using Plots
using Combinatorics
using LaTeXStrings
histogram([begin
           if t1.omega * t2.omega > 0.; return missing; end
               px1 = 0.004355344375 / abs(t1.omega) * cos(t1.phi0)
               px2 = 0.004355344375 / abs(t2.omega) * cos(t2.phi0)
               py1 = 0.004355344375 / abs(t1.omega) * sin(t1.phi0)
               py2 = 0.004355344375 / abs(t2.omega) * sin(t2.phi0)
               pz1 = 0.004355344375 / abs(t1.omega) * t1.tanlambda
               pz2 = 0.004355344375 / abs(t2.omega) * t2.tanlambda
               E1 = sqrt(0.140^2 + px1^2 + py1^2 + pz1^2)
               E2 = sqrt(0.495^2 + px2^2 + py2^2 + pz2^2)
               M = sqrt((E1 + E2)^2 - ((px1+px2)^2 + (py1+py2)^2 + (pz1 + pz2)^2))
               M
           end for event in events for (t1, t2) in combinations(event, 2)],
          bins=5.0:0.005:5.5,
          xlabel=L"$M_{K^\pm\pi^\mp}$ (GeV$/c^2$)"
         )
