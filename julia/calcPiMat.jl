using Printf, Random

# inputs
inSeed = parse(Int64, ARGS[1])
trials = 1_000_000
batchSize = 100_000
total = trials * batchSize


function sim(throws, seed, darts)
  hits = 0
  rng = Xoshiro(seed)

  for i = 1:throws
    x = rand(rng, Float64, (darts,1))
    y = rand(rng, Float64, (darts,1))
    r = x.^2 + y.^2
    hits += count( r .<= 1)
  end
  
  myPi = 4 * hits / (throws * darts)
  error = (pi - myPi) / pi
  return myPi, error
end

#@time sim(trials, inSeed)
s = @timed sim(trials, inSeed, batchSize)
#@printf("Throws per Second = %g\n", trials / s.time)
#print("myPi,logerror,time,log(trials),seed,tps\n")
@printf("%1.10f,%1.10f,%f,%d,%d,%g\n", s.value[1], log10(abs(s.value[2])), s.time, log10(total), inSeed, total / s.time)
#@timev sim(trials, inSeed)
#sim(trials, inSeed)
