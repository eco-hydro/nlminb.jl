using VegCurveFit
using BenchmarkTools
using Test

y, w, t = deserialize("data/phenofit_CA-NS6")

lambda = 2.0
include_cve = false

@testset "whit3" begin
  @time z, cve = whit3(y, w; lambda, include_cve)
  @time z2, cve2 = WHIT(y, w; d=3, lambda=2, include_cve)

  @test maximum(z - z2) <= 1e-10
  @test abs(cve - cve2) <= 1e-10
end

@testset "whit2" begin
  @time z, cve = whit2(y, w; lambda, include_cve)
  @time z2, cve2 = WHIT(y, w; d=2, lambda=2, include_cve)

  @test maximum(z - z2) <= 1e-10
  @test abs(cve - cve2) <= 1e-10
end

## whit3
include_cve = true
@btime z, cve = whit3($y, $w; lambda, include_cve);
@btime z2, cve2 = WHIT($y, $w; d=3, lambda=2, include_cve);

## whit2
@btime z, cve = whit2($y, $w; lambda, include_cve);
@btime z2, cve2 = WHIT($y, $w; d=2, lambda=2, include_cve);

begin
  using Plots
  plot()
  # plot(y, label="y", color="grey")
  plot!(z, label="fast")
  plot!(z2, label="matrix")
end
